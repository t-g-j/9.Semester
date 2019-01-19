----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2018 11:53:29 AM
-- Design Name: 
-- Module Name: PI_ctrl - Behavioral
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

entity PI_ctrl is
    Port ( err_in : in signed (7 downto 0);
           orig_in: in STD_LOGIC_VECTOR(7 downto 0); 
           clk_200m_in : in STD_LOGIC;
           k_gain : in STD_LOGIC_VECTOR(7 downto 0);
           ctrl_o : out STD_LOGIC_VECTOR(7 downto 0));
end PI_ctrl;

architecture Behavioral of PI_ctrl is
-- Signals etc.
signal orig_in_unsigned : unsigned(7 downto 0);
signal bias : integer := 5;  
signal Kg : signed(7 downto 0) := (others => '0');

signal err : signed(7 downto 0) := (others => '0');
signal res : signed(7 downto 0) := (others => '0');
signal resContainer : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal res2 : integer := 0;

begin

process(clk_200m_in)
begin
Kg <= signed(k_gain(7 downto 0) );
err <= signed(err_in);
    if(rising_edge(clk_200m_in ) ) then
        --res <= bias + Kg * err;
		orig_in_unsigned <= unsigned(orig_in);
        res <= TO_SIGNED(TO_INTEGER(Kg) * TO_INTEGER(err) + TO_INTEGER(orig_in_unsigned),8);
        --res <= to_signed(res2,8);
        resContainer <= STD_LOGIC_VECTOR(res); -- insert original set value
    end if;
end process;
ctrl_o <= resContainer;




end Behavioral;
