----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Martin Skriver
-- 
-- Create Date: 11/05/2018 02:18:58 PM
-- Design Name: 
-- Module Name: adc_data_collector - Behavioral
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

entity adc_data_collector is
    Port ( clk_200M : in STD_LOGIC;
           spi_clk_out : out STD_LOGIC;
           spi_data_in : in STD_LOGIC;
           spi_cs_out : out STD_LOGIC;
           data_bus_out : out STD_LOGIC_VECTOR (7 downto 0);
           new_data_out : out STD_LOGIC);
end adc_data_collector;

architecture Behavioral of adc_data_collector is

    constant max_count : natural := 2000;
    signal count : natural range 0 to max_count;
    signal trg_bit                  : std_logic;


----------------------------------------------------------------------
-- SPI FSM
----------------------------------------------------------------------
component spi_fsm is
    Port ( clk_200M_in : in STD_LOGIC;
           trg_in : in STD_LOGIC;
           spi_clk_out : out STD_LOGIC;
           cs_out : out STD_LOGIC;
           data_in : in STD_LOGIC;
           data_bus_out : out std_logic_vector(7 downto 0);
           data_ready_out : out std_logic
           );
end component;
    
begin

----------------------------------------------------------------------
-- SPI FSM wrapper
----------------------------------------------------------------------
SPI_ADC_TOP : spi_fsm
    port map(
        clk_200M_in     => clk_200M,
        trg_in          => trg_bit,
        spi_clk_out     => spi_clk_out,
        cs_out          => spi_cs_out,
        data_in         => spi_data_in,
        data_bus_out    => data_bus_out,
        data_ready_out  => new_data_out
    );
----------------------------------------------------------------------------------
-- Blink process
----------------------------------------------------------------------------------
process (clk_200M)
begin
    if (rising_edge(clk_200M)) then
        trg_bit <= '0';
        if count < max_count then
            count <= count + 1;
        else
            trg_bit <= '1';
            count <= 0;
        end if;
    end if;
end process;
end Behavioral;
