----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2018 10:03:25 AM
-- Design Name: 
-- Module Name: triWave - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity triWave is
  Port (
        clk_200m_in     :    in STD_LOGIC;
        wave_out        : out std_logic_vector(7 downto 0)
        );
end triWave;


architecture Behavioral of triWave is

constant AMPLITUDE  : integer := 2;
constant PERIOD     : integer := 4;

signal count,count2 : integer := 0;
signal direction : std_logic := '0';

begin

process(clk_200m_in)
begin

if(rising_edge(clk_200m_in)) then
--"direction" signal determines the direction of counting - up or down
    if(count = 253) then
        count <= 0;
        if(direction = '0') then
            direction <= '1';
            count2 <= 126;
        else
            direction <= '0';
            count2 <= 129;
        end if; 
    else
        count <= count + 1;
    end if;
    
    if(direction = '0') then
        if(count2 = 255) then
            count2 <= 0;
        else
            count2 <= count2 + 1; --up counts from 129 to 255 and then 0 to 127
        end if;
    else
        if(count2 = 255) then
            count2 <= 0;
        else
            count2 <= count2 - 1; --down counts from 126 to 0 and then 255 to 128
        end if;
    end if;
end if;
        
end process;

wave_out <= conv_std_logic_vector(count2,8);

end Behavioral;
