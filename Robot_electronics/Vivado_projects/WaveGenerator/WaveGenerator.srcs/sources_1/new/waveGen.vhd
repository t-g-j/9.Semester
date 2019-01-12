----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2018 10:04:43 AM
-- Design Name: 
-- Module Name: waveGen - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity waveGen is
  Port (clk_200m_in     :    in STD_LOGIC);
end waveGen;

architecture Behavioral of waveGen is
signal w_o : std_logic_vector(7 downto 0):= (others => '0');
signal s_w_o : std_logic_vector(7 downto 0):= (others => '0');

signal i_d  : std_logic_vector(4 downto 0):= (others => '0');


----------------------------------------------------
-- Triangular wave 
----------------------------------------------------
component triWave
Port(
        clk_200m_in     :    in STD_LOGIC;
        wave_out        : out std_logic_vector(7 downto 0)
        );
end component;

----------------------------------------------------
-- Sinusodial wave
----------------------------------------------------
component sinWave
Port(
    clk_200m_in : in std_logic; 
    i_addr         : in  std_logic_vector(4 downto 0);
    o_data         : out std_logic_vector(7 downto 0)
);
end component;

begin

----------------------------------------------------
-- Triangular wave
----------------------------------------------------
triWaveGen : triWave
port map(
    clk_200m_in => clk_200m_in,
    wave_out    => w_o
);

----------------------------------------------------
-- Sinusodial wave
----------------------------------------------------
sinWaveGen : sinWave
port map(
        clk_200m_in => clk_200m_in,
        i_addr => i_d,
        o_data => s_w_o
);

end Behavioral;
