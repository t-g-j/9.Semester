--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Wed Oct 17 14:24:02 2018
--Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
--Command     : generate_target delete_blk_design_1.bd
--Design      : delete_blk_design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity delete_blk_design_1 is
  port (
    clk_0 : in STD_LOGIC;
    count_0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of delete_blk_design_1 : entity is "delete_blk_design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=delete_blk_design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of delete_blk_design_1 : entity is "delete_blk_design_1.hwdef";
end delete_blk_design_1;

architecture STRUCTURE of delete_blk_design_1 is
  component delete_blk_design_1_delete_me_file_0_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component delete_blk_design_1_delete_me_file_0_0;
  signal clk_0_1 : STD_LOGIC;
  signal delete_me_file_0_count : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_0 : signal is "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN delete_blk_design_1_clk_0, FREQ_HZ 100000000, PHASE 0.000";
begin
  clk_0_1 <= clk_0;
  count_0(3 downto 0) <= delete_me_file_0_count(3 downto 0);
delete_me_file_0: component delete_blk_design_1_delete_me_file_0_0
     port map (
      clk => clk_0_1,
      count(3 downto 0) => delete_me_file_0_count(3 downto 0),
      reset => '0'
    );
end STRUCTURE;
