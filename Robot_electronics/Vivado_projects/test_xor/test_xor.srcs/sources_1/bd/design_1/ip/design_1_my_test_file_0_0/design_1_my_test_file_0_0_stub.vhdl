-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Wed Oct 17 14:49:58 2018
-- Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/tj/Documents/Xilinx/Projects/test_xor/test_xor.srcs/sources_1/bd/design_1/ip/design_1_my_test_file_0_0/design_1_my_test_file_0_0_stub.vhdl
-- Design      : design_1_my_test_file_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_my_test_file_0_0 is
  Port ( 
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Q : out STD_LOGIC
  );

end design_1_my_test_file_0_0;

architecture stub of design_1_my_test_file_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A,B,Q";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "my_test_file,Vivado 2018.2";
begin
end;
