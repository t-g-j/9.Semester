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
       pwm_0    : out STD_LOGIC_VECTOR(7 downto 0);
       pwm_1    : out STD_LOGIC_VECTOR(7 downto 0);
       pwm_2    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component;

----------------------------------------------------------------------
-- Blink component
----------------------------------------------------------------------
component blink_led is
    Port ( clk_200M_in  : in STD_LOGIC;
           q_out        : out STD_LOGIC); --- 1Hz
end component;


----------------------------------------------------------------------
-- PWM0 component
----------------------------------------------------------------------

component pwm_8bit is
    Port ( clk_200M_in              : in STD_LOGIC;
           duty_cycle_in            : in STD_LOGIC_VECTOR (7 downto 0);
           enable_in                : in STD_LOGIC;
           reset_in                 : in STD_LOGIC;
           pwm_out                  : out STD_LOGIC);
end component;
----------------------------------------------------------------------
-- SPI_ctrl0 component
----------------------------------------------------------------------

--component spi_ctrl is
--    Port(   clk_200m_in         : in STD_LOGIC;
--            trigger_in          : in STD_LOGIC;
--            data_in             : in STD_LOGIC;
--            spi_clk_out         : out STD_LOGIC;
--            cs_out              : out STD_LOGIC;
--            data_out            : out STD_LOGIC;
--            new_data_out        : out STD_LOGIC;
--            spi_busy_out        : out STD_LOGIC);
--end component;
----------------------------------------------------------------------
-- ADC_sensor0 component
----------------------------------------------------------------------
component ADC_sensor is
    Port(   clk_200m_in         : in STD_LOGIC;
            dummy               : out STD_LOGIC);
end component;    

    
signal r_reg        : std_logic;
signal g_reg        : std_logic;
signal b_reg        : std_logic;
signal blink_reg    : std_logic; -- q_out

-- PWM signals
signal reset_pwm0   : STD_LOGIC;
signal p_out0        : STD_LOGIC;
signal p_out1        : STD_LOGIC;
signal p_out2        : STD_LOGIC;
signal duty_0     : STD_LOGIC_VECTOR(7 downto 0);
signal duty_1     : STD_LOGIC_VECTOR(7 downto 0);
signal duty_2     : STD_LOGIC_VECTOR(7 downto 0);

-- ADC_sensor signals
signal dum      : STD_LOGIC;
signal starting : STD_LOGIC;   

---- SPI signals
--signal spi_data_in      : STD_LOGIC;
--signal spi_clk          : STD_LOGIC;
--signal chip_select      : STD_LOGIC;
--signal spi_data_out     : STD_LOGIC;
--signal spi_new_data_out : STD_LOGIC;
--signal spi_b_out        : STD_LOGIC; 
begin
----------------------------------------------------------------------
-- ADC_sensor component wrapper
----------------------------------------------------------------------

ADC_sensor0 : ADC_sensor
    port map(
        clk_200m_in     => clk_in,
        dummy           => dum
        --start_proc      => starting
    );

------------------------------------------------------------------------
----  spi_ctrl component wrapper
------------------------------------------------------------------------

--spi_ctrl0 : spi_ctrl
--    port map(
--        clk_200m_in     => clk_in,
--        trigger_in      => starting,
--        data_in         =>  spi_data_in, 
--        spi_clk_out     => spi_clk,
--        cs_out          => chip_select,
--        data_out        => spi_data_out,
--        new_data_out    => spi_new_data_out,
--        spi_busy_out    => spi_b_out
--    );

----------------------------------------------------------------------
-- PWM1 component wrapper
----------------------------------------------------------------------

PWM_0 : pwm_8bit
    port map(
        clk_200M_in     => clk_in,
        duty_cycle_in   => duty_0,            
        enable_in       => blink_reg,
        reset_in        => reset_pwm0,
        pwm_out         => p_out0                   
    );
----------------------------------------------------------------------
-- PWM1 component wrapper
----------------------------------------------------------------------
PWM_1 : pwm_8bit
    port map(
        clk_200M_in     => clk_in,
        duty_cycle_in   => duty_1,            
        enable_in       => blink_reg,
        reset_in        => reset_pwm0,
        pwm_out         => p_out1                   
    );

----------------------------------------------------------------------
-- PWM2 component wrapper
----------------------------------------------------------------------
PWM_2 : pwm_8bit
    port map(
        clk_200M_in     => clk_in,
        duty_cycle_in   => duty_2,            
        enable_in       => blink_reg,
        reset_in        => reset_pwm0,
        pwm_out         => p_out2                   
    );

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
        pwm_0       => duty_0,
        pwm_1       => duty_1,
        pwM_2       => duty_2
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
-- LED connections
----------------------------------------------------------------------
led_r_out <= not (blink_reg and not r_reg and p_out0); -- and i PWM signal paranteser
led_g_out <= not (blink_reg and not g_reg and p_out1);
led_b_out <= not (blink_reg and not b_reg and p_out2);
 
end Behavioral;
