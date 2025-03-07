library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Serial_Communications_tb is
end Serial_Communications_tb;

architecture Behavioral of Serial_Communications_tb is

    -- Componente del módulo bajo prueba 
    component Serial_Communications is
        Port ( clk         : in  STD_LOGIC;
               rst         : in  STD_LOGIC;
               cs          : out STD_LOGIC;
               sclk        : out STD_LOGIC;
               mosi        : out STD_LOGIC;
               miso        : in  STD_LOGIC;
               address     : in  STD_LOGIC_VECTOR (7 downto 0);
               instruction : in  STD_LOGIC_VECTOR (7 downto 0);
               data_up     : out STD_LOGIC_VECTOR (7 downto 0);
               data_down   : in  STD_LOGIC_VECTOR (7 downto 0)
         );  
               
    end component;

    -- Señales de prueba
    signal miso_tb                                  : std_logic := '0';
    signal clk_tb,rst_tb,cs_tb,sclk_tb,mosi_tb      : std_logic := '1';
    signal address_tb                               : std_logic_vector(7 downto 0);
    signal instruction_tb, data_up_tb               : std_logic_vector(7 downto 0);
    signal data_down_tb                             : std_logic_vector(7 downto 0); 
    signal counter                                  : integer range 0 to 15 := 0;
    signal counter_16                               : integer := 0;

    -- Señales para el manejo de tiempos
    constant DELTA    : time := 20 ns;
    constant DELTA_2  : time := 10 ns;

begin
    -- Crear reloj de 100 MHz
        process
            begin
                if(clk_tb = '1') then
                   clk_tb <= '0';
                else
                   clk_tb <= '1';
                end if;
                wait for DELTA_2;
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
        
    
    prueba: Serial_Communications
        port map (
            clk         => clk_tb,
            rst         => rst_tb,
            cs          => cs_tb,
            sclk        => sclk_tb,
            mosi        => mosi_tb,
            miso        => miso_tb,
            address     => address_tb,
            instruction => instruction_tb,
            data_up     => data_up_tb,
            data_down   => data_down_tb
        );

process
        variable miso_data : std_logic_vector(7 downto 0) := "10101010";  -- Datos a enviar desde el esclavo
    begin

        wait for 15.73 us;

        -- Enviar datos bit a bit en MISO, sincronizados con el flanco de bajada de SCLK
        for i in 7 downto 0 loop
            wait until falling_edge(sclk_tb);  -- Cambiar MISO en el flanco de bajada de SCLK
            miso_tb <= miso_data(i);           -- Enviar el bit i de miso_data
            wait until rising_edge(sclk_tb);   -- Esperar al siguiente flanco de subida (donde el master captura)
        end loop;

        -- Volver MISO a '0' después de enviar los datos
        miso_tb <= '0';
        wait;
    end process;


    -- Declaración de señales a enviar
    process
        procedure send_vectors(
            constant reset       : in std_logic;
            constant instruction : in std_logic_vector(7 downto 0);
            constant address     : in std_logic_vector(7 downto 0);
            constant data_down   : in std_logic_vector(7 downto 0)
--            constant miso_val    : in std_logic
        ) is
        begin
            rst_tb          <= reset;
            instruction_tb  <= instruction;
            address_tb      <= address;
--            miso_tb         <= miso_val;
            data_down_tb    <= data_down;
        end procedure send_vectors;
    begin
        -- Reset inicial
        send_vectors('1', "00000000", "00000000", "00000000");
        wait for 5000 ps;  -- Espera para ver el reset en la simulación
        
        -- Prueba de escritura en la dirección 10010110 
        send_vectors('0', "00001010", "10010110", "01011010");
        wait for 10 us;
        
        -- Prueba de lectura en la dirección 10010111 
        send_vectors('0', "00001011", "10010111", "00000000");
        wait for 10 us;
        wait;
        -- Prueba de lectura en la dirección 10010111 
--        send_vectors('0', "00001011", "10010110", "00000000", '0');
--        wait for 10 us;
    end process;

end Behavioral;
