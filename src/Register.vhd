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

library work;
use work.sbus.all;

entity Registers is
    generic (
        baddr : natural := 16#00500000#
    );
    port (
        clk         : in  STD_LOGIC;
        rst         : in  STD_LOGIC;
        
        -- System bus
        sin  : in  sbus_dn_t;
        sout : out sbus_up_t;
        
        -- Comunicación Controll        
        enable_registers : in STD_LOGIC;
        axis_addr        : in STD_LOGIC_VECTOR(31 downto 0);
        controll_rdata   : in STD_LOGIC_VECTOR(31 downto 0)
        
        );
end Registers;

 architecture Behavioral of Registers is
    -- Constantes
    constant X_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr, 32));
    constant Y_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr + 4, 32));
    constant Z_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr + 8, 32));
    
    -- Registros
    signal x_reg, x_next : STD_LOGIC_VECTOR(31 downto 0); 
    signal y_reg, y_next : STD_LOGIC_VECTOR(31 downto 0);
    signal z_reg, z_next : STD_LOGIC_VECTOR(31 downto 0);
    signal sout_rdata_reg, sout_rdata_next : STD_LOGIC_VECTOR(31 downto 0);
    
begin
    -- Proceso de actualización
    process(clk, rst)
    begin
        if rst = '0' then
            x_reg <= (others => '0');
            y_reg <= (others => '0');
            z_reg <= (others => '0');
            sout_rdata_reg <= (others => '0');
            
        elsif rising_edge(clk) then
            x_reg            <= x_next;
            y_reg            <= y_next;
            z_reg            <= z_next;
            sout_rdata_reg   <= sout_rdata_next;
            
            -- Actualización de Registros
            if enable_registers = '1' then
                if axis_addr = X_AXIS then
                    x_next <= controll_rdata;
                elsif axis_addr = Y_AXIS then
                    y_next <= controll_rdata;
                elsif axis_addr = Z_AXIS then
                    z_next <= controll_rdata;
                end if;
            end if;
            
            -- Lectura
            if sin.rstb = '1' then
                if sin.addr = X_AXIS then
                    sout_rdata_next  <= x_reg;
                elsif sin.addr = Y_AXIS then
                    sout_rdata_next <= y_reg;
                elsif sin.addr = Z_AXIS then
                    sout_rdata_next <= z_reg;
                end if;
            end if;
        end if;
    end process;
    
    sout.rdata <= sout_rdata_reg;
    
end Behavioral;