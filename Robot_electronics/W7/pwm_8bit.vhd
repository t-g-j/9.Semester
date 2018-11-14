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


----------------------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pwm_8bit is
----------------------------------------------------------------------------------
-- Select the bit shift that fits the required pwm frq
-- @ 200MHz 8bit (2^8)/200MHz = 0.00000128s
-- 1/(0.00000128*2^bitshift) = frq
-- 0:781250Hz; 1:390625Hz; 2:195312.5Hz; 3:97656.25Hz; 
-- 4:48828.125Hz; 5:24414.0625Hz; 6:12207.03125Hz; 7:6103.515625Hz; 
-- 8:3051.7578125Hz; 9:1525.87890625Hz; 10:762.939453125Hz
-- 11:381.469726563Hz; 12:190.734863281Hz; 13:95.367431641Hz
-- 14:47.68371582Hz; 15:23.84185791Hz; 16:11.920928955Hz
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Genrics
----------------------------------------------------------------------------------
	generic (
            bitshift_reg            : integer := 5
            );
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
    signal counter                  : unsigned((bitshift_reg + 7) downto 0) := (others => '0');
begin

----------------------------------------------------------------------------------
-- PWM process
----------------------------------------------------------------------------------
process (clk_200M_in)
begin
    if(reset_in = '1') then
        counter <= (others => '0');
    elsif (rising_edge(clk_200M_in)) then
        pwm_out <= '0';
        if(enable_in = '1') then
            counter <= counter + 1;
            if((counter((bitshift_reg + 7) downto bitshift_reg)) < unsigned(duty_cycle_in)) then
                pwm_out <= '1';
            end if;
        end if;
    end if;
end process;

end Behavioral;
