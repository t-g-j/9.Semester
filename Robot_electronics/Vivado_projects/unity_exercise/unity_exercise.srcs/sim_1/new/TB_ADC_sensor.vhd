----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2018 12:54:20 PM
-- Design Name: 
-- Module Name: TB_ADC_sensor - Behavioral
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

entity TB_ADC_sensor is
end TB_ADC_sensor;

architecture Behavioral of TB_ADC_sensor is

-- Component
component ADC_sensor is
    Port(   clk_200m_in         : in STD_LOGIC;
            enable               : out STD_LOGIC);
end component;

--declare inputs and initialize them to zero.
signal TB_clk_200m_in : std_logic := '0';


--declare outputs
signal dum : STD_LOGIC := '0';

-- define the period of clock here.
constant CLK_PERIOD : time := 5 ns;

begin

-- instantiate the unit under test (uut)
uut : ADC_sensor port map (
        clk_200m_in => TB_clk_200m_in,
        enable       => dum
    );

-- Clock process definitions( clock with 50% duty cycle is generated here.
Clk_process :process
begin
     TB_clk_200m_in <= '0';
     wait for CLK_PERIOD/2;  --for half of clock period clk stays at '0'.
     TB_clk_200m_in <= '1';
     wait for CLK_PERIOD/2;  --for next half of clock period clk stays at '1'.
end process;
 
---- Stimulus process, Apply inputs here.
--stim_proc: process
--begin        
--     wait for CLK_PERIOD*10; --wait for 10 clock cycles.
--     reset <='1';                    --then apply reset for 2 clock cycles.
--     wait for CLK_PERIOD*2;
--     reset <='0';                    --then pull down reset for 20 clock cycles.
--     wait for CLK_PERIOD*20;
--     reset <= '1';               --then apply reset for one clock cycle.
--     wait for CLK_PERIOD;
--     reset <= '0';               --pull down reset and let the counter run.
--     wait;
--end process;
 
end Behavioral;
