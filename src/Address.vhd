----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2025 12:10:09
-- Design Name: 
-- Module Name: Adress - Behavioral
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

entity Address is
    Port ( zero     : in STD_LOGIC;
           one      : in STD_LOGIC;
           two      : in STD_LOGIC;
           three    : in STD_LOGIC;
           address  : out STD_LOGIC_VECTOR(7 downto 0)
     );
end Address;

architecture Behavioral of Address is

begin
    process(zero, one, two, three)  
    begin
        if (zero = '1') and (not (one = '1' or two = '1' or three = '1')) then 
            address <= "00000000";  -- 0x00 R reset value 0xAD
        elsif (one = '1') and (not (zero = '1' or two = '1' or three = '1')) then 
            address <= "00000001";  -- 0x01 R reset value 0x1D 
        elsif (two = '1') and (not (zero = '1' or one = '1' or three = '1')) then     
            address <= "00100000";  -- 0x20 RW 
        elsif (three = '1') and (not (zero = '1' or one = '1' or two = '1')) then     
            address <= "00100010"; -- 0x22 RW 
        else
            address <= "00000000";
        end if;
    end process;

end Behavioral;
