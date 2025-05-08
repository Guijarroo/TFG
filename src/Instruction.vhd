----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2025 12:10:09
-- Design Name: 
-- Module Name: Instruction - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction is
    Port ( read         : in STD_LOGIC;
           write        : in STD_LOGIC;
           instruction  : out STD_LOGIC_VECTOR(7 downto 0)
    );
           
end Instruction;

architecture Behavioral of Instruction is

begin
    process(read, write)  
    begin
        if read = '1' and write = '0' then 
            instruction <= "00001011";
        elsif write = '1' and read = '0' then 
            instruction <= "00001010";
        else
            instruction <= "00000000";
        end if;
    end process;

end Behavioral;
