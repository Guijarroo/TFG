----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2025
-- Design Name: 
-- Module Name: Coordinates_Registers - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Almacena registros para coordenadas X, Y, Z
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

entity Registers is
    generic (
        baddr : natural := 16#00500000#
    );
    port (
        clk         : in  STD_LOGIC;
        rst         : in  STD_LOGIC;
        
        cpu_address : in  STD_LOGIC_VECTOR(31 downto 0);
        cpu_dataout : in  STD_LOGIC_VECTOR(31 downto 0);
        cpu_datain  : out STD_LOGIC_VECTOR(31 downto 0);
        
        read        : in  STD_LOGIC;
        write       : in  STD_LOGIC_VECTOR(3 downto 0)
    );
end Registers;

architecture Behavioral of Registers is
    -- Constantes
    constant X_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr, 32));
    constant Y_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr + 4, 32));
    constant Z_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr + 8, 32));
    
    -- Registros
    signal x_reg, y_reg, z_reg : STD_LOGIC_VECTOR(31 downto 0);
    signal cpu_datain_reg      : STD_LOGIC_VECTOR(31 downto 0);
    
begin
    -- Proceso de actualización
    process(clk, rst)
    begin
        if rst = '0' then
            x_reg <= (others => '0');
            y_reg <= (others => '0');
            z_reg <= (others => '0');
            cpu_datain_reg <= (others => '0');
        elsif rising_edge(clk) then
        
            -- Lectura
            if read = '1' then
                if cpu_address = X_AXIS then
                    cpu_datain_reg <= x_reg;
                elsif cpu_address = Y_AXIS then
                    cpu_datain_reg <= y_reg;
                elsif cpu_address = Z_AXIS then
                    cpu_datain_reg <= z_reg;
                else
                    cpu_datain_reg <= (others => '0');
                end if;
            end if;
        end if;
    end process;
    
    cpu_datain <= cpu_datain_reg;
    
end Behavioral;