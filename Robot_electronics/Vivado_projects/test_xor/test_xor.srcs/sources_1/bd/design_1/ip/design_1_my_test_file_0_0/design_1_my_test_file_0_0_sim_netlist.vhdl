-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Wed Oct 17 14:49:58 2018
-- Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/tj/Documents/Xilinx/Projects/test_xor/test_xor.srcs/sources_1/bd/design_1/ip/design_1_my_test_file_0_0/design_1_my_test_file_0_0_sim_netlist.vhdl
-- Design      : design_1_my_test_file_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z007sclg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_my_test_file_0_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Q : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_my_test_file_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_my_test_file_0_0 : entity is "design_1_my_test_file_0_0,my_test_file,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_my_test_file_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_my_test_file_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_my_test_file_0_0 : entity is "my_test_file,Vivado 2018.2";
end design_1_my_test_file_0_0;

architecture STRUCTURE of design_1_my_test_file_0_0 is
begin
Q_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B,
      I1 => A,
      O => Q
    );
end STRUCTURE;
