----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2025 12:46:30
-- Design Name: 
-- Module Name: Full_system - Behavioral
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

entity SPI_Recurrente_Full_system is
    Port ( rst          : in  STD_LOGIC;
           clk          : in  STD_LOGIC;
           
           ----
           --- Comunicación con la CPU
           
           -- System bus
           cpu_address: in STD_LOGIC_VECTOR(31 downto 0);
           cpu_dataout: in STD_LOGIC_VECTOR(31 downto 0);
           cpu_datain: out STD_LOGIC_VECTOR(31 downto 0);
           
           read:  in STD_LOGIC;
           write: in STD_LOGIC_VECTOR(3 downto 0);
       
           -- Salidas hacia Serial_Comunications
           address     : out  STD_LOGIC_VECTOR (7 downto 0);
           instruction : out  STD_LOGIC_VECTOR (7 downto 0);
           enable_down : out  STD_LOGIC;
           data_down   : out  STD_LOGIC_VECTOR (7 downto 0);
           
           -- Entradas desde Serial_Comunications
           data_up     : in STD_LOGIC_VECTOR (7 downto 0);
           enable_up   : in STD_LOGIC;
           busy        : in STD_LOGIC;

           ----
           -- SPI comunicación con el esclavo
           cs       : out STD_LOGIC;
           sclk     : out STD_LOGIC;
           mosi     : out STD_LOGIC;
           miso     : in  STD_LOGIC
     );
end SPI_Recurrente_Full_system;

architecture Behavioral of SPI_Recurrente_Full_system is


    -- Componente SPI_Recurrente 
    component SPI_Recurrente is 
        Port ( clk: in STD_LOGIC;
               rst: in STD_LOGIC;
               
               -- System bus
               cpu_address: in STD_LOGIC_VECTOR(31 downto 0);
               cpu_dataout: in STD_LOGIC_VECTOR(31 downto 0);
               cpu_datain: out STD_LOGIC_VECTOR(31 downto 0);
                              
               -- Salidas hacia Serial_Comunications
               address     : out  STD_LOGIC_VECTOR (7 downto 0);
               instruction : out  STD_LOGIC_VECTOR (7 downto 0);
               enable_down : out  STD_LOGIC;
               data_down   : out  STD_LOGIC_VECTOR (7 downto 0);
               
               -- Entradas desde Serial_Comunications
               data_up     : in STD_LOGIC_VECTOR (7 downto 0);
               enable_up   : in STD_LOGIC;
               busy        : in STD_LOGIC
        ); 
    end component;
    
    -- Componente Registers  
    component Registers is 
        Port ( clk         : in  STD_LOGIC;
               rst         : in  STD_LOGIC;
               
               cpu_address : in  STD_LOGIC_VECTOR(31 downto 0);
               cpu_dataout : in  STD_LOGIC_VECTOR(31 downto 0);
               cpu_datain  : out STD_LOGIC_VECTOR(31 downto 0);
               
               read        : in  STD_LOGIC;
               write       : in  STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;     
      
    -- Componente Serial_Communications
    component Serial_Communications is 
        Port ( clk      : in  STD_LOGIC;
               rst      : in  STD_LOGIC;

               ---
               -- Comunicación con la CPU
               
               -- CPU --> SPI
               address     : in  STD_LOGIC_VECTOR (7 downto 0);
               instruction : in  STD_LOGIC_VECTOR (7 downto 0);
               data_down   : in  STD_LOGIC_VECTOR (7 downto 0);
               enable_down : in  STD_LOGIC;
               busy        : out STD_LOGIC;
               
               -- SPI --> CPU
               data_up     : out STD_LOGIC_VECTOR (7 downto 0);
               enable_up   : out STD_LOGIC;

               ---
               -- SPI comunicación con el esclavo
               cs       : out STD_LOGIC;
               sclk     : out STD_LOGIC;
               mosi     : out STD_LOGIC;
               miso     : in  STD_LOGIC
        ); 
    end component;
      
    -- Señales internas
    signal addr_SPI, instr_SPI, data_Serial, data_down_SPI : STD_LOGIC_VECTOR(7 downto 0);
    signal enable_Serial, busy_Serial : STD_LOGIC;
    signal enable_down_SPI : STD_LOGIC;
    signal cpu_dataout_SPI, cpu_datain_SPI, cpu_address_SPI : STD_LOGIC_VECTOR(31 downto 0);

begin
    
    -- Instancia de SPI
    Prueba: SPI_Recurrente
        port map (
            clk         => clk,
            rst         => rst,
            
            cpu_address => cpu_address_SPI,
            cpu_dataout => cpu_dataout_SPI,                    
            cpu_datain  => cpu_datain_SPI,
                        
            address     => addr_SPI,
            instruction => instr_SPI,
            data_down   => data_down_SPI,
            enable_down => enable_down_SPI,
            
            busy        => busy_Serial,
            data_up     => data_Serial,
            enable_up   => enable_Serial
            
        );  
    
    
    regs: Registers 
        port map (
            clk          => clk,
            rst          => rst,
            
            cpu_address  => cpu_address_SPI,
            cpu_dataout  => cpu_dataout_SPI,
            cpu_datain   => cpu_datain_SPI, 
            
            read         => read,
            write        => write
        );
   
    
    -- Instancia de Serial_Communications
    coms: Serial_Communications
        port map (
            clk         => clk,
            rst         => rst,
                                 
            address     => addr_SPI,
            instruction => instr_SPI,
            data_down   => data_down_SPI,
            enable_down => enable_down_SPI,
            busy        => busy_Serial,
            
            data_up     => data_Serial,
            enable_up   => enable_Serial,
            
            cs          => cs,
            sclk        => sclk,
            miso        => miso,
            mosi        => mosi
        );
                               
            
end Behavioral;