library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.sbus.all;

entity spi_tb is
end spi_tb;

architecture Behavioral of spi_tb is
   constant BADDR : natural := 16#00500000#;

    -- Configuración del bus sbus
    constant SBUS_CONFIG : sbus_slave_config_t := (
        baddr  => BADDR,
        length => 32
    );
    -- Componente del módulo bajo prueba 
  component spi_tb is
    Port ( rst          : in  STD_LOGIC;
           clk          : in  STD_LOGIC;
           
           ---
           -- System bus
           sin  : in  sbus_dn_t;
           sout : out sbus_up_t;

       
           ----
           -- SPI comunicación con el esclavo
           cs       : out STD_LOGIC;
           sclk     : out STD_LOGIC;
           mosi     : out STD_LOGIC;
           miso     : in  STD_LOGIC
     );
    end component;

    -- Señales
    signal clk_tb, rst_tb : STD_LOGIC := '0';
    
    signal sin_tb          : sbus_dn_t;
    signal sout_tb         : sbus_up_t;
    
    signal cs_tb, sclk_tb, mosi_tb, miso_tb : STD_LOGIC := '0';

    -- Señales internas para simulación del esclavo SPI
    signal miso_data    : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal miso_bit_idx : integer range 0 to 7 := 7;
    
    -- Señales para el manejo de tiempos
    constant CLK_PERIOD : time := 10 ns; -- 100 MHz clock
    constant X_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr, 32));
    constant Y_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr + 4, 32));
    constant Z_AXIS : STD_LOGIC_VECTOR(31 downto 0) := std_logic_vector(to_unsigned(baddr + 8, 32));


begin
    -- Crear reloj de 100 MHz
    process
        begin
            if(clk_tb = '1') then
               clk_tb <= '0';
            else
               clk_tb <= '1';
            end if;
            wait for CLK_PERIOD;
    end process;    
    
        
    -- Instancia del módulo bajo prueba
    
    uut: entity work.spi
        generic map (
            config => SBUS_CONFIG
        )
        port map (
            clk   => clk_tb,
            rst   => rst_tb,
            sin   => sin_tb,
            sout  => sout_tb,
            cs    => cs_tb,
            sclk  => sclk_tb,
            mosi  => mosi_tb,
            miso  => miso_tb
        );
        
    -- Proceso para simular datos en MISO (esclavo SPI)
    miso_process: process
        variable miso_data : STD_LOGIC_VECTOR(7 downto 0) := "10101010"; -- Datos a enviar desde el esclavo
    begin
        --wait for 4 us; -- Espera inicial
        wait until cs_tb = '1';
        wait until cs_tb = '0';
        wait for 5 us;

        -- Enviar datos bit a bit en MISO, sincronizados con el flanco de bajada de SCLK
        for i in 7 downto 0 loop
            wait until falling_edge(sclk_tb); -- Cambiar MISO en el flanco de bajada
            miso_tb <= miso_data(i);         -- Enviar el bit i de miso_data
            wait until rising_edge(sclk_tb);  -- Esperar al siguiente flanco de subida (captura por el master)
        end loop;

        -- Volver MISO a '0' después de enviar los datos
        miso_tb <= '0';
        wait;
    end process;


     --- Declaración de señales a enviar
    process
        procedure send_vectors(
            constant rst   : in STD_LOGIC;
            constant sin   : in  sbus_dn_t
        ) is
        begin
            rst_tb   <= rst;
            sin_tb   <= sin;

        end procedure send_vectors;
    begin
        -- Reset inicial
        send_vectors('0', (addr => (others => '0'), rstb => '0', wdata => (others => '0'), wmask => "0000"));
        wait for 10 ns; -- Breve espera para reset
        
        send_vectors('1', (addr => X_AXIS, rstb => '1', wdata => (others => '0'), wmask => "0000"));
        wait;
        
     end process;
end Behavioral;