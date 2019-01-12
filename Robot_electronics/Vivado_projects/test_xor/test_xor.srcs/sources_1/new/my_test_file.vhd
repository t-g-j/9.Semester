----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2018 02:45:57 PM
-- Design Name: 
-- Module Name: my_test_file - Behavioral
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

entity my_test_file is
Port (  A : in STD_LOGIC;
          B : in STD_LOGIC;
          Q : out STD_LOGIC);
end my_test_file;

architecture Behavioral of my_test_file is

begin

----------------------------------------------------------------------------------
-- XOR process
----------------------------------------------------------------------------------
process (A, B)
begin
	Q <= A XOR B;
end process;


end Behavioral;
