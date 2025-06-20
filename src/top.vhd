library ieee;
use ieee.std_logic_1164.all;

entity top is
port (
    rst: in std_logic;
    clk: in std_logic;

    -- SPI comunicación con el esclavo
    cs       : out STD_LOGIC;
    sclk     : out STD_LOGIC;
    mosi     : out STD_LOGIC;
    miso     : in  std_logic;

    -- UART peripheral
    rx: in  std_logic;
    tx: out std_logic
);
end top;

architecture arch of top is
    signal sys_clk: std_logic;
    
    component mmcm
    port (
        resetn: in std_logic;
        clkin:  in std_logic;
        clkout: out std_logic
    );
    end component;
begin

    ---
    -- MMCM
    mmcm_inst: mmcm
    port map (
        resetn => rst, clkin => clk, clkout => sys_clk
    );

    ---
    -- SoC
    soc_inst: entity work.soc
    port map (
        rst => rst, clk => sys_clk,
        rx => rx, tx => tx,
        cs  => cs, sclk => sclk, miso => miso, mosi => mosi
    );

end arch;
