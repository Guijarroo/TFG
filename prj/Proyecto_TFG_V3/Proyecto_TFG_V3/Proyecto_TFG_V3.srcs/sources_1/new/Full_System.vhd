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

entity Full_system is
    Port ( rst          : in  STD_LOGIC;
           clk          : in  STD_LOGIC;
           
           ----
           --- Comunicación con la CPU
           
           --- CPU --> SPI
           data_down   : in  STD_LOGIC_VECTOR (7 downto 0);
           enable_down : in  STD_LOGIC;
           busy        : out STD_LOGIC; 
           
           -- Address
           zero         : in  STD_LOGIC;
           one          : in  STD_LOGIC;
           two          : in  STD_LOGIC;
           three        : in  STD_LOGIC;
           
           -- Instruction
           write        : in  STD_LOGIC;
           read         : in  STD_LOGIC;            
                 
           ---          
           --- SPI --> CPU
           data_up     : out STD_LOGIC_VECTOR (7 downto 0);
           enable_up   : out STD_LOGIC;

           ----
           -- SPI comunicación con el esclavo
           cs       : out STD_LOGIC;
           sclk     : out STD_LOGIC;
           mosi     : out STD_LOGIC;
           miso     : in  STD_LOGIC
     );
end Full_system;

architecture Behavioral of Full_system is
    -- Componente Sync_Debouncer
    component Sync_Debouncer is
        Port ( clk     : in  STD_LOGIC;
               rst     : in  STD_LOGIC;
               btn_in  : in  STD_LOGIC;
               btn_out : out STD_LOGIC);
    end component;

    -- Componente Address
    component Address is 
        Port ( zero     : in  STD_LOGIC;
               one      : in  STD_LOGIC;
               two      : in  STD_LOGIC;
               three    : in  STD_LOGIC;
               address  : out STD_LOGIC_VECTOR(7 downto 0)
         ); 
    end component;

    -- Componente Instruction
    component Instruction is 
        Port ( write        : in  STD_LOGIC;
               read         : in  STD_LOGIC;
               instruction  : out STD_LOGIC_VECTOR(7 downto 0)
         ); 
    end component;
      
    -- Componente Serial_Communications
    component Serial_Communications is 
        Port ( clk      : in  STD_LOGIC;
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
    end component;
      
    -- Señales internas
    signal addr_out, instr_out : STD_LOGIC_VECTOR(7 downto 0);
    signal zero_db, one_db, two_db, three_db : STD_LOGIC;
    signal read_db, write_db, enable_down_db : STD_LOGIC;

begin
    -- Instancias de Sync_Debouncer
--    db_zero: Sync_Debouncer
--        port map (
--            clk     => clk,
--            rst     => rst, 
--            btn_in  => zero,
--            btn_out => zero_db
--        );

--    db_one: Sync_Debouncer
--        port map (
--            clk     => clk,
--            rst     => rst,
--            btn_in  => one,
--            btn_out => one_db
--        );

--    db_two: Sync_Debouncer
--        port map (
--            clk     => clk,
--            rst     => rst,
--            btn_in  => two,
--            btn_out => two_db
--        );

--    db_three: Sync_Debouncer
--        port map (
--            clk     => clk,
--            rst     => rst,
--            btn_in  => three,
--            btn_out => three_db
--        );

--    db_read: Sync_Debouncer
--        port map (
--            clk     => clk,
--            rst     => rst,
--            btn_in  => read,
--            btn_out => read_db
--        );

--    db_write: Sync_Debouncer
--        port map (
--            clk     => clk,
--            rst     => rst,
--            btn_in  => write,
--            btn_out => write_db
--        );

    db_enable_down: Sync_Debouncer
        port map (
            clk     => clk,
            rst     => rst,
            btn_in  => enable_down,
            btn_out => enable_down_db
        );

--     db_rst: Sync_Debouncer
--         port map (
--             clk     => clk,
--             rst     => rst, 
--             btn_in  => rst,
--             btn_out => rst_db
--         );

    -- Instancia de Address
    addr: Address
        port map (
            zero    => zero,
            one     => one,
            two     => two,
            three   => three,
            address => addr_out
        );
     
    -- Instancia de Instruction
    instr: Instruction
        port map (
            write       => write,
            read        => read,
            instruction => instr_out
        );
 
    -- Instancia de Serial_Communications
    coms: Serial_Communications
        port map (
            clk         => clk,
            rst         => rst,
                                 
            address     => addr_out,
            instruction => instr_out,
            data_down   => data_down,
            enable_down => enable_down_db,
            busy        => busy,
            
            data_up     => data_up,
            enable_up   => enable_up,
            
            cs          => cs,
            sclk        => sclk,
            miso        => miso,
            mosi        => mosi
        );                       
            
end Behavioral;