library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.seg_pkg.all;
use work.sbus.all;

entity seg is
generic (
    baddr: natural := 16#00500000#;
    count: natural := 2**16
);
port (
    clk: in std_logic;
    rst: in std_logic;

    -- System bus
    slave_in: in sbus_dn_t;

    -- Output
    a: out std_logic_vector(7 downto 0);
    k: out std_logic_vector(7 downto 0)
);
end seg;

architecture arch of seg is
    -- Input data / display number
    signal dn, dr: std_logic_vector(31 downto 0);
    signal cn, cr: natural;
    signal an, ar: natural range 0 to 7;

    -- Nibble (4-bits)-to-seg
    function nib2seg(data: std_logic_vector(3 downto 0)) return std_logic_vector is
        variable udata: integer;
        variable seg:   std_logic_vector(7 downto 0);
    begin
        udata := to_integer(unsigned(data));

        case udata is
            when 16#0#  => seg := "00000011";
            when 16#1#  => seg := "10011111";
            when 16#2#  => seg := "00100101";
            when 16#3#  => seg := "00001101";
            when 16#4#  => seg := "10011001";
            when 16#5#  => seg := "01001001";
            when 16#6#  => seg := "01000001";
            when 16#7#  => seg := "00011111";
            when 16#8#  => seg := "00000001";
            when 16#9#  => seg := "00001001";
            when 16#A#  => seg := "00010001";
            when 16#B#  => seg := "11000001";
            when 16#C#  => seg := "01100011";
            when 16#D#  => seg := "10000101";
            when 16#E#  => seg := "01100001";
            when 16#F#  => seg := "01110001";
            when others => seg := (others => '1');
        end case;

        return seg;
    end function;

begin

    ---
    -- Display registers
    segr: process (rst, clk)
    begin
        if rst = '0' then
            dr <= (others => '0');
            cr <= 0;
            ar <= 0;
        elsif rising_edge(clk) then
            dr <= dn;
            cr <= cn;
            ar <= an;
        end if;
    end process;

    ---
    -- Data input
    datain: process (dr, slave_in)
        variable wstb: std_logic;
    begin
        dn <= dr;

        -- Data input
        wstb := '0';
        for i in slave_in.wmask'range loop
            wstb := wstb or slave_in.wmask(i);
        end loop;

        if wstb = '1' and unsigned(slave_in.addr) = baddr then
            dn <= slave_in.wdata(31 downto 0);
        end if;
    end process;

    ---
    -- Display multiplexing:
    mux: process (rst, ar, cr, dr)
        variable kr: std_logic_vector(3 downto 0);
    begin
        cn <= cr;
        an <= ar;

        -- Counters
        if cr = count then
            cn <= 0;

            if ar = 7 then
                an <= 0;
            else
                an <= ar + 1;
            end if;
        else
            cn <= cr + 1;
        end if;

        -- Display selection
        a <= (others => '1');
        a(ar) <= '0';

        -- Data display
        kr := dr(4*(ar+1)-1 downto 4*ar);
        if rst = '0' then
            k <= (others => '1');
        else
            k <= nib2seg(kr);
        end if;
    end process;

end arch;
