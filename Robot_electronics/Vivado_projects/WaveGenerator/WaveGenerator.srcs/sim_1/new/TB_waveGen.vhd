----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2018 10:23:57 AM
-- Design Name: 
-- Module Name: TB_waveGen - Behavioral
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


entity TB_waveGen is
--  Port ( );
end TB_waveGen;

architecture Behavioral of TB_waveGen is
----------------------------------------------
-- SIGNALS
----------------------------------------------
signal clk : std_logic := '0';
signal wave_out : std_logic_vector(7 downto 0);
signal sin_wave_out : std_logic_vector(7 downto 0);
signal i_d  : std_logic_vector(4 downto 0);


----------------------------------------------
-- Sinosodial wave
----------------------------------------------
component sinWave is
port (
        clk_200m_in : in std_logic; 
        i_addr         : in  std_logic_vector(4 downto 0);
        o_data         : out std_logic_vector(7 downto 0) 
     );
end component;

component triWave is
port (clk_200m_in : in std_logic; 
      wave_out : out std_logic_vector(7 downto 0)
     );
end component;


begin
----------------------------------------------
-- Triangle wave
----------------------------------------------
uut : triWave 
port map(
        clk_200m_in => clk,
        wave_out => wave_out
        );
----------------------------------------------
-- Sinosodial wave
----------------------------------------------
uut2 : sinWave
port map(
        clk_200m_in => clk,
        i_addr => i_d,
        o_data => sin_wave_out
        );
        
Clk <= not Clk after 5 ns;

--process
--begin
--i_d <= "00001";
--wait for 10 ns;
--i_d <= "00010";
--wait for 10 ns;
--i_d <= "00011";
--wait for 10 ns;
--i_d <= "00100";
--wait for 10 ns;
--i_d <= "00101";
--wait for 10 ns;
--i_d <= "00110";
--wait;
--end process;

end Behavioral;
