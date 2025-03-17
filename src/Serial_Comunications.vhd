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
          -- SPI comunicación con el esclavo
          cs       : out STD_LOGIC;  
          sclk     : out STD_LOGIC;  
          mosi     : out STD_LOGIC;  
          miso     : in  STD_LOGIC;  
          -- Comunicación con la CPU
          address  : in  STD_LOGIC_VECTOR (7 downto 0);  
          instruction : in  STD_LOGIC_VECTOR (7 downto 0); 
          data_up : out STD_LOGIC_VECTOR (7 downto 0);
          data_down : in STD_LOGIC_VECTOR (7 downto 0)
    );
end Serial_Communications;


architecture Behavioral of Serial_Communications is

    -- Definición de estados
    type state_type is (IDLE, SEND_CMD, SEND_ADDR, RECEIVE_DATA, SEND_DATA, DONE);
    signal state_reg, state_next : state_type;
    
    -- Registros auxiliares
    signal counter_reg, counter_next : unsigned (3 downto 0);
    signal shift_reg, shift_next, data_up_reg, data_up_next    : STD_LOGIC_VECTOR (7 downto 0); 
    signal bit_counter_reg, bit_counter_next : integer range 0 to 7;
    
    -- Registros de cs, mosi y sclk
    signal cs_reg, cs_next : STD_LOGIC;
    signal mosi_reg, mosi_next : STD_LOGIC;
    signal sclk_reg, sclk_next : STD_LOGIC;
    
    -- Registros para detectores de flanco
    signal re_reg, re_next, fe_reg, fe_next, sclk_prev_reg, sclk_prev_next : STD_LOGIC;
    
    -- Registros para detectar nueva instrucción
    signal last_instruction_reg, last_instruction_next : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal last_address_reg, last_address_next : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
    
begin
    
    process(clk, rst)
        begin
            if rst = '1' then
                counter_reg             <= (others => '0'); 
                state_reg               <= IDLE;
                bit_counter_reg         <= 0;
                shift_reg               <= (others => '0');
                cs_reg                  <= '1';
                mosi_reg                <= '0';                
                sclk_reg                <= '0';                    
                data_up_reg             <= (others => '0');                  
                sclk_prev_reg           <= '0';
                re_reg                  <= '0';
                fe_reg                  <= '0';
                last_instruction_reg    <= (others => '0');
                last_address_reg        <= (others => '0');
                
            elsif rising_edge(clk) then
                counter_reg             <= counter_next;
                state_reg               <= state_next;
                bit_counter_reg         <= bit_counter_next;
                shift_reg               <= shift_next;
                cs_reg                  <= cs_next;
                mosi_reg                <= mosi_next;                
                sclk_reg                <= sclk_next;       
                data_up_reg             <= data_up_next;    
                re_reg                  <= re_next;
                fe_reg                  <= fe_next;
                sclk_prev_reg           <= sclk_prev_next;
                last_instruction_reg    <= last_instruction_next;
                last_address_reg        <= last_address_next;
 
            end if;          
    end process;
    
    process(sclk_reg)
    begin
        sclk_prev_next <= sclk_reg;  
        re_next <= (not sclk_prev_reg) and sclk_reg; 
        fe_next <= sclk_prev_reg and (not sclk_reg); 
    end process;

    -- Contador que se resetea al llegar a 16 
    process(counter_reg)
    begin
        if counter_reg = (counter_reg'range => '1') then       
            counter_next <= (others => '0');
        else
            counter_next <= counter_reg +1;
        end if;
    end process;
    
    
    -- Se logra el reloj sclk de 6,25 MHz 
    process(counter_reg)
    begin
        if counter_reg(3) = '0' then  -- Primera mitad del ciclo (0-7)
            sclk_next <= '1';
        else                           -- Segunda mitad del ciclo (8-15)
            sclk_next <= '0';
        end if;
    end process;
       

    process(re_reg)
        begin
            if re_reg = '1'  then       -- Cada flanco de subida del reloj se copmrueba el estado de la máquina 
                case state_reg is
                    when IDLE =>                -- Estado de espera a que llegue alguna instrucción
                        cs_next <= '1';  
                        bit_counter_next <= 0;
                        if (instruction = "00001011" or instruction = "00001010") and (instruction /= last_instruction_reg or address /= last_address_reg) then  
                          shift_next <= instruction;     -- Cargar instrucción
                          state_next <= SEND_CMD;        -- Se pasa al estado de envío para enviar la instrucción por MOSI
                          cs_next <= '0';                -- Activar chip select
                        end if;

                    when SEND_CMD =>            -- Estado de envío de la instrucción desde la FPGA al periférico del acelerómetro bit a bit
                        if bit_counter_reg < 8 then 
                            mosi_next <= shift_reg(7); 
                            shift_next <= shift_reg(6 downto 0) & '0';  -- Desplazamiento de bits
                            bit_counter_next <= bit_counter_reg + 1;
                        else                    -- Una vez enviada la instrucción bit a bit se pasa la address al registro y saltamos de estado
                            shift_next <= address;  
                            mosi_next <= address(7);  
                            bit_counter_next <= 0;
                            state_next <= SEND_ADDR;
                        end if;

                    when SEND_ADDR =>           -- Estado de envío de la dirección desde la FPGA al periférico del acelerómetro bit a bit
                        if bit_counter_reg < 7 then
                            mosi_next <= shift_reg(6);  
                            shift_next <= shift_reg(6 downto 0) & '0';
                            bit_counter_next <= bit_counter_reg + 1;
                        else                    -- Tras escribir la instrucción y la dirección en MOSI saltamos a estados distintos dependiendo de la instrucción
                            if instruction = "00001011" then    -- Lectura
                                bit_counter_next <= 0;
                                state_next <= RECEIVE_DATA;
                                mosi_next <= '0';
                            else                                -- Escritura
                                shift_next <= data_down; 
                                mosi_next <= data_down(7); 
                                bit_counter_next <= 0;
                                state_next <= SEND_DATA;
                            end if;
                        end if;

                    when RECEIVE_DATA =>        
                        if bit_counter_reg < 8 then
                            data_up_next <= data_up_reg(6 downto 0) & miso;  -- Desplazamiento y almacenamiento correcto
                            bit_counter_next <= bit_counter_reg + 1;
                        else
                            state_next <= DONE;
                        end if;
                    
                    when SEND_DATA =>           -- Estado en el que se leen los datos en MOSI
                        if bit_counter_reg < 7 then        
                             mosi_next <= shift_reg(6);  
                             shift_next <= shift_reg(6 downto 0) & '0';
                             bit_counter_next <= bit_counter_reg  + 1;
                         else
                             state_next <= DONE;
                         end if;
    
                    when DONE =>    -- Tras finalizar la secuencia completa se resetea el valor de Chip Select y se vuelve a IDLE 
                        cs_next <= '1';
                        last_instruction_next <= instruction;
                        last_address_next <= address;
                        state_next <= IDLE;

                    when others =>
                        state_next <= IDLE;
                end case;
            end if;
        end process;

    -- Asignar valores de salida
    cs      <= cs_reg;
    mosi    <= mosi_reg;
    data_up <= data_up_reg;
    sclk    <= sclk_reg;

end Behavioral;



