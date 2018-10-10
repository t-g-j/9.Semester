----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Martin Skriver
-- 
-- Create Date: 10/01/2018 02:20:21 PM
-- Design Name: 
-- Module Name: xor_mod - Behavioral
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

entity xor_mod is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end xor_mod;

architecture Behavioral of xor_mod is

begin


----------------------------------------------------------------------------------
-- XOR process
----------------------------------------------------------------------------------
process (A, B)
begin
	Q <= A XOR B;
end process;

end Behavioral;
