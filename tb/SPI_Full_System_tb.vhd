----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.05.2025
-- Design Name: 
-- Module Name: SPI_Full_system_tb_send_vectors - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench para SPI_Full_system usando send_vectors
-- 
-- Dependencies: SPI_Full_system.vhd, SPI.vhd, Serial_Communications.vhd
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPI_Full_system_tb_send_vectors is
end SPI_Full_system_tb_send_vectors;

architecture Behavioral of SPI_Full_system_tb_send_vectors is
    -- Constantes
    constant BADDR : natural := 16#00500000#;
    
    -- Señales de prueba
    signal cpu_address_tb, cpu_dataout_tb, cpu_datain_tb : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal read_tb        : STD_LOGIC := '0';
    signal write_tb       : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    
    signal clk_tb, rst_tb : STD_LOGIC := '0';
    
    signal address_tb, instruction_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal data_down_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal enable_down_tb : STD_LOGIC;
        
    signal data_up_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal enable_up_tb, busy_tb : STD_LOGIC;
    
    signal cs_tb, sclk_tb, mosi_tb, miso_tb : STD_LOGIC := '0';

    -- Señales para el manejo de tiempos
    constant CLK_PERIOD : time := 10 ns; -- 100 MHz clock
    constant DEBOUNCE_TIME : time := 10 ms; -- Sync_Debouncer delay (1,000,000 cycles at 100 MHz)

    -- Contadores para SPI
    signal counter : integer range 0 to 15 := 0;
    signal counter_16 : integer := 0;

    
    -- Componente bajo prueba
    component SPI_Full_system
        port ( rst         : in  STD_LOGIC;
               clk         : in  STD_LOGIC;
               
               cpu_address : in  STD_LOGIC_VECTOR(31 downto 0);
               cpu_dataout : in  STD_LOGIC_VECTOR(31 downto 0);
               cpu_datain  : out STD_LOGIC_VECTOR(31 downto 0);
               
               read        : in  STD_LOGIC;
               write       : in  STD_LOGIC_VECTOR(3 downto 0);
               
               address     : out STD_LOGIC_VECTOR(7 downto 0);
               enable_down : out STD_LOGIC;
               data_down   : out STD_LOGIC_VECTOR(7 downto 0);
               instruction : out STD_LOGIC_VECTOR(7 downto 0);
               
               data_up     : in  STD_LOGIC_VECTOR(7 downto 0);
               enable_up   : in  STD_LOGIC;
               busy        : in  STD_LOGIC;
               
               cs          : out STD_LOGIC;
               sclk        : out STD_LOGIC;
               mosi        : out STD_LOGIC;
               miso        : in  STD_LOGIC
        );
    end component;
    
begin
    -- Instancia del módulo SPI_Full_system
    prueba: SPI_Full_system
        Port map (rst         => rst_tb,
                  clk         => clk_tb,
                  
                  cpu_address => cpu_address_tb,
                  cpu_dataout => cpu_dataout_tb,
                  cpu_datain  => cpu_datain_tb,
                  
                  read        => read_tb,
                  write       => write_tb,
                  
                  address     => address_tb,
                  instruction => instruction_tb,
                  data_down   => data_down_tb,
                  enable_down => enable_down_tb,
                  
                  data_up     => data_up_tb,
                  enable_up   => enable_up_tb,
                  busy        => busy_tb,
                  
                  cs          => cs_tb,
                  sclk        => sclk_tb,
                  mosi        => mosi_tb,
                  miso        => miso_tb
        );
    
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
    
    -- Proceso de estímulos con send_vectors
    stim_process: process
        procedure send_vectors(
            constant rst       : in STD_LOGIC;
            constant cpu_address : in STD_LOGIC_VECTOR(31 downto 0);
            constant cpu_dataout : in STD_LOGIC_VECTOR(31 downto 0);
            constant read        : in STD_LOGIC;
            constant write       : in STD_LOGIC_VECTOR(3 downto 0)
        ) is
        begin
            rst_tb <= rst;
            cpu_address_tb <= cpu_address;
            cpu_dataout_tb <= cpu_dataout;
            read_tb <= read;
            write_tb <= write;
        end procedure send_vectors;
    begin
        -- Prueba 0: Reset inicial
        send_vectors('0', (others => '0'), (others => '0'), '0', "0000");
        wait for 10 ns;
        send_vectors('1', (others => '0'), (others => '0'), '0', "0000");
        wait for 10 ns;
        
        -- Prueba 1: Escritura en X_AXIS (0x00500000)
        send_vectors('1', std_logic_vector(to_unsigned(BADDR, 32)), X"000000AA", '0', "1111");
        wait until busy_tb = '1';
        wait until busy_tb = '0';
        wait for 10 ns;
        
        -- Prueba 2: Lectura en Y_AXIS (0x00500004)
        send_vectors('1', std_logic_vector(to_unsigned(BADDR + 4, 32)), (others => '0'), '1', "0000");
        wait until busy_tb = '1';
        wait until busy_tb = '0';
        wait for 10 ns;
        
        -- Prueba 3: Escritura en Z_AXIS (0x00500008)
        send_vectors('1', std_logic_vector(to_unsigned(BADDR + 8, 32)), X"000000CC", '0', "1111");
        wait until busy_tb = '1';
        wait until busy_tb = '0';
        wait for 10 ns;
        
        -- Prueba 4: Dirección inválida (0x00500010)
        send_vectors('1', std_logic_vector(to_unsigned(BADDR + 16, 32)), X"000000FF", '0', "1111");
        wait for 20 ns;
        wait for 10 ns;
        
        wait;
    end process;
    
end Behavioral;