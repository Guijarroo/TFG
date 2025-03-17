----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2025 12:46:30
-- Design Name: 
-- Module Name: Full_system - Behavioral
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

entity Full_system is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           
           cs   : out STD_LOGIC;
           sclk : out STD_LOGIC;
           miso : in STD_LOGIC;
           mosi : out STD_LOGIC;  
                    
           zero,one,two,three : in STD_LOGIC;
           write,read         : in STD_LOGIC;
           data_down          : in STD_LOGIC_VECTOR(7 downto 0); 
           data_up            : out STD_LOGIC_VECTOR(7 downto 0)


     );
end Full_system;

architecture Behavioral of Full_system is
    component Address is 
           Port ( zero     : in STD_LOGIC;
                  one      : in STD_LOGIC;
                  two      : in STD_LOGIC;
                  three    : in STD_LOGIC;
                  address  : out STD_LOGIC_VECTOR(7 downto 0)
            ); 
      end component;

     component Instruction is 
           Port ( write        : in STD_LOGIC;
                  read         : in STD_LOGIC;
                  instruction  : out STD_LOGIC_VECTOR(7 downto 0)
            ); 
      end component;
      
      component Serial_Communications is 
          Port ( clk      : in  STD_LOGIC;  
                 rst      : in  STD_LOGIC;  
                 -- SPI comunicación con el esclavo
                 cs       : out STD_LOGIC;  
                 sclk     : out STD_LOGIC;  
                 mosi     : out STD_LOGIC;  
                 miso     : in  STD_LOGIC;  
                 -- Comunicación con la CPU
                 address     : in  STD_LOGIC_VECTOR (7 downto 0);  
                 instruction : in  STD_LOGIC_VECTOR (7 downto 0); 
                 data_up     : out STD_LOGIC_VECTOR (7 downto 0);
                 data_down   : in STD_LOGIC_VECTOR (7 downto 0)
          ); 
      end component;
      
 signal addr_out, instr_out : std_logic_vector(7 downto 0); 
      
begin
    addr: Address
        Port map(
            zero => zero,
            one => one,
            two => two,
            three => three,
            address => addr_out
         );
     
    instr: Instruction
        Port map(
            write => write,
            read => read,
            instruction => instr_out
         );
 
     coms: Serial_Communications
        Port map(
            clk => clk,
            rst => rst,
            
            cs => cs,
            sclk => sclk,
            miso  => miso,
            mosi => mosi,
            
            instruction => instr_out,
            address => addr_out,
            data_up => data_up,
            data_down => data_down
            
         );                       
            
end Behavioral;
