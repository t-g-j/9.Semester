// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Wed Oct 17 14:26:47 2018
// Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/tj/Documents/Xilinx/Projects/test_project_1/test_project_1.srcs/sources_1/bd/delete_blk_design_1/ip/delete_blk_design_1_delete_me_file_0_0/delete_blk_design_1_delete_me_file_0_0_stub.v
// Design      : delete_blk_design_1_delete_me_file_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "delete_me_file,Vivado 2018.2" *)
module delete_blk_design_1_delete_me_file_0_0(clk, reset, count)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,count[3:0]" */;
  input clk;
  input reset;
  output [3:0]count;
endmodule
