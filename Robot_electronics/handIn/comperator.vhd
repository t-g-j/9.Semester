----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/29/2018 09:49:42 AM
-- Design Name: 
-- Module Name: comperator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comperator is
    Port ( adc_in : in STD_LOGIC_VECTOR (7 downto 0);
            clk_200m_in : in STD_LOGIC;
           fixed_in : in STD_LOGIC_VECTOR (7 downto 0);
           err_o : out signed (7 downto 0));
end comperator;

architecture Behavioral of comperator is

signal tmp : signed(7 downto 0)   := (others => '0');

begin

process(clk_200m_in)
begin
    if(rising_edge(clk_200m_in) ) then
        -- downon or upscale adc output
          
        tmp <= signed(fixed_in) - signed(adc_in(7 downto 0));
    end if;
end process;
err_o <= tmp;

end Behavioral;
