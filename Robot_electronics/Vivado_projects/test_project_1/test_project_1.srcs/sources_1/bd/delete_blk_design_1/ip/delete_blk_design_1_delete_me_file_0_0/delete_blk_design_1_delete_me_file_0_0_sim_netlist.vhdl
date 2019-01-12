-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Wed Oct 17 14:26:48 2018
-- Host        : tj-mac running 64-bit Ubuntu 16.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/tj/Documents/Xilinx/Projects/test_project_1/test_project_1.srcs/sources_1/bd/delete_blk_design_1/ip/delete_blk_design_1_delete_me_file_0_0/delete_blk_design_1_delete_me_file_0_0_sim_netlist.vhdl
-- Design      : delete_blk_design_1_delete_me_file_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity delete_blk_design_1_delete_me_file_0_0_delete_me_file is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of delete_blk_design_1_delete_me_file_0_0_delete_me_file : entity is "delete_me_file";
end delete_blk_design_1_delete_me_file_0_0_delete_me_file;

architecture STRUCTURE of delete_blk_design_1_delete_me_file_0_0_delete_me_file is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \c[0]_i_1_n_0\ : STD_LOGIC;
  signal \c[1]_i_1_n_0\ : STD_LOGIC;
  signal \c[2]_i_1_n_0\ : STD_LOGIC;
  signal \c[3]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \c[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \c[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \c[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \c[3]_i_1\ : label is "soft_lutpair0";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
\c[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \c[0]_i_1_n_0\
    );
\c[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => \c[1]_i_1_n_0\
    );
\c[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      O => \c[2]_i_1_n_0\
    );
\c[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \c[3]_i_1_n_0\
    );
\c_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \c[0]_i_1_n_0\,
      Q => \^q\(0)
    );
\c_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \c[1]_i_1_n_0\,
      Q => \^q\(1)
    );
\c_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \c[2]_i_1_n_0\,
      Q => \^q\(2)
    );
\c_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      CLR => reset,
      D => \c[3]_i_1_n_0\,
      Q => \^q\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity delete_blk_design_1_delete_me_file_0_0 is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of delete_blk_design_1_delete_me_file_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of delete_blk_design_1_delete_me_file_0_0 : entity is "delete_blk_design_1_delete_me_file_0_0,delete_me_file,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of delete_blk_design_1_delete_me_file_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of delete_blk_design_1_delete_me_file_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of delete_blk_design_1_delete_me_file_0_0 : entity is "delete_me_file,Vivado 2018.2";
end delete_blk_design_1_delete_me_file_0_0;

architecture STRUCTURE of delete_blk_design_1_delete_me_file_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN delete_blk_design_1_clk_0";
  attribute x_interface_info of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute x_interface_parameter of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW";
begin
U0: entity work.delete_blk_design_1_delete_me_file_0_0_delete_me_file
     port map (
      Q(3 downto 0) => count(3 downto 0),
      clk => clk,
      reset => reset
    );
end STRUCTURE;
