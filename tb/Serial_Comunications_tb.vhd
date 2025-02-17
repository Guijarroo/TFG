----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2025 11:55:47
-- Design Name: 
-- Module Name: Serial_Comunications_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_Serial_Communications is
end tb_Serial_Communications;

architecture Behavioral of tb_Serial_Communications is

    -- Señales para instanciar el DUT (Device Under Test)
    signal sclk       : std_logic := '0';
    signal rst        : std_logic := '1';
    signal cs         : std_logic := '1';
    signal instruction: std_logic_vector(7 downto 0);
    signal address    : std_logic_vector(7 downto 0);
    signal MOSI       : std_logic;
    signal MISO       : std_logic := '0';  -- Simulación de respuesta del esclavo

    component Serial_Comunications
        Port ( sclk       : in STD_LOGIC;
               rst        : in STD_LOGIC;
               cs         : in STD_LOGIC;
               address    : in STD_LOGIC_VECTOR(7 downto 0);
               instruction: in STD_LOGIC_VECTOR(7 downto 0);
               MISO       : out STD_LOGIC);
    end component;

begin

    -- Instancia del módulo bajo prueba (DUT)
    UUT: Serial_Comunications 
        port map (
            sclk        => sclk,
            rst         => rst,
            cs          => cs,
            address     => address,
            instruction => instruction,
            MISO        => MISO
        );

    -- Generación del reloj SPI (sclk)
    process
    begin
        while true loop
            sclk <= '0';
            wait for 10 ns; -- Ciclo bajo
            sclk <= '1';
            wait for 10 ns; -- Ciclo alto
        end loop;
    end process;

    -- Proceso de estímulos
    process
    begin
        -- Reset del sistema
        rst <= '1';
        wait for 50 ns;
        rst <= '0';
        wait for 50 ns;

        -- 1?? Simulación de una operación de **lectura** (INSTRUCTION = 0x0B)
        cs <= '0';  -- Activar esclavo
        instruction <= "00001011";  -- 0x0B: Lectura
        address <= "00000001";  -- Dirección 0x01
        
        wait for 200 ns;  -- Tiempo suficiente para enviar los datos
        
        cs <= '1';  -- Finaliza la operación
        wait for 100 ns; -- Espera antes de siguiente prueba

        -- 2?? Simulación de una operación de **escritura** (INSTRUCTION = 0x0A)
        cs <= '0';  -- Activar esclavo
        instruction <= "00001010";  -- 0x0A: Escritura
        address <= "00000010";  -- Dirección 0x02
        
        wait for 200 ns; -- Esperar a la transmisión

        cs <= '1'; -- Finaliza la operación
        wait for 100 ns;

        -- Terminar la simulación
        wait;
    end process;

end Behavioral;

