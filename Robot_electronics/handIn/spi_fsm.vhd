----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Martin Skriver
-- 
-- Create Date: 11/05/2018 02:18:58 PM
-- Design Name: 
-- Module Name: spi_fsm - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Simple SPI driver
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
use IEEE.NUMERIC_STD.ALL;

entity spi_fsm is
    Port ( clk_200M_in      : in STD_LOGIC;
           trg_in           : in STD_LOGIC;
           spi_clk_out      : out STD_LOGIC;
           cs_out           : out STD_LOGIC;
           data_in          : in STD_LOGIC;
           data_bus_out     : out std_logic_vector(7 downto 0);
           data_ready_out   : out std_logic
           );
end spi_fsm;

architecture Behavioral of spi_fsm is

----------------------------------------------------------------------
-- Signals 
----------------------------------------------------------------------
    type spi_states is (idle, cs_pulse, conv_setup, spi_clk_low, spi_clk_high, busy_state);
    signal pr_state, nx_state   : spi_states;
    
    constant t_cs_pulse         : natural := 6;
    constant t_adc_setup        : natural := 2;
    constant t_quit             : natural := 2;
    constant spi_clk_count      : natural := 16;
    
    signal timer_reg            : natural range 0 to 200000000 := 0;
    signal bit_counter          : natural range 0 to 16 := 0;
    signal output_buffer        : std_logic_vector(7 downto 0) := (others => '0');

begin

----------------------------------------------------------------------
-- Set output registers
----------------------------------------------------------------------
process(clk_200M_in, pr_state)
begin
    if rising_edge(clk_200M_in) then
        data_ready_out <= '0';
        if(pr_state /= nx_state) then
            if(pr_state = idle) then
                bit_counter <= 0;
            elsif(pr_state = spi_clk_low) then
                bit_counter <= bit_counter + 1;
            elsif((pr_state = spi_clk_high) and (bit_counter > 1) and (bit_counter < 10)) then
                output_buffer(8-(bit_counter-1)) <= data_in;
            elsif((pr_state = spi_clk_high) and (bit_counter = 10)) then
                data_bus_out <= output_buffer;
                data_ready_out <= '1';
            end if;
        end if;
    end if;
end process;

----------------------------------------------------------------------
-- Timer process
----------------------------------------------------------------------
process (clk_200M_in)
begin
    if rising_edge(clk_200M_in) then
        if((pr_state = idle) or (pr_state /= nx_state)) then
            timer_reg <= 0;
        else
            timer_reg <= timer_reg + 1;
        end if;
    end if;

end process;

----------------------------------------------------------------------
-- State register FSM
----------------------------------------------------------------------
process (clk_200M_in)
begin
    if rising_edge(clk_200M_in) then
        pr_state <= nx_state;
    end if;
end process;

----------------------------------------------------------------------
-- Combinational logic FSM
----------------------------------------------------------------------
process (pr_state, trg_in, timer_reg, bit_counter)
begin
    cs_out <= '0';
    spi_clk_out <= '1';
    
    case pr_state is
        when idle =>
            cs_out <= '1';   
            if(trg_in = '1') then
                nx_state <= conv_setup;
            else
                nx_state <= idle;     
            end if;

        when cs_pulse =>
            if(timer_reg = t_cs_pulse) then
                nx_state <= conv_setup;
            else
                nx_state <= cs_pulse;  
                cs_out <= '1';      
            end if;

        when conv_setup =>
            if(timer_reg = t_adc_setup) then
                nx_state <= spi_clk_low;
            else
                nx_state <= conv_setup;
            end if;

        when spi_clk_low =>
            spi_clk_out <= '0';
            if(timer_reg = t_adc_setup) then
                nx_state <= spi_clk_high;
            else
                nx_state <= spi_clk_low;
            end if;

        when spi_clk_high =>
            if (timer_reg = t_adc_setup) then
                nx_state <= spi_clk_low;
                if (spi_clk_count = bit_counter) then
                    nx_state <= busy_state;
                end if;
            else
                nx_state <= spi_clk_high;
            end if;

        when busy_state =>
            if(timer_reg = t_quit) then
                nx_state <= idle;
            else
                nx_state <= busy_state;
            end if;


    end case;
end process;

end Behavioral;
