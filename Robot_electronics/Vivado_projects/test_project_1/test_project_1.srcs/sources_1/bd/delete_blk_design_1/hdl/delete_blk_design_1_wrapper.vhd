--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Wed Oct 17 14:24:03 2018
--Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
--Command     : generate_target delete_blk_design_1_wrapper.bd
--Design      : delete_blk_design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity delete_blk_design_1_wrapper is
  port (
    clk_0 : in STD_LOGIC;
    count_0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end delete_blk_design_1_wrapper;

architecture STRUCTURE of delete_blk_design_1_wrapper is
  component delete_blk_design_1 is
  port (
    clk_0 : in STD_LOGIC;
    count_0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component delete_blk_design_1;
begin
delete_blk_design_1_i: component delete_blk_design_1
     port map (
      clk_0 => clk_0,
      count_0(3 downto 0) => count_0(3 downto 0)
    );
end STRUCTURE;
