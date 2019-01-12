--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Wed Nov  7 09:37:34 2018
--Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
--Command     : generate_target unity_excercise_design_1_wrapper.bd
--Design      : unity_excercise_design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity unity_excercise_design_1_wrapper is
  port (
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    led_b_out_0 : out STD_LOGIC;
    led_g_out_0 : out STD_LOGIC;
    led_r_out_0 : out STD_LOGIC;
    uart0_rxd : in STD_LOGIC;
    uart0_txd : out STD_LOGIC;
    uart_rx_in_0 : in STD_LOGIC;
    uart_tx_out_0 : out STD_LOGIC
  );
end unity_excercise_design_1_wrapper;

architecture STRUCTURE of unity_excercise_design_1_wrapper is
  component unity_excercise_design_1 is
  port (
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    uart0_rxd : in STD_LOGIC;
    uart0_txd : out STD_LOGIC;
    uart_rx_in_0 : in STD_LOGIC;
    uart_tx_out_0 : out STD_LOGIC;
    led_r_out_0 : out STD_LOGIC;
    led_g_out_0 : out STD_LOGIC;
    led_b_out_0 : out STD_LOGIC
  );
  end component unity_excercise_design_1;
begin
unity_excercise_design_1_i: component unity_excercise_design_1
     port map (
      FIXED_IO_mio(31 downto 0) => FIXED_IO_mio(31 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      led_b_out_0 => led_b_out_0,
      led_g_out_0 => led_g_out_0,
      led_r_out_0 => led_r_out_0,
      uart0_rxd => uart0_rxd,
      uart0_txd => uart0_txd,
      uart_rx_in_0 => uart_rx_in_0,
      uart_tx_out_0 => uart_tx_out_0
    );
end STRUCTURE;
