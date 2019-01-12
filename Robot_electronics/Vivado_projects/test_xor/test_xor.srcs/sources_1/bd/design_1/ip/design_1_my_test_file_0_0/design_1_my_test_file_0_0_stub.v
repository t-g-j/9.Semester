// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Wed Oct 17 14:49:58 2018
// Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/tj/Documents/Xilinx/Projects/test_xor/test_xor.srcs/sources_1/bd/design_1/ip/design_1_my_test_file_0_0/design_1_my_test_file_0_0_stub.v
// Design      : design_1_my_test_file_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "my_test_file,Vivado 2018.2" *)
module design_1_my_test_file_0_0(A, B, Q)
/* synthesis syn_black_box black_box_pad_pin="A,B,Q" */;
  input A;
  input B;
  output Q;
endmodule
