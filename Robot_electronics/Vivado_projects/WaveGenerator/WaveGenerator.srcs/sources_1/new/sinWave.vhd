----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2018 10:03:25 AM
-- Design Name: 
-- Module Name: sinWave - Behavioral
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
--use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.

--use UNISIM.VComponents.all;

entity sinWave is
  Port (
    clk_200m_in          : in  std_logic;
    i_addr         : in  std_logic_vector(4 downto 0);
    o_data         : out std_logic_vector(7 downto 0) 
  );
end sinWave;

architecture Behavioral of sinWave is

type t_sin_table is array(0 to 31) of integer range 0 to 255;
signal inc : std_logic_vector(7 downto 0):= (others=> '0');
signal counter : integer := 0;

constant C_SIN_TABLE  : t_sin_table := (
  128,  153,  177,  200,  219,  235,  247,  254,  255,  254,  247,  235,  219,  200,  177,  153,
  128,  103,   79,   56,   37,   21,    9,    2,    0,    2,    9,   21,   37,   56,   79,  103);



begin
--------------------------------------------------------------------
p_table : process(clk_200m_in)
begin
  if(rising_edge(clk_200m_in)) then
    --inc <= inc + 1;
    --o_data  <= std_logic_vector(to_unsigned(C_SIN_TABLE(to_integer(unsigned(i_addr))),8));
    o_data  <= std_logic_vector(to_unsigned(C_SIN_TABLE(counter),8));
    counter <= counter +1;
    if(counter = 30) then
    counter <= 0;
    end if;
  end if;
end process p_table;


end Behavioral;
