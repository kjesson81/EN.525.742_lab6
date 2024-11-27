library IEEE;
  use IEEE.std_logic_1164.all;
  use ieee.numeric_std.all;

entity lab6_top is --=====================================================
  port (
    -- clock and reset
    resetn            : in    std_logic;
    clk125            : in    std_logic;
    -- proc_system block desgin
    DDR_addr          : inout std_logic_vector(14 downto 0);
    DDR_ba            : inout std_logic_vector(2 downto 0);
    DDR_cas_n         : inout std_logic;
    DDR_ck_n          : inout std_logic;
    DDR_ck_p          : inout std_logic;
    DDR_cke           : inout std_logic;
    DDR_cs_n          : inout std_logic;
    DDR_dm            : inout std_logic_vector(3 downto 0);
    DDR_dq            : inout std_logic_vector(31 downto 0);
    DDR_dqs_n         : inout std_logic_vector(3 downto 0);
    DDR_dqs_p         : inout std_logic_vector(3 downto 0);
    DDR_odt           : inout std_logic;
    DDR_ras_n         : inout std_logic;
    DDR_reset_n       : inout std_logic;
    DDR_we_n          : inout std_logic;
    FIXED_IO_ddr_vrn  : inout std_logic;
    FIXED_IO_ddr_vrp  : inout std_logic;
    FIXED_IO_mio      : inout std_logic_vector(53 downto 0);
    FIXED_IO_ps_clk   : inout std_logic;
    FIXED_IO_ps_porb  : inout std_logic;
    FIXED_IO_ps_srstb : inout std_logic;
    leds              : out   std_logic_vector(3 downto 0);
    sw                : in    std_logic_vector(3 downto 0);
    -- SSM2603 audio codec
    SSM2603_bclk      : out   std_logic;
    SSM2603_pbdat     : out   std_logic;
    SSM2603_pblrc     : out   std_logic;
    SSM2603_recdat    : in    std_logic;
    SSM2603_reclrc    : out   std_logic;
    SSM2603_sda       : inout std_logic;
    SSM2603_scl       : inout std_logic;
    SSM2603_mute      : out   std_logic;
    SSM2603_mclk      : out   std_logic
  );
end entity; --==================================================================

architecture Behavioral of lab6_top is --=================================

  ------------------------------------------------------------------------------
  --                              COMPONENTS                                  --
  ------------------------------------------------------------------------------
  component proc_system_wrapper is
    port (
      DDR_addr          : inout STD_LOGIC_VECTOR(14 downto 0);
      DDR_ba            : inout STD_LOGIC_VECTOR(2 downto 0);
      DDR_cas_n         : inout STD_LOGIC;
      DDR_ck_n          : inout STD_LOGIC;
      DDR_ck_p          : inout STD_LOGIC;
      DDR_cke           : inout STD_LOGIC;
      DDR_cs_n          : inout STD_LOGIC;
      DDR_dm            : inout STD_LOGIC_VECTOR(3 downto 0);
      DDR_dq            : inout STD_LOGIC_VECTOR(31 downto 0);
      DDR_dqs_n         : inout STD_LOGIC_VECTOR(3 downto 0);
      DDR_dqs_p         : inout STD_LOGIC_VECTOR(3 downto 0);
      DDR_odt           : inout STD_LOGIC;
      DDR_ras_n         : inout STD_LOGIC;
      DDR_reset_n       : inout STD_LOGIC;
      DDR_we_n          : inout STD_LOGIC;
      FIXED_IO_ddr_vrn  : inout STD_LOGIC;
      FIXED_IO_ddr_vrp  : inout STD_LOGIC;
      FIXED_IO_mio      : inout STD_LOGIC_VECTOR(53 downto 0);
      FIXED_IO_ps_clk   : inout STD_LOGIC;
      FIXED_IO_ps_porb  : inout STD_LOGIC;
      FIXED_IO_ps_srstb : inout STD_LOGIC;
      IIC_scl_io        : inout STD_LOGIC;
      IIC_sda_io        : inout STD_LOGIC;
      clk125            : in    STD_LOGIC;
      sys_resetn        : in    STD_LOGIC;
      filter_bypass     : in    STD_LOGIC;
      bclk              : out   STD_LOGIC;
      lrck              : out   STD_LOGIC;
      mclk              : out   STD_LOGIC;
      sdata             : out   STD_LOGIC
    );
  end component;

  ------------------------------------------------------------------------------
  --                                SIGNALS                                   --
  ------------------------------------------------------------------------------
  signal sys_rstn     : std_logic;
  signal lrck         : std_logic;
  signal recdat       : std_logic; -- placeholder

  ------------------------------------------------------------------------------
  --                                ALIASES                                   --
  ------------------------------------------------------------------------------
  alias sysclk is clk125;

begin --==========================================================================

  ------------------------------------------------------------------------------
  --                         CONCURRENT STATEMENTS                            --
  ------------------------------------------------------------------------------
  sys_rstn <= not resetn; -- button is active high

  SSM2603_pblrc  <= lrck;
  SSM2603_reclrc <= lrck;
  SSM2603_mute   <= sw(3);          -- active low
  recdat         <= SSM2603_recdat; -- placeholder

  leds(0) <= sw(0);
  leds(1) <= sw(1);
  leds(2) <= sw(2);
  leds(3) <= sw(3);

  ------------------------------------------------------------------------------
  --                        COMPONENT INSTATIATIONS                           --
  ------------------------------------------------------------------------------
  i_proc_system_wrapper: proc_system_wrapper
    port map (
      DDR_addr          => DDR_addr,
      DDR_ba            => DDR_ba,
      DDR_cas_n         => DDR_cas_n,
      DDR_ck_n          => DDR_ck_n,
      DDR_ck_p          => DDR_ck_p,
      DDR_cke           => DDR_cke,
      DDR_cs_n          => DDR_cs_n,
      DDR_dm            => DDR_dm,
      DDR_dq            => DDR_dq,
      DDR_dqs_n         => DDR_dqs_n,
      DDR_dqs_p         => DDR_dqs_p,
      DDR_odt           => DDR_odt,
      DDR_ras_n         => DDR_ras_n,
      DDR_reset_n       => DDR_reset_n,
      DDR_we_n          => DDR_we_n,
      FIXED_IO_ddr_vrn  => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp  => FIXED_IO_ddr_vrp,
      FIXED_IO_mio      => FIXED_IO_mio,
      FIXED_IO_ps_clk   => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb  => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      IIC_scl_io        => SSM2603_scl,
      IIC_sda_io        => SSM2603_sda,
      clk125            => sysclk,
      sys_resetn        => sys_rstn,
      filter_bypass     => sw(0),
      bclk              => SSM2603_bclk,
      lrck              => lrck,
      mclk              => SSM2603_mclk,
      sdata             => SSM2603_pbdat
    );

  ------------------------------------------------------------------------------
  --                                PROCESSES                                 --
  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------
  --                               ILA INSTANCES                              --
  ------------------------------------------------------------------------------
end architecture;
