-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Wed Oct 17 14:26:48 2018
-- Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/tj/Documents/Xilinx/Projects/test_project_1/test_project_1.srcs/sources_1/bd/delete_blk_design_1/ip/delete_blk_design_1_delete_me_file_0_0/delete_blk_design_1_delete_me_file_0_0_stub.vhdl
-- Design      : delete_blk_design_1_delete_me_file_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity delete_blk_design_1_delete_me_file_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end delete_blk_design_1_delete_me_file_0_0;

architecture stub of delete_blk_design_1_delete_me_file_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset,count[3:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "delete_me_file,Vivado 2018.2";
begin
end;
