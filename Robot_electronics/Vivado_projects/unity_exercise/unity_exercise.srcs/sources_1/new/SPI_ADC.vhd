----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2018 09:43:50 AM
-- Design Name: 
-- Module Name: SPI_ADC - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI_ADC is
    Port(   clk_200m_in         : in STD_LOGIC;
            trigger_in          : in STD_LOGIC;
            data_in             : in STD_LOGIC;
            spi_clk_out         : out STD_LOGIC;
            cs_out              : out STD_LOGIC;
            data_out            : out STD_LOGIC;
            new_data_out        : out STD_LOGIC;
            spi_busy_out        : out STD_LOGIC);
end SPI_ADC;

architecture Behavioral of SPI_ADC is

type state is (state1,state2,C);
signal pr_state , nx_state : state;

signal tmp : STD_LOGIC := '0';


begin


-- Output the slave clk to the ADC
spi_clk_out <=clk_200m_in; 

-- Timer strategy
process(clk_200m_in)
begin 
    if(rising_edge(clk_200m_in) ) then
        pr_state <=nx_state;
    end if;
    
end process;

process(pr_state)
    begin
    case pr_state is
    
        when state1 =>
            nx_state<= state2;
        when state2 =>
            nx_state <= state1;
        end case;
end process;

end Behavioral;
