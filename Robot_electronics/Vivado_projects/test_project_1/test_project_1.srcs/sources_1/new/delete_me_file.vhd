----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2018 12:39:22 PM
-- Design Name: 
-- Module Name: delete_me_file - Behavioral
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

entity delete_me_file is
  Port (
        clk : in std_logic;
      reset :in std_logic;
      count : out unsigned(3 downto 0)  --output of the design. 4 bit count value.
     );
end delete_me_file;

architecture Behavioral of delete_me_file is
--initializing the count to zero.
signal c : unsigned(3 downto 0) :=(others => '0');  

begin

count <= c;

process(clk,reset)
begin
    if(reset = '1') then    --active high reset for the counter.
        c <= (others => '0');
    elsif(rising_edge(clk)) then
    -- when count reaches its maximum(that is 15) reset it to 0
        if(c = 15) then
            c <= (others => '0');
        else    
            c <= c + 1;  --increment count at every positive edge of clk.
        end if;
    end if; 
end process;
end Behavioral;
