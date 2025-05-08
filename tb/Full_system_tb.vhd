library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Full_system_tb is
end Full_system_tb;

architecture Behavioral of Full_system_tb is

    -- Componente del módulo bajo prueba 
    component Full_system is
       Port (rst          : in  STD_LOGIC;
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
    end component;

    -- Señales de prueba
    signal clk_tb, rst_tb : STD_LOGIC := '0';
    signal data_down_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal enable_down_tb, busy_tb : STD_LOGIC;
    
    signal zero_tb, one_tb, two_tb, three_tb : STD_LOGIC;
    signal write_tb, read_tb : STD_LOGIC;
    
    signal data_up_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal enable_up_tb : STD_LOGIC;
    
    signal cs_tb, sclk_tb, mosi_tb, miso_tb : STD_LOGIC := '0';

    -- Señales para el manejo de tiempos
    constant CLK_PERIOD : time := 10 ns; -- 100 MHz clock
    constant DEBOUNCE_TIME : time := 10 ms; -- Sync_Debouncer delay (1,000,000 cycles at 100 MHz)

    -- Contadores para SPI
    signal counter : integer range 0 to 15 := 0;
    signal counter_16 : integer := 0;

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
    
    process(clk_tb)
        begin
            if rising_edge(clk_tb) then
                if cs_tb = '1' then
                    counter <= 0;
                    counter_16 <= 0;
                else
                    if counter = 15 then
                        counter <= 0;
                        counter_16 <= counter_16 + 1;
                    else
                        counter <= counter + 1;
                    end if;
                end if;
            end if;
    end process;
        
    -- Instancia del módulo bajo prueba
    prueba: Full_system
        port map (
            rst         => rst_tb,
            clk         => clk_tb,
            
            zero        => zero_tb,
            one         => one_tb,
            two         => two_tb,
            three       => three_tb,
            
            write       => write_tb,
            read        => read_tb,
            
            data_down   => data_down_tb,
            enable_down => enable_down_tb,
            busy        => busy_tb,
            
            data_up     => data_up_tb,
            enable_up   => enable_up_tb,
            
            cs          => cs_tb,
            sclk        => sclk_tb,
            mosi        => mosi_tb,
            miso        => miso_tb
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
            constant reset       : in STD_LOGIC;
            constant enable_down : in STD_LOGIC;
            constant zero        : in STD_LOGIC;
            constant one         : in STD_LOGIC;
            constant two         : in STD_LOGIC;
            constant three       : in STD_LOGIC;
            constant write       : in STD_LOGIC;
            constant read        : in STD_LOGIC;
            constant data_down   : in STD_LOGIC_VECTOR(7 downto 0)
        ) is
        begin
            rst_tb         <= reset;
            enable_down_tb <= enable_down;
            zero_tb        <= zero;
            one_tb         <= one;
            two_tb         <= two;
            three_tb       <= three;
            write_tb       <= write;
            read_tb        <= read;
            data_down_tb   <= data_down;
        end procedure send_vectors;
    begin
        -- Reset inicial
        send_vectors('1', '0', '0', '0', '0', '0', '0', '0', "00000000");
        wait for 10 ns; -- Breve espera para reset

        -- Prueba de escritura en dirección "00000001" (one = '1')
        -- Address: one = '1' -> "00000001"
        -- Instruction: read = '1' -> "00001011"
        send_vectors('0', '1', '0', '1', '0', '0', '1', '0', "01011010");
        wait until busy_tb = '1';
        wait until busy_tb = '0';

        -- Prueba de lectura en dirección "00100001" (two = '1')
        -- Address: two = '1' -> "00100001"
        -- Instruction: write = '1' -> "00001010"
        send_vectors('0', '1', '0', '0', '1', '0', '0', '1', "00000000");
        wait until busy_tb = '1';
        wait until busy_tb = '0';
        wait until enable_up_tb = '1';

        wait;
    end process;

end Behavioral;