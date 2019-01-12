----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2018 11:33:25 AM
-- Design Name: 
-- Module Name: TB_clk_divider - Behavioral
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

entity TB_clk_divider is
end TB_clk_divider;


architecture Behavioral of TB_clk_divider is


-- Define components
component clk_divider is
port (clk_in : in std_logic;
      divider_o : out STD_LOGIC_VECTOR(3 downto 0)
     );
end component;

--declare inputs and initialize them to zero.
signal clk_in : std_logic := '0';

--declare outputs
signal divider_o : STD_LOGIC_VECTOR(3 downto 0):= (OThERS => '0');

-- define the period of clock here.
-- It's recommended to use CAPITAL letters to define constants.
constant CLK_PERIOD : time := 10 ns;


begin

-- instantiate the unit under test (uut)
uut : clk_divider port map (
        clk_in => clk_in, 
        divider_o => divider_o
); 

-- Clock process definitions( clock with 50% duty cycle is generated here.
Clk_process :process
begin
    clk_in <= '0';
    wait for CLK_PERIOD/2;  --for half of clock period clk stays at '0'.
    clk_in <= '1';
    wait for CLK_PERIOD/2;  --for next half of clock period clk stays at '1'.
end process;


end Behavioral;
