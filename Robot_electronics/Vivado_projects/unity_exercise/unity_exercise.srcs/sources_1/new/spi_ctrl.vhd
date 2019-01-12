----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2018 11:35:34 AM
-- Design Name: 
-- Module Name: spi_ctrl - Behavioral
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

entity spi_ctrl is
  Port (clk_200m_in         : in STD_LOGIC;
        trigger_in          : in STD_LOGIC;
        data_in             : in STD_LOGIC;
        spi_clk_out         : out STD_LOGIC;
        cs_out              : out STD_LOGIC;
        data_out            : out STD_LOGIC;
        new_data_out        : out STD_LOGIC;
        spi_busy_out        : out STD_LOGIC);
end spi_ctrl;

architecture Behavioral of spi_ctrl is


-- Statmachine property
type state is (Idle,CS,convTime,aqTime);
signal pr_state , nx_state : state;


begin

----------------------------------------------------------------
-- State machine
-- Timer strategy
----------------------------------------------------------------
process(clk_200m_in)
begin 
    if(rising_edge(clk_200m_in) ) then
        pr_state <=nx_state;
    end if;
    
end process;
---------------------------------------------------------------
-- State machine
-- Combinatorial logic
---------------------------------------------------------------
process(pr_state)
    begin
    case pr_state is
        when Idle =>
            nx_state<= Idle;
        when CS =>
            nx_state <= Idle;
        when CS =>
            nx_state <= Idle;
        when CS =>
            nx_state <= Idle;
        end case;
end process;




end Behavioral;
