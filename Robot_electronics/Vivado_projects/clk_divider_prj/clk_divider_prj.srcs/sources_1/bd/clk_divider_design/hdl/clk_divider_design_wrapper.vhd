--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Thu Oct 18 11:49:57 2018
--Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
--Command     : generate_target clk_divider_design_wrapper.bd
--Design      : clk_divider_design_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_divider_design_wrapper is
  port (
    clk_in_0 : in STD_LOGIC;
    divider_o_0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end clk_divider_design_wrapper;

architecture STRUCTURE of clk_divider_design_wrapper is
  component clk_divider_design is
  port (
    clk_in_0 : in STD_LOGIC;
    divider_o_0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component clk_divider_design;
begin
clk_divider_design_i: component clk_divider_design
     port map (
      clk_in_0 => clk_in_0,
      divider_o_0(3 downto 0) => divider_o_0(3 downto 0)
    );
end STRUCTURE;
