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
use IEEE.NUMERIC_STD.ALL;

library work;
use work.sbus.all;
entity spi is
    generic (
        config: sbus_slave_config_t
    );
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
end spi;

architecture Behavioral of spi is

    -- Componente Registers  
    component Registers is 
        Port ( clk         : in  STD_LOGIC;
               rst         : in  STD_LOGIC;
               
               sin  : in  sbus_dn_t;
               sout : out sbus_up_t;
               
               enable_registers : in STD_LOGIC;
               axis_addr        : in STD_LOGIC_VECTOR(31 downto 0);
               controll_rdata   : in STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;
    
    -- Componente Controll 
    component Controll is 
    generic (
            baddr : natural := 16#00500000#
        );
        Port ( clk: in STD_LOGIC;
               rst: in STD_LOGIC;
                              
               -- Salidas hacia Serial_Comunications
               address     : out  STD_LOGIC_VECTOR (7 downto 0);
               instruction : out  STD_LOGIC_VECTOR (7 downto 0);
               enable_down : out  STD_LOGIC;
               data_down   : out  STD_LOGIC_VECTOR (7 downto 0);
               
               -- Entradas desde Serial_Comunications
               data_up     : in STD_LOGIC_VECTOR (7 downto 0);
               enable_up   : in STD_LOGIC;
               busy        : in STD_LOGIC;
               
               -- Comunicación Registro
               enable_registers : out STD_LOGIC;
               axis_addr        : out STD_LOGIC_VECTOR(31 downto 0);
               controll_rdata   : out STD_LOGIC_VECTOR(31 downto 0)
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
    signal enable_Serial, busy_Serial                      : STD_LOGIC;
    signal enable_down_SPI, enable_registers_SPI           : STD_LOGIC;
    signal axis_addr_SPI, controll_rdata_SPI               : STD_LOGIC_VECTOR(31 downto 0);

begin
    
    Regs: registers 
        port map (
            clk   => clk,
            rst   => rst,
            
            sin   => sin,
            sout  => sout,
            
            enable_registers => enable_registers_SPI,
            axis_addr        => axis_addr_SPI,
            controll_rdata   => controll_rdata_SPI
            
        );
        
    -- Instancia de SPI
    Controller : controll
        generic map(
            baddr => config.baddr
        )    
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
            
            enable_registers => enable_registers_SPI,
            axis_addr        => axis_addr_SPI,
            controll_rdata   => controll_rdata_SPI
            
        );  
    
    

   
    
    -- Instancia de Serial_Communications
    Communications: serial_communications
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