----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2025
-- Design Name: 
-- Module Name: Sync_Debouncer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Synchronizes and debounces a button input signal using edge detection
--              with AND logic as described (sync_reg2 AND NOT delayed_reg).
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.02 - Updated for edge detection with AND logic
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Sync_Debouncer is
    Port ( clk     : in  STD_LOGIC;
           rst     : in  STD_LOGIC;
           btn_in  : in  STD_LOGIC;
           btn_out : out STD_LOGIC);
end Sync_Debouncer;

architecture Behavioral of Sync_Debouncer is
    type state_type is (IDLE, COUNTING);
    signal state_reg, state_next : state_type;
    
    -- Registros para Sincronización
    signal sync_reg1, sync_reg2 : STD_LOGIC;   
    
    -- Registro para Detección de Flancos
    signal delayed_reg : STD_LOGIC;
    signal transition : STD_LOGIC;
    
    -- Registros para Debouncing
    constant DEBOUNCE_TIME : integer := 1000000; -- 100 MHz (1000000 ciclos)
    signal debounce_counter_reg, debounce_counter_next : integer range 0 to DEBOUNCE_TIME;

begin
    -- Sincronización
    sync_process: process(clk, rst)
    begin
        if rst = '0' then
            sync_reg1 <= '0';
            sync_reg2 <= '0';
            delayed_reg <= '0';
            debounce_counter_reg <= 0;
            state_reg <= IDLE;
        elsif rising_edge(clk) then
            sync_reg1 <= btn_in;      
            sync_reg2 <= sync_reg1;   
            delayed_reg <= sync_reg2;
            state_reg <= state_next;
            debounce_counter_reg <= debounce_counter_next;
        end if;
    end process;

    -- Detección de flanco 
    transition <= sync_reg2 and not delayed_reg;
    
    -- Debouncing
    debounce_process: process(state_reg, transition, debounce_counter_reg)
    begin
    state_next <= state_reg;
    debounce_counter_next <= debounce_counter_reg;
    btn_out <= '0';
    
        if state_reg = IDLE then
            if transition = '1' then
                debounce_counter_next <= 0;
                state_next <= COUNTING;
                btn_out <= '1'; 
            end if;
        else
            if debounce_counter_reg< DEBOUNCE_TIME then
                debounce_counter_next <= debounce_counter_reg +1;
            else
                state_next <= IDLE;
            end if;
        end if;
    end process;

end Behavioral;