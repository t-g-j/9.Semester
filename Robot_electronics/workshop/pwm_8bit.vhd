----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Martin Skriver
-- 
-- Create Date: 11/11/2016 08:18:36 PM
-- Design Name: 
-- Module Name: pwm_8bit - Behavioral
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

entity pwm_8bit is
----------------------------------------------------------------------------------
-- Port definition for pwm generator
----------------------------------------------------------------------------------

    Port ( clk_200M_in              : in STD_LOGIC;
           duty_cycle_in            : in STD_LOGIC_VECTOR (7 downto 0);
           enable_in                : in STD_LOGIC;
           reset_in                 : in STD_LOGIC;
           pwm_out                  : out STD_LOGIC);
end pwm_8bit;

architecture Behavioral of pwm_8bit is

----------------------------------------------------------------------------------
-- Signal definitions
----------------------------------------------------------------------------------
    signal counter                  : unsigned(7 downto 0) := (others => '0');
begin

----------------------------------------------------------------------------------
-- PWM process
----------------------------------------------------------------------------------
process (clk_200M_in, reset_in, enable_in)
begin
    if(reset_in = '1') then
        counter <= (others => '0');
    elsif (rising_edge(clk_200M_in)) then
        pwm_out <= '0';
        if(enable_in = '1') then
            counter <= counter + 1;
            if((counter(7 downto 0) < unsigned(duty_cycle_in)) then
                pwm_out <= '1';
            end if;
        end if;
    end if;
end process;

end Behavioral;
