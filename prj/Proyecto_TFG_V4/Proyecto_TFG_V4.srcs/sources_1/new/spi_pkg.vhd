library ieee;
use ieee.std_logic_1164.all;

library work;
use work.sbus.all;

package spi_pkg is

    ---
    -- Component
    component spi is 
    generic (
        config: sbus_slave_config_t
    );
    Port ( clk      : in  STD_LOGIC;
           rst      : in  STD_LOGIC;
           
           -- System bus
           sin  : in sbus_dn_t;
           sout : out sbus_up_t;
           
           -- External
           cs       : out STD_LOGIC;
           sclk     : out STD_LOGIC;
           mosi     : out STD_LOGIC;
           miso     : in  STD_LOGIC
     ); 
    end component;

end spi_pkg;
