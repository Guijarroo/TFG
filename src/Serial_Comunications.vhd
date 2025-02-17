----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.02.2025 13:22:24
-- Design Name: 
-- Module Name: Serial_Comunications - Behavioral
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


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity Serial_Communications is
    Port (clk      : in  STD_LOGIC;  
          rst      : in  STD_LOGIC;  
          cs       : out STD_LOGIC;  
          sclk     : out STD_LOGIC;  
          mosi     : out STD_LOGIC;  
          miso     : in  STD_LOGIC;  
          address  : in  STD_LOGIC_VECTOR (7 downto 0);  
          instruction : in  STD_LOGIC_VECTOR (7 downto 0); 
          data_up : out STD_LOGIC_VECTOR (7 downto 0);
          data_down : in STD_LOGIC_VECTOR (7 downto 0)
          
    );
end Serial_Communications;


architecture Behavioral of Serial_Communications is

    -- Definición de estados
    type state_type is (IDLE, SEND_CMD, SEND_ADDR, RECEIVE_DATA, SEND_DATA, DONE);
    signal state_reg, state_next : state_type := IDLE;
    
    -- Señales auxiliares
    signal counter_reg, counter_next : unsigned (3 downto 0) := "0000";
    signal shift_reg, shift_next, data_up_reg    : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); 
    signal bit_counter_reg, bit_counter_next : integer range 0 to 7 := 0;
    
    -- Señales para los registros de cs y mosi`
    signal cs_reg, cs_next : STD_LOGIC := '1';
    signal mosi_reg, mosi_next : STD_LOGIC := '0';

    -- Registro del reloj SPI
    signal sclk_reg : STD_LOGIC := '0';
    
    
begin
    
    process(clk, rst)
        begin
            if rst = '1' then
                counter_reg <= "0000"; 
                state_reg       <= IDLE;
                bit_counter_reg <= 0;
                shift_reg       <= (others => '0');
                cs_reg          <= '1';
                mosi_reg        <= '0';                
                sclk_reg        <= '0';       
            elsif rising_edge(clk) then
                counter_next     <= counter_reg + 1;
                state_reg       <= state_next;
                bit_counter_reg <= bit_counter_next;
                shift_reg       <= shift_next;
                cs_reg          <= cs_next;
                mosi_reg        <= mosi_next;                
                sclk_reg        <= counter_reg(3);
 
            end if;
            
    end process;

    process(clk, rst)
        begin
            if rst = '1' then       
            state_next <= IDLE;             -- Vuelve al estado inicial IDLE
            cs_next <= '1';                      -- Desactiva el chip select
            bit_counter_next <= 0;               
            data_up_reg <= (others => '0');
            elsif rising_edge(clk) then         -- Cada flanco de subida del reloj se copmrueba el estado de la máquina 
                case state_reg is
                    when IDLE =>                -- Estado de espera a que llegue alguna instrucción
                        cs_next <= '1';  
                        bit_counter_next <= 0;
                        if instruction = "00001011" then  -- Instrucción de Lectura
                          shift_next <= instruction;     -- Cargar instrucción
                          state_next <= SEND_CMD;            -- Se pasa al estado de envío para enviar la instrucción por MOSI
                            cs_next <= '0';                    -- Activar chip select
                        elsif instruction = "00001010" then     -- Instrucción de Escritura
                            shift_next <= instruction;           -- Cargar instrucción
                            state_next <= SEND_CMD;                  -- Se pasa al estado de envío para enviar la instrucción por MOSI
                            cs_next <= '0';                          -- Activar chip select
                        end if;

                    when SEND_CMD =>            -- Estado de envío de la instrucción desde la FPGA al periférico del acelerómetro bit a bit
                        if bit_counter_reg < 8 then 
                            mosi_next <= shift_reg(7); 
                            shift_next <= shift_reg(6 downto 0) & '0';  -- Desplazamiento de bits
                            bit_counter_next <= bit_counter_reg + 1;
                        else                    -- Una vez enviada la instrucción bit a bit se pasa la address al registro y saltamos de estado
                            shift_next <= address;  
                            bit_counter_next <= 0;
                            state_next <= SEND_ADDR;
                        end if;

                    when SEND_ADDR =>           -- Estado de envío de la dirección desde la FPGA al periférico del acelerómetro bit a bit
                        if bit_counter_reg < 8 then
                            mosi_next <= shift_reg(7);
                            shift_next <= shift_reg(6 downto 0) & '0';
                            bit_counter_next <= bit_counter_reg + 1;
                        else                    -- Tras escribir la instrucción y la dirección en MOSI saltamos a estados distintos dependiendo de la instrucción
                            if instruction = "00001011" then    -- Lectura
                                bit_counter_next <= 0;
                                state_next <= RECEIVE_DATA;
                            else                                -- Escritura
                                shift_next <= data_down; 
                                bit_counter_next <= 0;
                                state_next <= SEND_DATA;
                            end if;
                        end if;

                    when RECEIVE_DATA =>        -- Estado en el que se leen los datos en MISO
                        if bit_counter_reg < 8 then
                            data_up_reg <= data_down(6 downto 0) & miso;  
                            bit_counter_next <= bit_counter_reg + 1;
                        else
                            data_up_reg <= data_down; 
                            state_next <= DONE;
                        end if;

                    when SEND_DATA =>           -- Estado en el que se leen los datos en MOSI
                        if bit_counter_reg < 8 then
                            mosi_next <= shift_reg(7);
                            shift_next <= shift_reg(6 downto 0) & '0';
                            bit_counter_next <= bit_counter_reg  + 1;
                        else
                            state_next <= DONE;
                        end if;

                    when DONE =>    -- Tras finalizar la secuencia completa se resetea el valor de Chip Select y se vuelve a IDLE 
                        cs_next <= '1';  
                        state_next <= IDLE;

                    when others =>
                        state_next <= IDLE;
                end case;
            end if;
        end process;

    -- Asignar valores de salida
    cs      <= cs_reg;
    mosi    <= mosi_reg;
    sclk    <= sclk_reg;
    data_up <=data_up_reg;

end Behavioral;



