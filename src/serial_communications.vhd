----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2025 10:55:21
-- Design Name: 
-- Module Name: Serial_Communications - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity serial_communications is
    Port (clk      : in  STD_LOGIC;
          rst      : in  STD_LOGIC;

          ---
          -- Comunicación con la CPU
          
          -- CPU --> SPI
          address     : in  STD_LOGIC_VECTOR (7 downto 0);
          instruction : in  STD_LOGIC_VECTOR (7 downto 0);
          data_down   : in  STD_LOGIC_VECTOR (7 downto 0);
          enable_down : in  STD_LOGIC;
          busy        : out STD_LOGIC;
          
          -- SPI --> CPU
          data_up     : out STD_LOGIC_VECTOR (7 downto 0);
          enable_up   : out STD_LOGIC;

          ---
          -- SPI comunicación con el esclavo
          cs       : out STD_LOGIC;
          sclk     : out STD_LOGIC;
          mosi     : out STD_LOGIC;
          miso     : in  STD_LOGIC
    );
end serial_communications;

architecture Behavioral of serial_communications is

    -- Definición de estados / flag de lectura/escritura
    type state_type is (IDLE, SEND_INSTRUCTION, SEND_ADDRESS, READ, WRITE, READ_UP, DONE);
    type fr_type is (IDLE, WRITE, READ);

    -- Constantes para las instrucciones
    constant INSTRUCTION_WRITE : std_logic_vector(7 downto 0) := "00001010"; -- X"0A"
    constant INSTRUCTION_READ  : std_logic_vector(7 downto 0) := "00001011"; -- X"0B"
    
    -- Constantes para los contadores
    constant HALF_SCLK      : integer := 8;
    constant FULL_SCLK      : integer := 16;
    constant WORD           : integer := 8;
    constant WAIT_TIME      : integer := 10;
    
    -- Registros para los contadores
    signal cr_reg, cr_next : integer range 0 to 15; -- unsigned(3 downto 0);
    signal br_reg, br_next : integer range 0 to 7;
    signal dr_reg, dr_next : integer range 0 to 9;
    
    -- Registro de flag de RW
    signal fr_reg, fr_next : fr_type;

    -- Registros de Salidas a CPU
    signal data_up_reg, data_up_next        : STD_LOGIC_VECTOR (7 downto 0);
--  signal enable_up_reg, enable_up_next    : STD_LOGIC;
--  signal busy_reg, busy_next              : STD_LOGIC;
    
    -- Registros de Entradas a CPU
    signal address_reg, address_next         : STD_LOGIC_VECTOR(7 downto 0);
    signal instruction_reg, instruction_next : STD_LOGIC_VECTOR(7 downto 0);
    signal data_down_reg, data_down_next     : STD_LOGIC_VECTOR(7 downto 0);
        
    -- Registros de SPI
--    signal cs_reg, cs_next     : STD_LOGIC;
--    signal mosi_reg, mosi_next : STD_LOGIC;
--    signal sclk_reg, sclk_next : STD_LOGIC;
    
    -- Registro de estado
    signal state_reg, state_next : state_type;
    
begin
    
    ---
    -- SR + DR
    reg: process(clk, rst)
        begin
            if rst = '0' then
                state_reg               <= IDLE;           
            elsif rising_edge(clk) then
                state_reg               <= state_next;
                -- Internos
                cr_reg                  <= cr_next;
                br_reg                  <= br_next;
                dr_reg                  <= dr_next;
                fr_reg                  <= fr_next;
                -- CPU
                address_reg             <= address_next;
                instruction_reg         <= instruction_next;
                data_down_reg           <= data_down_next;
                data_up_reg             <= data_up_next;
            end if;          
    end process;

    ---
    -- NSL + DL + OL
    logic: process(
        -- Estado
        state_reg,
        -- Entradas
        address, instruction, data_down, enable_down, miso,
        -- Registros de datos
        cr_reg, br_reg, dr_reg, fr_reg,
        address_reg, instruction_reg, data_down_reg, data_up_reg
    )
    begin
        ---
        -- Registros por defecto
        state_next       <= state_reg;
        
        -- Internos
        cr_next          <= cr_reg;
        br_next          <= br_reg;
        dr_next          <= dr_reg;
        fr_next          <= fr_reg;
        
        -- CPU
        address_next     <= address_reg;
        instruction_next <= instruction_reg;
        data_down_next   <= data_down_reg;
        data_up_next     <= data_up_reg;

        ---
        -- Salidas por defecto
        
        -- CPU
        data_up <= data_up_reg;
        busy <= '1';
        enable_up <= '0';
        
        -- SPI
        cs <= '1';
        mosi <= '1';
        sclk <= '0';

        case state_reg is 
            when IDLE =>
                -- Salidas
                busy <= '0';
                
                if enable_down = '1' then
                    if instruction = INSTRUCTION_READ then
                        fr_next <= READ;
                        
                        br_next <= 0;
                        cr_next <= 0;
                        dr_next <= 0;
                        address_next <= address;
                        instruction_next <= instruction;
                        data_down_next <= data_down;
                        
                        state_next <= SEND_INSTRUCTION;
                        
                    elsif instruction = INSTRUCTION_WRITE then
                        fr_next <= WRITE;
                        
                        br_next <= 0;
                        cr_next <= 0;
                        address_next <= address;
                        instruction_next <= instruction;
                        data_down_next <= data_down;
                        
                        state_next <= SEND_INSTRUCTION;
                        
                    else
                        fr_next <= IDLE;
                        state_next <= IDLE;
                    end if;
                else
                    state_next <= IDLE;
                end if;
                
            when SEND_INSTRUCTION =>
                -- Salidas
                cs <= '0';
                mosi <= instruction_reg(7);
                
                if cr_reg < HALF_SCLK then
                    sclk <= '0';
                else
                    sclk <= '1';
                end if;
                if cr_reg + 1 < FULL_SCLK then
                    cr_next <= cr_reg + 1; 
                    state_next <= SEND_INSTRUCTION;
                else
                    cr_next <= 0;
                    instruction_next <= instruction_reg(6 downto 0) & '0';
                    if br_reg + 1 < WORD then
                        br_next <= br_reg + 1;
                        state_next <= SEND_INSTRUCTION;
                    else
                        br_next <= 0;
                        state_next <= SEND_ADDRESS;
                    end if;
                end if;
            
             when SEND_ADDRESS =>      
                -- Salidas                                                         
                 cs <= '0';                                                                    
                 mosi <= address_reg(7);
                                                          
                 if cr_reg < HALF_SCLK then                                                         
                     sclk <= '0';                                                              
                 else                                                                               
                     sclk <= '1';                                                              
                 end if;                                                                            
                 if cr_reg + 1 < FULL_SCLK then                                                         
                     cr_next <= cr_reg + 1;                                                        
                     state_next <= SEND_ADDRESS;                                                
                 else                                                                               
                     cr_next <= 0;                                                                  
                     address_next <= address_reg(6 downto 0) & '0'; 
                     if br_reg + 1 < word then                                                          
                         br_next <= br_reg + 1 ;                                                    
                         state_next <= SEND_ADDRESS;                                            
                     else                                                                           
                         br_next <= 0;                                                          
                         if fr_reg = READ then 
                            state_next <= READ;
                         elsif fr_reg = WRITE then
                            state_next <= WRITE;
                         else 
                            state_next <= IDLE;
                         end if;                                               
                     end if;                                                                        
                 end if;                                                                            
        
             when READ =>
                 -- Salidas
                 cs <= '0';
                 
                 if cr_reg < HALF_SCLK then
                     sclk <= '0';
                 else
                     sclk <= '1';
                 end if;
                 
                 if cr_reg + 1 < FULL_SCLK then
                     cr_next <= cr_reg + 1 ; 
                     state_next <= READ;
                 else
                     cr_next <= 0;
                     data_up_next <= data_up_reg(6 downto 0) & miso;
                     if br_reg + 1 < word then
                         br_next <= br_reg + 1 ;
                         state_next <= READ;
                     else
                         br_next <= 0;
                         state_next <= READ_UP;
                     end if;
                 end if;
                 
             when WRITE =>
                 -- Salidas
                 cs <= '0';
                 mosi <= data_down_reg(7);
                 
                 if cr_reg < HALF_SCLK then
                     sclk <= '0';
                 else
                     sclk <= '1';
                 end if;
                 if cr_reg + 1 < FULL_SCLK then
                     cr_next <= cr_reg + 1 ; 
                     state_next <= WRITE;
                 else
                     cr_next <= 0;
                     data_down_next <= data_down_reg(6 downto 0) & '0';
                     if br_reg + 1 < word then
                         br_next <= br_reg + 1;
                         state_next <= WRITE;
                     else
                         br_next <= 0;
                         state_next <= DONE;
                     end if;
                 end if;
              
             when READ_UP =>
                 -- Salidas
                 enable_up <= '1';
                 
                 state_next <= DONE;
              
             when DONE =>
                 if dr_reg + 1 < WAIT_TIME then
                     dr_next <= dr_reg + 1; 
                     state_next <= DONE;
                 else
                     dr_next <= 0;
                     state_next <= IDLE;
                 end if;                                  
           
          end case;

    end process;
    
end Behavioral;
