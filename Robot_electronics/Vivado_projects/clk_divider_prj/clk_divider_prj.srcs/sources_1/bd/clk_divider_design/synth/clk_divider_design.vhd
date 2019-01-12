--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Thu Oct 18 11:49:57 2018
--Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
--Command     : generate_target clk_divider_design.bd
--Design      : clk_divider_design
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_divider_design is
  port (
    clk_in_0 : in STD_LOGIC;
    divider_o_0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of clk_divider_design : entity is "clk_divider_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clk_divider_design,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of clk_divider_design : entity is "clk_divider_design.hwdef";
end clk_divider_design;

architecture STRUCTURE of clk_divider_design is
  component clk_divider_design_clk_divider_0_0 is
  port (
    clk_in : in STD_LOGIC;
    divider_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component clk_divider_design_clk_divider_0_0;
  signal clk_divider_0_divider_o : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal clk_in_0_1 : STD_LOGIC;
begin
  clk_in_0_1 <= clk_in_0;
  divider_o_0(3 downto 0) <= clk_divider_0_divider_o(3 downto 0);
clk_divider_0: component clk_divider_design_clk_divider_0_0
     port map (
      clk_in => clk_in_0_1,
      divider_o(3 downto 0) => clk_divider_0_divider_o(3 downto 0)
    );
end STRUCTURE;
