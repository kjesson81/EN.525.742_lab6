-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Wed Nov 20 21:13:54 2024
-- Host        : KAI-DESKTOP running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Xilinx/Projects/lab6/ip_repo/basic_radio_periph_1_0/src/lowlevel_dac_intfc_0/lowlevel_dac_intfc_0_sim_netlist.vhdl
-- Design      : lowlevel_dac_intfc_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lowlevel_dac_intfc_0_clkdivider is
  port (
    \cnt_reg[0]_0\ : out STD_LOGIC;
    mclk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    clk125 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of lowlevel_dac_intfc_0_clkdivider : entity is "clkdivider";
end lowlevel_dac_intfc_0_clkdivider;

architecture STRUCTURE of lowlevel_dac_intfc_0_clkdivider is
  signal cnt : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[2]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk12p5_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair3";
begin
clk12p5_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB04"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(2),
      I2 => cnt(1),
      I3 => mclk,
      O => \cnt_reg[0]_0\
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"008A"
    )
        port map (
      I0 => resetn,
      I1 => cnt(1),
      I2 => cnt(2),
      I3 => cnt(0),
      O => \cnt[0]_i_1_n_0\
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => resetn,
      I1 => cnt(1),
      I2 => cnt(0),
      O => \cnt[1]_i_1_n_0\
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2880"
    )
        port map (
      I0 => resetn,
      I1 => cnt(1),
      I2 => cnt(2),
      I3 => cnt(0),
      O => \cnt[2]_i_1_n_0\
    );
\cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => \cnt[0]_i_1_n_0\,
      Q => cnt(0),
      R => '0'
    );
\cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => \cnt[1]_i_1_n_0\,
      Q => cnt(1),
      R => '0'
    );
\cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => \cnt[2]_i_1_n_0\,
      Q => cnt(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \lowlevel_dac_intfc_0_clkdivider__parameterized0\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    resetn_0 : out STD_LOGIC;
    lrck_reg : out STD_LOGIC;
    bclk_i_reg : out STD_LOGIC;
    bclk_i_reg_0 : in STD_LOGIC;
    latched_data_reg : in STD_LOGIC;
    resetn : in STD_LOGIC;
    lrck : in STD_LOGIC;
    lrck_reg_0 : in STD_LOGIC;
    lrck_reg_1 : in STD_LOGIC;
    clk125 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \lowlevel_dac_intfc_0_clkdivider__parameterized0\ : entity is "clkdivider";
end \lowlevel_dac_intfc_0_clkdivider__parameterized0\;

architecture STRUCTURE of \lowlevel_dac_intfc_0_clkdivider__parameterized0\ is
  signal \cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal cnt_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal toggle_bclk : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of bclk_i_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of latched_data_i_1 : label is "soft_lutpair1";
begin
bclk_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => bclk_i_reg_0,
      I1 => toggle_bclk,
      I2 => resetn,
      O => bclk_i_reg
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_reg(0),
      O => p_0_in(0)
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt_reg(0),
      I1 => cnt_reg(1),
      O => p_0_in(1)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => cnt_reg(1),
      I1 => cnt_reg(0),
      I2 => cnt_reg(2),
      O => p_0_in(2)
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => cnt_reg(3),
      I1 => cnt_reg(1),
      I2 => cnt_reg(0),
      I3 => cnt_reg(2),
      O => p_0_in(3)
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => cnt_reg(3),
      I1 => cnt_reg(1),
      I2 => cnt_reg(0),
      I3 => cnt_reg(2),
      I4 => cnt_reg(4),
      O => p_0_in(4)
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => toggle_bclk,
      I1 => resetn,
      O => \cnt[5]_i_1_n_0\
    );
\cnt[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6CCCCCCCCCCCCCCC"
    )
        port map (
      I0 => cnt_reg(4),
      I1 => cnt_reg(5),
      I2 => cnt_reg(2),
      I3 => cnt_reg(0),
      I4 => cnt_reg(1),
      I5 => cnt_reg(3),
      O => p_0_in(5)
    );
\cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => p_0_in(0),
      Q => cnt_reg(0),
      R => \cnt[5]_i_1_n_0\
    );
\cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => p_0_in(1),
      Q => cnt_reg(1),
      R => \cnt[5]_i_1_n_0\
    );
\cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => p_0_in(2),
      Q => cnt_reg(2),
      R => \cnt[5]_i_1_n_0\
    );
\cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => p_0_in(3),
      Q => cnt_reg(3),
      R => \cnt[5]_i_1_n_0\
    );
\cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => p_0_in(4),
      Q => cnt_reg(4),
      R => \cnt[5]_i_1_n_0\
    );
\cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => p_0_in(5),
      Q => cnt_reg(5),
      R => \cnt[5]_i_1_n_0\
    );
latched_data_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => latched_data_reg,
      I1 => resetn,
      I2 => bclk_i_reg_0,
      I3 => toggle_bclk,
      O => resetn_0
    );
lrck_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EA2A0000"
    )
        port map (
      I0 => lrck,
      I1 => toggle_bclk,
      I2 => lrck_reg_0,
      I3 => lrck_reg_1,
      I4 => resetn,
      O => lrck_reg
    );
\shiftreg[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => toggle_bclk,
      I1 => bclk_i_reg_0,
      O => E(0)
    );
\shiftreg[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000400000000000"
    )
        port map (
      I0 => cnt_reg(3),
      I1 => cnt_reg(1),
      I2 => cnt_reg(0),
      I3 => cnt_reg(2),
      I4 => cnt_reg(4),
      I5 => cnt_reg(5),
      O => toggle_bclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lowlevel_dac_intfc_0_lowlevel_dac_intfc is
  port (
    sdata : out STD_LOGIC;
    bclk_i_reg_0 : out STD_LOGIC;
    lrck : out STD_LOGIC;
    mclk : out STD_LOGIC;
    latched_data : out STD_LOGIC;
    clk125 : in STD_LOGIC;
    resetn : in STD_LOGIC;
    data_word : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of lowlevel_dac_intfc_0_lowlevel_dac_intfc : entity is "lowlevel_dac_intfc";
end lowlevel_dac_intfc_0_lowlevel_dac_intfc;

architecture STRUCTURE of lowlevel_dac_intfc_0_lowlevel_dac_intfc is
  signal SHIFT_LEFT : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \^bclk_i_reg_0\ : STD_LOGIC;
  signal bclk_tim_n_1 : STD_LOGIC;
  signal bclk_tim_n_2 : STD_LOGIC;
  signal bclk_tim_n_3 : STD_LOGIC;
  signal bitcount_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal clear : STD_LOGIC;
  signal \^lrck\ : STD_LOGIC;
  signal lrck_i_2_n_0 : STD_LOGIC;
  signal lrck_i_3_n_0 : STD_LOGIC;
  signal make12p5MHz_n_0 : STD_LOGIC;
  signal \^mclk\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal sel : STD_LOGIC;
  signal \shiftreg[0]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[10]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[11]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[12]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[13]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[14]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[15]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[16]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[17]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[18]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[19]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[1]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[20]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[21]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[22]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[23]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[24]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[25]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[26]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[27]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[28]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[29]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[2]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[30]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[31]_i_3_n_0\ : STD_LOGIC;
  signal \shiftreg[31]_i_5_n_0\ : STD_LOGIC;
  signal \shiftreg[3]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[4]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[5]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[6]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[7]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[8]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg[9]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bitcount[1]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \bitcount[2]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \bitcount[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \bitcount[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of lrck_i_2 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of lrck_i_3 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \shiftreg[10]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \shiftreg[11]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \shiftreg[12]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \shiftreg[13]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \shiftreg[14]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \shiftreg[15]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \shiftreg[16]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \shiftreg[17]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \shiftreg[18]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \shiftreg[19]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \shiftreg[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \shiftreg[20]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \shiftreg[21]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \shiftreg[22]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \shiftreg[23]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \shiftreg[24]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \shiftreg[25]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \shiftreg[26]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \shiftreg[27]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \shiftreg[28]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \shiftreg[29]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \shiftreg[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \shiftreg[30]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \shiftreg[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \shiftreg[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \shiftreg[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \shiftreg[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \shiftreg[7]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \shiftreg[8]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \shiftreg[9]_i_1\ : label is "soft_lutpair11";
begin
  bclk_i_reg_0 <= \^bclk_i_reg_0\;
  lrck <= \^lrck\;
  mclk <= \^mclk\;
bclk_i_reg: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => '1',
      D => bclk_tim_n_3,
      Q => \^bclk_i_reg_0\,
      R => '0'
    );
bclk_tim: entity work.\lowlevel_dac_intfc_0_clkdivider__parameterized0\
     port map (
      E(0) => sel,
      bclk_i_reg => bclk_tim_n_3,
      bclk_i_reg_0 => \^bclk_i_reg_0\,
      clk125 => clk125,
      latched_data_reg => \shiftreg[31]_i_5_n_0\,
      lrck => \^lrck\,
      lrck_reg => bclk_tim_n_2,
      lrck_reg_0 => lrck_i_2_n_0,
      lrck_reg_1 => lrck_i_3_n_0,
      resetn => resetn,
      resetn_0 => bclk_tim_n_1
    );
\bitcount[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bitcount_reg(0),
      O => plusOp(0)
    );
\bitcount[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => bitcount_reg(0),
      I1 => bitcount_reg(1),
      O => plusOp(1)
    );
\bitcount[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => bitcount_reg(1),
      I1 => bitcount_reg(0),
      I2 => bitcount_reg(2),
      O => plusOp(2)
    );
\bitcount[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => bitcount_reg(2),
      I1 => bitcount_reg(0),
      I2 => bitcount_reg(1),
      I3 => bitcount_reg(3),
      O => plusOp(3)
    );
\bitcount[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => bitcount_reg(3),
      I1 => bitcount_reg(4),
      I2 => bitcount_reg(1),
      I3 => bitcount_reg(0),
      I4 => bitcount_reg(2),
      O => plusOp(4)
    );
\bitcount_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => plusOp(0),
      Q => bitcount_reg(0),
      R => clear
    );
\bitcount_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => plusOp(1),
      Q => bitcount_reg(1),
      R => clear
    );
\bitcount_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => plusOp(2),
      Q => bitcount_reg(2),
      R => clear
    );
\bitcount_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => plusOp(3),
      Q => bitcount_reg(3),
      R => clear
    );
\bitcount_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => plusOp(4),
      Q => bitcount_reg(4),
      R => clear
    );
clk12p5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk125,
      CE => '1',
      D => make12p5MHz_n_0,
      Q => \^mclk\,
      R => '0'
    );
latched_data_reg: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => '1',
      D => bclk_tim_n_1,
      Q => latched_data,
      R => '0'
    );
lrck_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => bitcount_reg(0),
      I1 => \^bclk_i_reg_0\,
      I2 => bitcount_reg(1),
      I3 => bitcount_reg(2),
      I4 => bitcount_reg(3),
      O => lrck_i_2_n_0
    );
lrck_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => bitcount_reg(4),
      I1 => bitcount_reg(0),
      I2 => bitcount_reg(1),
      I3 => bitcount_reg(2),
      I4 => bitcount_reg(3),
      O => lrck_i_3_n_0
    );
lrck_reg: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => '1',
      D => bclk_tim_n_2,
      Q => \^lrck\,
      R => '0'
    );
make12p5MHz: entity work.lowlevel_dac_intfc_0_clkdivider
     port map (
      clk125 => clk125,
      \cnt_reg[0]_0\ => make12p5MHz_n_0,
      mclk => \^mclk\,
      resetn => resetn
    );
\shiftreg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => data_word(0),
      I1 => bitcount_reg(3),
      I2 => bitcount_reg(2),
      I3 => bitcount_reg(1),
      I4 => bitcount_reg(4),
      I5 => bitcount_reg(0),
      O => \shiftreg[0]_i_1_n_0\
    );
\shiftreg[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(10),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(10),
      O => \shiftreg[10]_i_1_n_0\
    );
\shiftreg[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(11),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(11),
      O => \shiftreg[11]_i_1_n_0\
    );
\shiftreg[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(12),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(12),
      O => \shiftreg[12]_i_1_n_0\
    );
\shiftreg[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(13),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(13),
      O => \shiftreg[13]_i_1_n_0\
    );
\shiftreg[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(14),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(14),
      O => \shiftreg[14]_i_1_n_0\
    );
\shiftreg[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(15),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(15),
      O => \shiftreg[15]_i_1_n_0\
    );
\shiftreg[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(16),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(16),
      O => \shiftreg[16]_i_1_n_0\
    );
\shiftreg[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(17),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(17),
      O => \shiftreg[17]_i_1_n_0\
    );
\shiftreg[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(18),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(18),
      O => \shiftreg[18]_i_1_n_0\
    );
\shiftreg[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(19),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(19),
      O => \shiftreg[19]_i_1_n_0\
    );
\shiftreg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(1),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(1),
      O => \shiftreg[1]_i_1_n_0\
    );
\shiftreg[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(20),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(20),
      O => \shiftreg[20]_i_1_n_0\
    );
\shiftreg[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(21),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(21),
      O => \shiftreg[21]_i_1_n_0\
    );
\shiftreg[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(22),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(22),
      O => \shiftreg[22]_i_1_n_0\
    );
\shiftreg[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(23),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(23),
      O => \shiftreg[23]_i_1_n_0\
    );
\shiftreg[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(24),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(24),
      O => \shiftreg[24]_i_1_n_0\
    );
\shiftreg[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(25),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(25),
      O => \shiftreg[25]_i_1_n_0\
    );
\shiftreg[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(26),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(26),
      O => \shiftreg[26]_i_1_n_0\
    );
\shiftreg[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(27),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(27),
      O => \shiftreg[27]_i_1_n_0\
    );
\shiftreg[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(28),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(28),
      O => \shiftreg[28]_i_1_n_0\
    );
\shiftreg[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(29),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(29),
      O => \shiftreg[29]_i_1_n_0\
    );
\shiftreg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(2),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(2),
      O => \shiftreg[2]_i_1_n_0\
    );
\shiftreg[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(30),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(30),
      O => \shiftreg[30]_i_1_n_0\
    );
\shiftreg[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => resetn,
      O => clear
    );
\shiftreg[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(31),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(31),
      O => \shiftreg[31]_i_3_n_0\
    );
\shiftreg[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => bitcount_reg(0),
      I1 => bitcount_reg(4),
      I2 => bitcount_reg(1),
      I3 => bitcount_reg(2),
      I4 => bitcount_reg(3),
      O => \shiftreg[31]_i_5_n_0\
    );
\shiftreg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(3),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(3),
      O => \shiftreg[3]_i_1_n_0\
    );
\shiftreg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(4),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(4),
      O => \shiftreg[4]_i_1_n_0\
    );
\shiftreg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(5),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(5),
      O => \shiftreg[5]_i_1_n_0\
    );
\shiftreg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(6),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(6),
      O => \shiftreg[6]_i_1_n_0\
    );
\shiftreg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(7),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(7),
      O => \shiftreg[7]_i_1_n_0\
    );
\shiftreg[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(8),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(8),
      O => \shiftreg[8]_i_1_n_0\
    );
\shiftreg[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => SHIFT_LEFT(9),
      I1 => \shiftreg[31]_i_5_n_0\,
      I2 => data_word(9),
      O => \shiftreg[9]_i_1_n_0\
    );
\shiftreg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[0]_i_1_n_0\,
      Q => SHIFT_LEFT(1),
      R => clear
    );
\shiftreg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[10]_i_1_n_0\,
      Q => SHIFT_LEFT(11),
      R => clear
    );
\shiftreg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[11]_i_1_n_0\,
      Q => SHIFT_LEFT(12),
      R => clear
    );
\shiftreg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[12]_i_1_n_0\,
      Q => SHIFT_LEFT(13),
      R => clear
    );
\shiftreg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[13]_i_1_n_0\,
      Q => SHIFT_LEFT(14),
      R => clear
    );
\shiftreg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[14]_i_1_n_0\,
      Q => SHIFT_LEFT(15),
      R => clear
    );
\shiftreg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[15]_i_1_n_0\,
      Q => SHIFT_LEFT(16),
      R => clear
    );
\shiftreg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[16]_i_1_n_0\,
      Q => SHIFT_LEFT(17),
      R => clear
    );
\shiftreg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[17]_i_1_n_0\,
      Q => SHIFT_LEFT(18),
      R => clear
    );
\shiftreg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[18]_i_1_n_0\,
      Q => SHIFT_LEFT(19),
      R => clear
    );
\shiftreg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[19]_i_1_n_0\,
      Q => SHIFT_LEFT(20),
      R => clear
    );
\shiftreg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[1]_i_1_n_0\,
      Q => SHIFT_LEFT(2),
      R => clear
    );
\shiftreg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[20]_i_1_n_0\,
      Q => SHIFT_LEFT(21),
      R => clear
    );
\shiftreg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[21]_i_1_n_0\,
      Q => SHIFT_LEFT(22),
      R => clear
    );
\shiftreg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[22]_i_1_n_0\,
      Q => SHIFT_LEFT(23),
      R => clear
    );
\shiftreg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[23]_i_1_n_0\,
      Q => SHIFT_LEFT(24),
      R => clear
    );
\shiftreg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[24]_i_1_n_0\,
      Q => SHIFT_LEFT(25),
      R => clear
    );
\shiftreg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[25]_i_1_n_0\,
      Q => SHIFT_LEFT(26),
      R => clear
    );
\shiftreg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[26]_i_1_n_0\,
      Q => SHIFT_LEFT(27),
      R => clear
    );
\shiftreg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[27]_i_1_n_0\,
      Q => SHIFT_LEFT(28),
      R => clear
    );
\shiftreg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[28]_i_1_n_0\,
      Q => SHIFT_LEFT(29),
      R => clear
    );
\shiftreg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[29]_i_1_n_0\,
      Q => SHIFT_LEFT(30),
      R => clear
    );
\shiftreg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[2]_i_1_n_0\,
      Q => SHIFT_LEFT(3),
      R => clear
    );
\shiftreg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[30]_i_1_n_0\,
      Q => SHIFT_LEFT(31),
      R => clear
    );
\shiftreg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[31]_i_3_n_0\,
      Q => sdata,
      R => clear
    );
\shiftreg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[3]_i_1_n_0\,
      Q => SHIFT_LEFT(4),
      R => clear
    );
\shiftreg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[4]_i_1_n_0\,
      Q => SHIFT_LEFT(5),
      R => clear
    );
\shiftreg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[5]_i_1_n_0\,
      Q => SHIFT_LEFT(6),
      R => clear
    );
\shiftreg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[6]_i_1_n_0\,
      Q => SHIFT_LEFT(7),
      R => clear
    );
\shiftreg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[7]_i_1_n_0\,
      Q => SHIFT_LEFT(8),
      R => clear
    );
\shiftreg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[8]_i_1_n_0\,
      Q => SHIFT_LEFT(9),
      R => clear
    );
\shiftreg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk125,
      CE => sel,
      D => \shiftreg[9]_i_1_n_0\,
      Q => SHIFT_LEFT(10),
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lowlevel_dac_intfc_0 is
  port (
    resetn : in STD_LOGIC;
    clk125 : in STD_LOGIC;
    data_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sdata : out STD_LOGIC;
    lrck : out STD_LOGIC;
    bclk : out STD_LOGIC;
    mclk : out STD_LOGIC;
    latched_data : out STD_LOGIC;
    valid : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of lowlevel_dac_intfc_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of lowlevel_dac_intfc_0 : entity is "lowlevel_dac_intfc_0,lowlevel_dac_intfc,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of lowlevel_dac_intfc_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of lowlevel_dac_intfc_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of lowlevel_dac_intfc_0 : entity is "lowlevel_dac_intfc,Vivado 2023.2";
end lowlevel_dac_intfc_0;

architecture STRUCTURE of lowlevel_dac_intfc_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk125 : signal is "xilinx.com:signal:clock:1.0 clk125 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk125 : signal is "XIL_INTERFACENAME clk125, ASSOCIATED_RESET resetn, ASSOCIATED_BUSIF data_in, FREQ_TOLERANCE_HZ -1, FREQ_HZ 100000000, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of latched_data : signal is "xilinx.com:interface:axis:1.0 data_in TREADY";
  attribute x_interface_info of resetn : signal is "xilinx.com:signal:reset:1.0 resetn RST";
  attribute x_interface_parameter of resetn : signal is "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of valid : signal is "xilinx.com:interface:axis:1.0 data_in TVALID";
  attribute x_interface_info of data_word : signal is "xilinx.com:interface:axis:1.0 data_in TDATA";
  attribute x_interface_parameter of data_word : signal is "XIL_INTERFACENAME data_in, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
U0: entity work.lowlevel_dac_intfc_0_lowlevel_dac_intfc
     port map (
      bclk_i_reg_0 => bclk,
      clk125 => clk125,
      data_word(31 downto 0) => data_word(31 downto 0),
      latched_data => latched_data,
      lrck => lrck,
      mclk => mclk,
      resetn => resetn,
      sdata => sdata
    );
end STRUCTURE;
