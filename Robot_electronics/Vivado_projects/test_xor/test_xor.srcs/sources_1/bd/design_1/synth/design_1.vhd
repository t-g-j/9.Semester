--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Wed Oct 17 14:48:12 2018
--Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    A_0 : in STD_LOGIC;
    B_0 : in STD_LOGIC;
    Q_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_my_test_file_0_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Q : out STD_LOGIC
  );
  end component design_1_my_test_file_0_0;
  signal A_0_1 : STD_LOGIC;
  signal B_0_1 : STD_LOGIC;
  signal my_test_file_0_Q : STD_LOGIC;
begin
  A_0_1 <= A_0;
  B_0_1 <= B_0;
  Q_0 <= my_test_file_0_Q;
my_test_file_0: component design_1_my_test_file_0_0
     port map (
      A => A_0_1,
      B => B_0_1,
      Q => my_test_file_0_Q
    );
end STRUCTURE;
