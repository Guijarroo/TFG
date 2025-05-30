----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2025
-- Design Name: 
-- Module Name: SPI_Continuous - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Lee continuamente valores SPI y escribe en Coordinates_Registers
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

entity SPI_Recurrente is
    generic (
        baddr : natural := 16#00500000#
    );
    port (
        clk         : in  STD_LOGIC;
        rst         : in  STD_LOGIC;
        
        address     : out STD_LOGIC_VECTOR(7 downto 0);
        instruction : out STD_LOGIC_VECTOR(7 downto 0);
        data_down   : out STD_LOGIC_VECTOR(7 downto 0);
        enable_down : out STD_LOGIC;
        
        data_up     : in  STD_LOGIC_VECTOR(7 downto 0);
        enable_up   : in  STD_LOGIC;
        busy        : in  STD_LOGIC;
        
        cpu_address : out STD_LOGIC_VECTOR(31 downto 0);
        cpu_dataout : out STD_LOGIC_VECTOR(31 downto 0);
        write       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end SPI_Recurrente;

architecture Behavioral of SPI_Recurrente is
    -- Estados
    type state_type is (IDLE, SEND_X, SEND_Y, SEND_Z, CONTROL, DONE);
    signal state_reg, state_next : state_type;
    
    -- Constantes
    constant X_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr, 32));
    constant Y_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr + 4, 32));
    constant Z_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr + 8, 32));
    constant INSTRUCTION_READ : STD_LOGIC_VECTOR(7 downto 0) := "00001011";
    
    -- Registros
    signal address_reg, address_next         : STD_LOGIC_VECTOR(7 downto 0);
    signal instruction_reg, instruction_next : STD_LOGIC_VECTOR(7 downto 0);
    
    signal data_down_reg, data_down_next     : STD_LOGIC_VECTOR(7 downto 0);
    signal enable_down_reg, enable_down_next : STD_LOGIC;
    
    signal cpu_address_reg, cpu_address_next : STD_LOGIC_VECTOR(31 downto 0);
    signal cpu_dataout_reg, cpu_dataout_next : STD_LOGIC_VECTOR(31 downto 0);
    signal write_reg, write_next             : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    -- Actualizaci�n de registros
    process(clk, rst)
    begin
        if rst = '0' then
            state_reg <= IDLE;
            
            address_reg <= (others => '0');
            instruction_reg <= (others => '0');
            
            data_down_reg <= (others => '0');
            enable_down_reg <= '0';
            
            cpu_address_reg <= (others => '0');
            cpu_dataout_reg <= (others => '0');
            write_reg <= "0000";
            
        elsif rising_edge(clk) then
            state_reg <= state_next;
            
            address_reg <= address_next;
            instruction_reg <= instruction_next;
            
            data_down_reg <= data_down_next;
            enable_down_reg <= enable_down_next;
            
            cpu_address_reg <= cpu_address_next;
            cpu_dataout_reg <= cpu_dataout_next;
            write_reg <= write_next;
        end if;
    end process;
    
    -- L�gica de estados
    process(state_reg, address_reg, instruction_reg, data_down_reg, enable_down_reg,
            cpu_address_reg, cpu_dataout_reg, write_reg, busy, enable_up, data_up)
    begin
        state_next       <= state_reg;
        
        address_next     <= address_reg;
        instruction_next <= instruction_reg;
        
        data_down_next   <= (others => '0');
        enable_down_next <= '0';
        
        cpu_address_next <= cpu_address_reg;
        cpu_dataout_next <= cpu_dataout_reg;
        write_next       <= "0000";
        
        case state_reg is
            when IDLE =>
                state_next <= SEND_X;
            
            when SEND_X =>
                enable_down_next <= '1';
                address_next <= X_AXIS(7 downto 0);
                instruction_next <= INSTRUCTION_READ;
                cpu_address_next <= X_AXIS;
                state_next <= CONTROL;
            
            when SEND_Y =>
                enable_down_next <= '1';
                address_next <= Y_AXIS(7 downto 0);
                instruction_next <= INSTRUCTION_READ;
                cpu_address_next <= Y_AXIS;
                state_next <= CONTROL;
            
            when SEND_Z =>
                enable_down_next <= '1';
                address_next <= Z_AXIS(7 downto 0);
                instruction_next <= INSTRUCTION_READ;
                cpu_address_next <= Z_AXIS;
                state_next <= CONTROL;
            
            when CONTROL =>
                if busy = '0' and enable_up = '1' then
                    cpu_dataout_next <= X"000000" & data_up;
                    state_next <= DONE;
                end if;
            
            when DONE =>
                if (cpu_address_reg = X_AXIS or cpu_address_reg = Y_AXIS or cpu_address_reg = Z_AXIS)then 
                    if cpu_address_reg = X_AXIS then
                        state_next <= SEND_Y;
                    elsif cpu_address_reg = Y_AXIS then
                        state_next <= SEND_Z;
                    elsif cpu_address_reg = Z_AXIS then
                        state_next <= SEND_X;
                    else
                        state_next <= IDLE;
                    end if;
                end if;
        end case;
    end process;
    
    -- Asignaciones de salida
    address <= address_reg;
    instruction <= instruction_reg;
    
    data_down <= data_down_reg;     -- WRITE
    write <= write_reg;             -- WRITE
    
    enable_down <= enable_down_reg;
    cpu_address <= cpu_address_reg;
    cpu_dataout <= cpu_dataout_reg;
    
    
end Behavioral;