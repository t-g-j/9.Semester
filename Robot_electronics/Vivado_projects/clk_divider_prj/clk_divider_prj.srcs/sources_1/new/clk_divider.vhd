----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2018 03:37:49 PM
-- Design Name: 
-- Module Name: clk_divider - Behavioral
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

entity clk_divider is
Port (
    clk_in      : in STD_LOGIC;
    divider_o   : out STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
end clk_divider;

architecture Behavioral of clk_divider is



-- Counters
signal unsigned_cntvector1 : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
signal unsigned_cntvector2 : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
signal unsigned_cntvector3 : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
signal unsigned_cntvector4 : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
-- Out signals
signal tmp1 : STD_LOGIC := '0';
signal tmp2 : STD_LOGIC := '0';
signal tmp3 : STD_LOGIC := '0';
signal tmp4 : STD_LOGIC := '0';



begin

----------------------------------------------------------------------------------
-- CLK divider
----------------------------------------------------------------------------------


process(clk_in)

begin
    
   if(clk_in'EVENT AND clk_in='1') then
    
    -- Increment count vectors   
    unsigned_cntvector1 <= unsigned_cntvector1 + "1";
    unsigned_cntvector2 <= unsigned_cntvector2 + "1";
    unsigned_cntvector3 <= unsigned_cntvector3 + "1";
    unsigned_cntvector4 <= unsigned_cntvector4 + "1";
    
---------------------------------------------------------------------------------
-- Divived by 2
---------------------------------------------------------------------------------
    if(unsigned_cntvector1 = "0001") then
        tmp1 <= NOT (tmp1);
        unsigned_cntvector1 <="0000"; -- Reset count vector
    end if;
---------------------------------------------------------------------------------
-- Divived by 4
---------------------------------------------------------------------------------
    if(unsigned_cntvector2 = "0011") then
        tmp2 <= NOT(tmp2);
        unsigned_cntvector2 <="0000"; -- Reset count vectors
    end if;

---------------------------------------------------------------------------------
-- Divived by 8
---------------------------------------------------------------------------------
    if(unsigned_cntvector3 = "0111") then
        tmp3 <= NOT(tmp3);
        unsigned_cntvector3 <="0000"; -- Reset count vectors
    end if;
---------------------------------------------------------------------------------
-- Divived by 16
---------------------------------------------------------------------------------
    if(unsigned_cntvector4 = "1111") then
        tmp4 <= NOT(tmp4);
        unsigned_cntvector4 <="0000"; -- Reset count vectors
    end if;

end if;

end process;


-- Write the outputs
divider_o(0) <= tmp1;
divider_o(1) <= tmp2;
divider_o(2) <= tmp3;
divider_o(3) <= tmp4;


end Behavioral;
