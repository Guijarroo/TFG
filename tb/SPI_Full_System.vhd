----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.05.2025
-- Design Name: 
-- Module Name: SPI_Full_system_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench para el módulo SPI_Full_system
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

entity SPI_Full_system_tb is
end SPI_Full_system_tb;

architecture Behavioral of SPI_Full_system_tb is
    -- Constantes
    constant CLK_PERIOD : time := 10 ns; -- 100 MHz
    constant BADDR : natural := 16#00500000#;
    
    -- Señales
    signal rst         : STD_LOGIC := '0';
    signal clk         : STD_LOGIC := '0';
    signal cpu_address : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal cpu_dataout : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal cpu_datain  : STD_LOGIC_VECTOR(31 downto 0);
    signal read        : STD_LOGIC := '0';
    signal write       : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal address     : STD_LOGIC_VECTOR(7 downto 0);
    signal instruction : STD_LOGIC_VECTOR(7 downto 0);
    signal data_down   : STD_LOGIC_VECTOR(7 downto 0);
    signal enable_down : STD_LOGIC;
    signal data_up     : STD_LOGIC_VECTOR(7 downto 0);
    signal enable_up   : STD_LOGIC;
    signal busy        : STD_LOGIC;
    signal cs          : STD_LOGIC;
    signal sclk        : STD_LOGIC;
    signal mosi        : STD_LOGIC;
    signal miso        : STD_LOGIC := '0';
    
    -- Componente bajo prueba
    component SPI_Full_system
        port (
            rst         : in  STD_LOGIC;
            clk         : in  STD_LOGIC;
            cpu_address : in  STD_LOGIC_VECTOR(31 downto 0);
            cpu_dataout : in  STD_LOGIC_VECTOR(31 downto 0);
            cpu_datain  : out STD_LOGIC_VECTOR(31 downto 0);
            read        : in  STD_LOGIC;
            write       : in  STD_LOGIC_VECTOR(3 downto 0);
            address     : out STD_LOGIC_VECTOR(7 downto 0);
            instruction : out STD_LOGIC_VECTOR(7 downto 0);
            enable_down : out STD_LOGIC;
            data_down   : out STD_LOGIC_VECTOR(7 downto 0);
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
    uut: SPI_Full_system
        port map (
            rst         => rst,
            clk         => clk,
            cpu_address => cpu_address,
            cpu_dataout => cpu_dataout,
            cpu_datain  => cpu_datain,
            read        => read,
            write       => write,
            address     => address,
            instruction => instruction,
            data_down   => data_down,
            enable_down => enable_down,
            data_up     => data_up,
            enable_up   => enable_up,
            busy        => busy,
            cs          => cs,
            sclk        => sclk,
            mosi        => mosi,
            miso        => miso
        );
    
    -- Generación del reloj
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;
    
    -- Simulación del esclavo SPI
    slave_process: process
        variable bit_count : integer := 0;
        variable data_to_send : STD_LOGIC_VECTOR(7 downto 0) := X"55"; -- Datos iniciales para miso
    begin
        wait until cs = '0'; -- Esclavo activo cuando cs es bajo
        bit_count := 0;
        while cs = '0' loop
            wait until rising_edge(sclk); -- Enviar datos en flanco de subida
            if bit_count < 8 then
                miso <= data_to_send(7 - bit_count); -- Enviar bit a bit
                bit_count := bit_count + 1;
            end if;
            if bit_count = 8 then
                data_to_send := X"AA"; -- Cambiar datos para la próxima transferencia
            end if;
        end loop;
        miso <= '0'; -- Reposo cuando cs es alto
    end process;
    
    -- Proceso de estímulos
    stim_process: process
    begin
        -- Inicialización
        rst <= '0';
        cpu_address <= (others => '0');
        cpu_dataout <= (others => '0');
        read <= '0';
        write <= "0000";
        wait for 20 ns;
        
        -- Liberar reset
        rst <= '1';
        wait for 20 ns;
        
        -- Prueba 1: Escritura en X_AXIS (0x00500000)
        report "Prueba 1: Escritura en X_AXIS";
        cpu_address <= std_logic_vector(to_unsigned(BADDR, 32)); -- X_AXIS
        cpu_dataout <= X"000000AA";
        write <= "1111";
        wait for 100 ns; -- Esperar que Serial_Communications procese
        assert cpu_datain = X"00000055"
            report "Error: cpu_datain incorrecto en escritura X_AXIS" severity error;
        write <= "0000";
        wait for 20 ns;
        
        -- Prueba 2: Lectura en Y_AXIS (0x00500004)
        report "Prueba 2: Lectura en Y_AXIS";
        cpu_address <= std_logic_vector(to_unsigned(BADDR + 4, 32)); -- Y_AXIS
        read <= '1';
        wait for 100 ns; -- Esperar que Serial_Communications procese
        assert cpu_datain = X"000000AA"
            report "Error: cpu_datain incorrecto en lectura Y_AXIS" severity error;
        read <= '0';
        wait for 20 ns;
        
        -- Prueba 3: Escritura en Z_AXIS (0x00500008)
        report "Prueba 3: Escritura en Z_AXIS";
        cpu_address <= std_logic_vector(to_unsigned(BADDR + 8, 32)); -- Z_AXIS
        cpu_dataout <= X"000000CC";
        write <= "1111";
        wait for 100 ns; -- Esperar que Serial_Communications procese
        assert cpu_datain = X"000000AA"
            report "Error: cpu_datain incorrecto en escritura Z_AXIS" severity error;
        write <= "0000";
        wait for 20 ns;
        
        -- Prueba 4: Dirección inválida (0x00500010)
        report "Prueba 4: Dirección inválida";
        cpu_address <= std_logic_vector(to_unsigned(BADDR + 16, 32));
        write <= "1111";
        wait for 50 ns;
        assert enable_down = '0' and cs = '1'
            report "Error: enable_down o cs activados para dirección inválida" severity error;
        write <= "0000";
        wait for 20 ns;
        
        -- Prueba 5: Reset
        report "Prueba 5: Reset";
        rst <= '0';
        wait for 20 ns;
        assert address = X"00" and instruction = X"00" and data_down = X"00" and enable_down = '0' and cs = '1'
            report "Error: Salidas no inicializadas tras reset" severity error;
        rst <= '1';
        wait for 20 ns;
        
        -- Fin de la simulación
        report "Simulación completada";
        wait;
    end process;
    
end Behavioral;