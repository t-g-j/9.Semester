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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pl_top is
    Port ( clk_in : in STD_LOGIC;
           uart_rx_in : in STD_LOGIC;
           spi_in : in STD_LOGIC;
           spi_clk_out: out STD_LOGIC;
           spi_cs_out: out STD_LOGIC;
           uart_tx_out : out STD_LOGIC;
           led_r_out : out STD_LOGIC;
           led_g_out : out STD_LOGIC;
           led_b_out : out STD_LOGIC;
           pwm_circuit: out STD_LOGIC);
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
       duty_cycle2_out     : out std_logic_vector (7 downto 0);
       duty_cycle3_out     : out std_logic_vector (7 downto 0);
       Pgain_out           : out std_logic_vector (7 downto 0);
       freq_sinWave_out        : out std_logic_vector (7 downto 0);
       adc_val_in          : in std_logic_vector (7 downto 0)
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

component adc_data_collectorMartin is
    port ( clk_200M : in STD_LOGIC;
           spi_clk_out : out STD_LOGIC;
           spi_data_in : in STD_LOGIC;
           spi_cs_out : out STD_LOGIC;
           data_bus_out : out STD_LOGIC_VECTOR (7 downto 0);
           new_data_out : out STD_LOGIC);
end component;

component sinWave is
port (clk_200m_in : in std_logic;
      freq_in: in std_logic_vector(7 downto 0); 
      o_data      : out std_logic_vector(7 downto 0) );
end component;
--component triWave is
--port (clk_200m_in : in std_logic; 
--      wave_out    : out std_logic_vector(7 downto 0) );
--end component;

component comperator is
port( adc_in : in STD_LOGIC_VECTOR (7 downto 0);
      clk_200m_in : in STD_LOGIC;
      fixed_in : in STD_LOGIC_VECTOR(7 downto 0);
      err_o : out signed (7 downto 0) );
end component;

component PI_ctrl is
port (err_in : in signed (7 downto 0);
      orig_in: in STD_LOGIC_VECTOR(7 downto 0); 
      clk_200m_in : in STD_LOGIC;
      k_gain : in STD_LOGIC_VECTOR(7 downto 0);
      ctrl_o : out STD_LOGIC_VECTOR(7 downto 0) );
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

--signal from unity to PWMcircuit
signal sig_duty_cycle3: std_logic_vector(7 downto 0);
--signal from unity to Pcontrol (gain)
signal sig_gain: std_logic_vector (7 downto 0);
--signal from unity to sinWave (freq)
signal sig_freq_sinWave: std_logic_vector (7 downto 0);

--signal for enable and rest 0, 1
signal sig_enable      : std_logic;
signal sig_reset       : std_logic;

--signal pwm_out
signal sig_pwm_out0 : std_logic;
signal sig_pwm_out1 : std_logic;
signal sig_pwm_out2 : std_logic;
signal sig_pwm_out3 : std_logic;
signal pwm_enable : std_logic;


-- sinWave, triWave, comparator and Pcontrol signals
signal sig_wave_gen: std_logic_vector(7 downto 0);
--signal from adc to Unitylink and comparator
signal adc_data_reg: std_logic_vector(7 downto 0);
signal sig_error: signed (7 downto 0);


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
        duty_cycle2_out  => sig_duty_cycle2,
        duty_cycle3_out  => open, --sig_duty_cycle3 (was to check)
        Pgain_out        => sig_gain,
        freq_sinWave_out => sig_freq_sinWave,
        adc_val_in => adc_data_reg
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
PWMcircuit : pwm_8bit
        port map(duty_cycle_in    =>  sig_duty_cycle3,
           clk_200M_in => clk_in,
           enable_in => pwm_enable,
           reset_in => sig_reset,
           pwm_out => sig_pwm_out3
           );
        
----------------------------------------------------------------------
-- Adc data collector wrapper
----------------------------------------------------------
ADC_DATA_COLLECTOR_WRAPPER : adc_data_collectorMartin

port map ( clk_200M  => clk_in,
           spi_data_in  => spi_in,
           spi_clk_out  => spi_clk_out,
           spi_cs_out  => spi_cs_out ,
           data_bus_out  => adc_data_reg,
           new_data_out  => open); 
----------------------------------------------------------------------
-- Wave generator that will be compared to adc_data_reg
----------------------------------------------------------
SIN_WAVE_GEN : sinWave
port map (clk_200m_in => clk_in,
          freq_in => sig_freq_sinWave,
          o_data => sig_wave_gen);

--TRI_WAVE_GEN : triWave
--port map (clk_200m_in => clk_in
--          wave_out => open);
    
----------------------------------------------------------------------
-- Comperator
----------------------------------------------------------
COMPERATOR_WRAPPER : comperator
           
port map (adc_in => adc_data_reg ,
          clk_200m_in  => clk_in ,
          fixed_in  => sig_wave_gen,
          err_o  => sig_error);  

----------------------------------------------------------------------
-- Pcontrol from error to pwm
----------------------------------------------------------
PIcontrol : PI_ctrl
port map (err_in => sig_error,
          orig_in => sig_wave_gen , 
          clk_200m_in => clk_in,
          k_gain => sig_gain,
          ctrl_o => sig_duty_cycle3);   
                
       
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
--sig_duty_cycle3 <= "00000011";
pwm_circuit <= sig_pwm_out3;
pwm_enable <= '1';

----------------------------------------------------------------------
-- sinWave, triWave, comparator and Pcontrol connections
----------------------------------------------------------------------


 
end Behavioral;
