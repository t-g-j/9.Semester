----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2018 02:27:11 PM
-- Design Name: 
-- Module Name: pl_top - Behavioral
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

entity pl_top is
    Port ( clk_in : in STD_LOGIC;
           uart_rx_in : in STD_LOGIC;
           uart_tx_out : out STD_LOGIC;
           led_r_out : out STD_LOGIC;
           led_g_out : out STD_LOGIC;
           led_b_out : out STD_LOGIC);
end pl_top;
 
architecture Behavioral of pl_top is

----------------------------------------------------------------------
-- Unity component
----------------------------------------------------------------------
component unity_ctrl is
    port ( clk_i    : in STD_LOGIC;       
       rx_i     : in STD_LOGIC;
       tx_o     : out STD_LOGIC;
       led_o    : out STD_LOGIC_VECTOR(2 downto 0);
       duty_cycle0_out     : out std_logic_vector (7 downto 0);
       duty_cycle1_out     : out std_logic_vector (7 downto 0);
       duty_cycle2_out     : out std_logic_vector (7 downto 0)
    );
end component;

----------------------------------------------------------------------
-- PWM component
--freq_in : in std_logic
----------------------------------------------------------------------
component pwm_8bit is
    port ( duty_cycle_in     : in std_logic_vector (7 downto 0);
        clk_200M_in          : in std_logic;
        enable_in            : in std_logic;
        reset_in             : in std_logic;
        pwm_out              : out std_logic     
    );
end component;

----------------------------------------------------------------------
-- Blink component
----------------------------------------------------------------------
component blink_led is
    Port ( clk_200M_in  : in STD_LOGIC;
           q_out        : out STD_LOGIC);
end component;

signal r_reg        : std_logic;
signal g_reg        : std_logic;
signal b_reg        : std_logic;
signal blink_reg    : std_logic; 
--signal for frequency
--signal sig_freq    : std_logic; 

--signal from unity to pwm
signal sig_duty_cycle0            : std_logic_vector(7 downto 0);
signal sig_duty_cycle1            : std_logic_vector(7 downto 0);
signal sig_duty_cycle2            : std_logic_vector(7 downto 0);

--signal for enable and rest 0, 1
signal sig_enable      : std_logic;
signal sig_reset       : std_logic;

--signal pwm_out
signal sig_pwm_out0 : std_logic;
signal sig_pwm_out1 : std_logic;
signal sig_pwm_out2 : std_logic;



begin

----------------------------------------------------------------------
-- Unity wrapper
----------------------------------------------------------------------
UNITY_TOP : unity_ctrl
    port map(
        clk_i       => clk_in, 
        rx_i        => uart_rx_in, 
        tx_o        => uart_tx_out, 
        led_o(0)    => r_reg,
        led_o(1)    => g_reg,
        led_o(2)    => b_reg,
        duty_cycle0_out  => sig_duty_cycle0,
        duty_cycle1_out  => sig_duty_cycle1,
        duty_cycle2_out  => sig_duty_cycle2
    );

----------------------------------------------------------------------
-- Blink wrapper
----------------------------------------------------------------------
BLINK : blink_led

    port map(
        clk_200M_in  => clk_in,
        q_out        => blink_reg
    );

----------------------------------------------------------------------
-- PWM module wrapper
----------------------------------------------------------------------
PWM0 : pwm_8bit
    port map( duty_cycle_in    =>  sig_duty_cycle0,
            clk_200M_in => clk_in,
            enable_in => blink_reg ,
            reset_in => sig_reset,
            pwm_out => sig_pwm_out0 
        );
PWM1 : pwm_8bit
        port map(duty_cycle_in    =>  sig_duty_cycle1,
            clk_200M_in => clk_in,
            enable_in => blink_reg ,
            reset_in => sig_reset,
            pwm_out => sig_pwm_out1
            );
PWM2 : pwm_8bit
        port map(duty_cycle_in    =>  sig_duty_cycle2,
            clk_200M_in => clk_in,
            enable_in => blink_reg,
            reset_in => sig_reset,
            pwm_out => sig_pwm_out2
            );
        
----------------------------------------------------------------------
-- LED connections
----------------------------------------------------------------------
led_r_out <= not (not r_reg and sig_pwm_out0);
led_g_out <= not (not g_reg and sig_pwm_out1);
led_b_out <= not (not b_reg and sig_pwm_out2);

----------------------------------------------------------------------
-- FREQ process : sig_freq, not do?
----------------------------------------------------------------------

----------------------------------------------------------------------
-- PWM Connections: enable, reset
----------------------------------------------------------------------
sig_enable <= '1';
sig_reset <= '0';

 
end Behavioral;
