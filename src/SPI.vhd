----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2025
-- Design Name: 
-- Module Name: SPI - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Interfaz SPI entre CPU y Serial_Communications
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity SPI is
generic (
    baddr: natural := 16#00500000#
);

Port ( clk: in STD_LOGIC;
       rst: in STD_LOGIC;

       -- System bus
       cpu_address: in STD_LOGIC_VECTOR(31 downto 0);
       cpu_dataout: in STD_LOGIC_VECTOR(31 downto 0);
       cpu_datain: out STD_LOGIC_VECTOR(31 downto 0);
       
       read:  in STD_LOGIC;
       write: in STD_LOGIC_VECTOR(3 downto 0);

       -- Salidas hacia Serial_Comunications
       address     : out  STD_LOGIC_VECTOR (7 downto 0);
       instruction : out  STD_LOGIC_VECTOR (7 downto 0);
       enable_down : out  STD_LOGIC;
       data_down   : out  STD_LOGIC_VECTOR (7 downto 0);
       
       -- Entradas desde Serial_Comunications
       data_up     : in STD_LOGIC_VECTOR (7 downto 0);
       enable_up   : in STD_LOGIC;
       busy        : in STD_LOGIC
 
);

end SPI;

architecture Behavioral of SPI is

    -- Definición de estados
    type state_type is (IDLE, SEND, CONTROL, DONE);
    -- Registro de estado
    signal state_reg, state_next : state_type;
    
    -- Constantes para direcciones completas (32 bits)
    constant X_AXIS   : STD_LOGIC_VECTOR(31 downto 0) := STD_LOGIC_VECTOR(to_unsigned(baddr, 32)); -- baddr + 0x0
    constant Y_AXIS   : STD_LOGIC_VECTOR(31 downto 0) := STD_LOGIC_VECTOR(to_unsigned(baddr + 4, 32)); -- baddr + 0x4
    constant Z_AXIS   : STD_LOGIC_VECTOR(31 downto 0) := STD_LOGIC_VECTOR(to_unsigned(baddr + 8, 32)); -- baddr + 0x8
    constant ALL_AXIS : STD_LOGIC_VECTOR(31 downto 0) := STD_LOGIC_VECTOR(to_unsigned(baddr + 12, 32)); -- baddr + 0xC
   
    -- Constantes para las instrucciones
    constant INSTRUCTION_WRITE : STD_LOGIC_VECTOR(7 downto 0) := "00001010"; -- X"0A"
    constant INSTRUCTION_READ  : STD_LOGIC_VECTOR(7 downto 0) := "00001011"; -- X"0B"

    -- Registros de Entradas de CPU
    signal enable_down_reg, enable_down_next   : STD_LOGIC;
    signal address_reg, address_next           : STD_LOGIC_VECTOR(7 downto 0);
    signal instruction_reg, instruction_next   : STD_LOGIC_VECTOR(7 downto 0);
    signal data_down_reg, data_down_next       : STD_LOGIC_VECTOR(7 downto 0);
    signal cpu_datain_reg, cpu_datain_next     : STD_LOGIC_VECTOR(31 downto 0);

    
begin

    reg: process(clk, rst)
        begin
            if rst = '0' then
                state_reg               <= IDLE;           
            elsif rising_edge(clk) then
                state_reg               <= state_next;
                address_reg             <= address_next;
                instruction_reg         <= instruction_next;
                cpu_datain_reg          <= cpu_datain_next;
                enable_down_reg         <= enable_down_next;                
                data_down_reg           <= data_down_next;                
            end if;          
    end process;


    logic: process(state_reg, cpu_address, write, read, cpu_dataout,
                   address_reg, instruction_reg, data_down_reg, cpu_datain_reg,
                   enable_down_reg, busy, enable_up, data_up)
    begin
        ---
        -- Registros por defecto
        state_next       <= state_reg;
        
        -- CPU
        address      <= address_reg;
        instruction  <= instruction_reg;
        cpu_datain   <= cpu_datain_reg;
        data_down    <= data_down_reg;
        enable_down  <= enable_down_reg;


        case state_reg is 
            when IDLE =>                
                if ((cpu_address = X_AXIS) or (cpu_address = Y_AXIS) or (cpu_address = Z_AXIS)) and ((write = "1111") or (read = '1')) then 
                    state_next <= SEND;                            
                else
                    state_next <= IDLE;
                end if;
                
            when SEND =>
                enable_down_next <= '1';
                address_next <= cpu_address(7 downto 0); 
                if (write = "1111") then 
                    instruction_next <= INSTRUCTION_WRITE;
                    data_down_next <= cpu_dataout(7 downto 0);
                    state_next <= CONTROL;                            
                elsif (read = '1') then
                    instruction_next <= INSTRUCTION_READ;
                    state_next <= CONTROL;
                end if; 
            
             when CONTROL =>   
                if (busy = '0') and (enable_up ='1') then
                    state_next <= DONE;
                else
                    state_next <= CONTROL;
                end if;  
                                               
             when DONE =>   
                cpu_datain_next <= X"000000" & data_up;
                state_next <= IDLE;
                
        end case;
                         
    end process;
    
end Behavioral;
