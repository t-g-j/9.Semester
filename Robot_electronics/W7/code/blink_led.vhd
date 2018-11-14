----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2018 04:24:09 PM
-- Design Name: 
-- Module Name: blink_led - Behavioral
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

entity blink_led is
    Port ( clk_200M_in : in STD_LOGIC;
           q_out : out STD_LOGIC);
end blink_led;

architecture Behavioral of blink_led is

----------------------------------------------------------------------------------
-- Signal definitions
----------------------------------------------------------------------------------
    constant max_count : natural := 200000000;
    signal Rst : std_logic;

    signal counter                  : unsigned(31 downto 0) := (others => '0');
    signal counter_mem              : unsigned(31 downto 0) := (others => '0');
    
    signal col_reg                  : std_logic_vector(2 downto 0) := "100";
begin

----------------------------------------------------------------------------------
-- Blink process
----------------------------------------------------------------------------------
process (clk_200M_in)
    variable count : natural range 0 to max_count;
begin
    
    counter_mem <= counter;
    if (rising_edge(clk_200M_in)) then

        if count < max_count/2 then
            count := count + 1;
            q_out <= '1';
        elsif count < max_count then
            q_out <= '0';
            count := count + 1;
        else
            q_out <= '1';
            count := 0;
        end if;
    end if;
end process;
end Behavioral;
