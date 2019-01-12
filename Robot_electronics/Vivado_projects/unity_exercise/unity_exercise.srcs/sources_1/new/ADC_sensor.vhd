----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2018 12:43:50 AM
-- Design Name: 
-- Module Name: ADC_sensor - Behavioral
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

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADC_sensor is
 Port(  clk_200m_in         : in STD_LOGIC;
        enable               : out STD_LOGIC);
end ADC_sensor;

architecture Behavioral of ADC_sensor is

-- Timer process property
constant CNT_TARGET : integer := 10; --200000000;

----------------------------------------------------------------------
-- SPI_ctrl0 component
----------------------------------------------------------------------

component spi_ctrl is
    Port(   clk_200m_in         : in STD_LOGIC;
            trigger_in          : in STD_LOGIC;
            data_in             : in STD_LOGIC;
            spi_clk_out         : out STD_LOGIC;
            cs_out              : out STD_LOGIC;
            data_out            : out STD_LOGIC;
            new_data_out        : out STD_LOGIC;
            spi_busy_out        : out STD_LOGIC);
end component;


-- SPI signals
signal spi_data_in      : STD_LOGIC;
signal spi_clk          : STD_LOGIC;
signal chip_select      : STD_LOGIC;
signal spi_data_out     : STD_LOGIC;
signal spi_new_data_out : STD_LOGIC;
signal spi_b_out        : STD_LOGIC; 

-- Intermidiate signals
signal tmp_enable : STD_LOGIC := '0';


-- Statmachine property
--type state is (state1,state2,C);
--signal pr_state , nx_state : state;





begin


----------------------------------------------------------------------
--  spi_ctrl component wrapper
----------------------------------------------------------------------

spi_ctrl0 : spi_ctrl
    port map(
        clk_200m_in     => clk_200m_in,
        trigger_in      => tmp_enable,
        data_in         =>  spi_data_in, 
        spi_clk_out     => spi_clk,
        cs_out          => chip_select,
        data_out        => spi_data_out,
        new_data_out    => spi_new_data_out,
        spi_busy_out    => spi_b_out
    );

----------------------------------------------------------------
-- State machine
-- Timer strategy
----------------------------------------------------------------
--process(clk_200m_in)
--begin 
--    if(rising_edge(clk_200m_in) ) then
--        pr_state <=nx_state;
--    end if;
    
--end process;
---------------------------------------------------------------
-- State machine
-- Combinatorial logic
---------------------------------------------------------------
--process(pr_state)
--    begin
--    case pr_state is
--        when state1 =>
--            nx_state<= state2;
--        when state2 =>
--            nx_state <= state1;
--        end case;
--end process;


--------------------------------------------------------------
-- 1second enable signal to the read from the ADC
-- Timer 1sec
--------------------------------------------------------------
process(clk_200m_in)
variable cnt : integer := 0;
begin
    if(rising_edge(clk_200m_in) ) then
        cnt := cnt+1;
        if(cnt = CNT_TARGET) then
        tmp_enable <= not tmp_enable;
        cnt := 0;
        end if;
        enable <=tmp_enable;
    end if;
    
end process;

end Behavioral;