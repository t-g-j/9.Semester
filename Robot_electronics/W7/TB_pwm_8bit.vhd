LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity TB_pwm_8bit is
end TB_pwm_8bit;

architecture Behavioral of TB_pwm_8bit is

 component pwm_8bit is
 generic (
        bitshift_reg             : integer := 5
         );
         
    Port ( 
        clk_200M_in              : in STD_LOGIC;
        duty_cycle_in            : in STD_LOGIC_VECTOR (7 downto 0);
        enable_in                : in STD_LOGIC;
        reset_in                 : in STD_LOGIC;
        pwm_out                  : out STD_LOGIC);
 end component;

 signal clk : std_logic;
 signal duty_cycle : STD_LOGIC_VECTOR (7 downto 0);
 signal enable : std_logic;
 signal reset : std_logic;
 signal pwm : std_logic;

--  Clock period definitions
 constant clk_period : time := 5 ns;

begin

mapping: pwm_8bit PORT MAP (
        clk_200M_in => clk,
        duty_cycle_in => duty_cycle,
        enable_in => enable,
        reset_in => reset,
        pwm_out => pwm
    );      

------------------------------------------------------------------------------
-- When you use a clocked module
------------------------------------------------------------------------------
   -- Clock process definitions( clock with 50% duty cycle is generated here.
   process
   begin
        clk <= '0';
        wait for clk_period/2;  --for 2.5 ns signal is '0'.
        clk <= '1';
        wait for clk_period/2;  --for next 2.5 ns signal is '1'.
   end process;

------------------------------------------------------------------------------
-- Simulation process
------------------------------------------------------------------------------
  process
   begin
        reset <= '1';         
        enable <= '0';
        duty_cycle <= "00000000";

        wait for 7 ns;
        reset <= '0';         
        enable <= '1';
        duty_cycle <= "10000000";

        wait for 50 ms;
        reset <= '1';         

        wait for 17 ns;
        reset <= '0';         

        wait for 1 ns;
        reset <= '0';         
        duty_cycle <= "11110000";

        wait for 200 ms;
  end process;   
end Behavioral;
