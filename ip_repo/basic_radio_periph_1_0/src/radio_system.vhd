library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.NUMERIC_STD.all;

entity radio_system is
  port (
    clk125                          : in  std_logic;
    aresetn                         : in  std_logic;
    filter_bypass                   : in  std_logic;
    surrogate_adc_axis_phase_tvalid : in  std_logic;
    surrogate_adc_axis_phase_tdata  : in  std_logic_vector(31 downto 0);
    tuning_dds_axis_phase_tvalid    : in  std_logic;
    tuning_dds_axis_phase_tdata     : in  std_logic_vector(31 downto 0);
    radio_axis_data_tvalid          : out std_logic;
    radio_axis_data_tdata           : out std_logic_vector(31 downto 0);
    radio_axis_data_tready          : in  std_logic
  );
end entity;

architecture Behavioral of radio_system is
  --------------------------------- COMPONENTS ---------------------------------
  component surrogate_adc is
    port (
      aclk                : in  STD_LOGIC;
      aresetn             : in  STD_LOGIC;
      s_axis_phase_tvalid : in  STD_LOGIC;
      s_axis_phase_tdata  : in  STD_LOGIC_VECTOR(31 downto 0);
      m_axis_data_tvalid  : out STD_LOGIC;
      m_axis_data_tdata   : out STD_LOGIC_VECTOR(15 downto 0)
    );
  end component;

  component tuning_dds is
    port (
      aclk                : in  STD_LOGIC;
      aresetn             : in  STD_LOGIC;
      s_axis_phase_tvalid : in  STD_LOGIC;
      s_axis_phase_tdata  : in  STD_LOGIC_VECTOR(31 downto 0);
      m_axis_data_tvalid  : out STD_LOGIC;
      m_axis_data_tdata   : out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component cmpy_0 is
    port (
      aclk               : in  STD_LOGIC;
      aresetn            : in  STD_LOGIC;
      s_axis_a_tvalid    : in  STD_LOGIC;
      s_axis_a_tdata     : in  STD_LOGIC_VECTOR(31 downto 0);
      s_axis_b_tvalid    : in  STD_LOGIC;
      s_axis_b_tdata     : in  STD_LOGIC_VECTOR(31 downto 0);
      m_axis_dout_tvalid : out STD_LOGIC;
      m_axis_dout_tdata  : out STD_LOGIC_VECTOR(79 downto 0)
    );
  end component;

  component fir_compiler_1 is
    port (
      aresetn            : in  STD_LOGIC;
      aclk               : in  STD_LOGIC;
      s_axis_data_tvalid : in  STD_LOGIC;
      s_axis_data_tready : out STD_LOGIC;
      s_axis_data_tdata  : in  STD_LOGIC_VECTOR(15 downto 0);
      m_axis_data_tvalid : out STD_LOGIC;
      m_axis_data_tdata  : out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  component fir_compiler_2 is
    port (
      aresetn            : in  STD_LOGIC;
      aclk               : in  STD_LOGIC;
      s_axis_data_tvalid : in  STD_LOGIC;
      s_axis_data_tready : out STD_LOGIC;
      s_axis_data_tdata  : in  STD_LOGIC_VECTOR(31 downto 0);
      m_axis_data_tvalid : out STD_LOGIC;
      m_axis_data_tready : in  STD_LOGIC;
      m_axis_data_tdata  : out STD_LOGIC_VECTOR(47 downto 0)
    );
  end component;

  ---------------------------------- SIGNALS -----------------------------------
  signal surrogate_adc_data       : std_logic_vector(15 downto 0);
  signal surrogate_adc_data_valid : std_logic;
  signal surrogate_adc_data_pad   : std_logic_vector(31 downto 0);

  signal tuning_dds_data       : std_logic_vector(31 downto 0);
  signal tuning_dds_data_valid : std_logic;

  signal mixed_data       : std_logic_vector(79 downto 0);
  signal mixed_data_valid : std_logic;
  signal mixed_i_data     : std_logic_vector(15 downto 0);
  signal mixed_q_data     : std_logic_vector(15 downto 0);

  signal fir1_out_data_real       : std_logic_vector(31 downto 0);
  signal fir1_out_data_valid_real : std_logic;
  signal fir1_out_data_imag       : std_logic_vector(31 downto 0);
  signal fir1_out_data_valid_imag : std_logic;
  signal fir2_out_data_real       : std_logic_vector(47 downto 0);
  signal fir2_out_data_valid_real : std_logic;
  signal fir2_out_data_imag       : std_logic_vector(47 downto 0);
  signal fir2_out_data_valid_imag : std_logic;
  
  signal fir2_ready_real  : std_logic;
  signal fir2_ready_imag  : std_logic;
  
begin

  i_surrogate_adc: surrogate_adc
    port map (
      aclk                => clk125,
      aresetn             => aresetn,
      s_axis_phase_tvalid => surrogate_adc_axis_phase_tvalid,
      s_axis_phase_tdata  => surrogate_adc_axis_phase_tdata,
      m_axis_data_tvalid  => surrogate_adc_data_valid,
      m_axis_data_tdata   => surrogate_adc_data
    );

  -- Pad the Q data (imaginary) to be 0 for the surrogate ADC - Cosine only
  surrogate_adc_data_pad(31 downto 16) <= (others => '0');
  surrogate_adc_data_pad(15 downto 0)  <= surrogate_adc_data;

  i_tuning_dds: tuning_dds
    port map (
      aclk                => clk125,
      aresetn             => aresetn,
      s_axis_phase_tvalid => tuning_dds_axis_phase_tvalid,
      s_axis_phase_tdata  => tuning_dds_axis_phase_tdata,
      m_axis_data_tvalid  => tuning_dds_data_valid,
      m_axis_data_tdata   => tuning_dds_data
    );

  i_cmpy_0: cmpy_0
    port map (
      aclk               => clk125,
      aresetn            => aresetn,
      s_axis_a_tvalid    => surrogate_adc_data_valid,
      s_axis_a_tdata     => surrogate_adc_data_pad,
      s_axis_b_tvalid    => tuning_dds_data_valid,
      s_axis_b_tdata     => tuning_dds_data,
      m_axis_dout_tvalid => mixed_data_valid,
      m_axis_dout_tdata  => mixed_data
    );

  -- divide by 2^14 to account for rounding (shift 14 bits)
  mixed_i_data <= mixed_data(29 downto 14);
  mixed_q_data <= mixed_data(69 downto 54);

  i_fir_compiler_1_real: fir_compiler_1
    port map (
      aresetn            => aresetn,
      aclk               => clk125,
      s_axis_data_tvalid => mixed_data_valid,
      s_axis_data_tready => open,
      s_axis_data_tdata  => mixed_i_data,
      m_axis_data_tvalid => fir1_out_data_valid_real,
      m_axis_data_tdata  => fir1_out_data_real
    );

  i_fir_compiler_1_imag: fir_compiler_1
    port map (
      aresetn            => aresetn,
      aclk               => clk125,
      s_axis_data_tvalid => mixed_data_valid,
      s_axis_data_tready => open,
      s_axis_data_tdata  => mixed_q_data,
      m_axis_data_tvalid => fir1_out_data_valid_imag,
      m_axis_data_tdata  => fir1_out_data_imag
    );

  i_fir_compiler_2_real: fir_compiler_2
    port map (
      aresetn            => aresetn,
      aclk               => clk125,
      s_axis_data_tvalid => fir1_out_data_valid_real,
      s_axis_data_tready => open,
      s_axis_data_tdata  => fir1_out_data_real,
      m_axis_data_tready => radio_axis_data_tready,
      m_axis_data_tvalid => fir2_out_data_valid_real,
      m_axis_data_tdata  => fir2_out_data_real
    );

  i_fir_compiler_2_imag: fir_compiler_2
    port map (
      aresetn            => aresetn,
      aclk               => clk125,
      s_axis_data_tvalid => fir1_out_data_valid_imag,
      s_axis_data_tready => open,
      s_axis_data_tdata  => fir1_out_data_imag,
      m_axis_data_tready => radio_axis_data_tready,
      m_axis_data_tvalid => fir2_out_data_valid_imag,
      m_axis_data_tdata  => fir2_out_data_imag
    );


  bypass_filter_proc: process (clk125)
  begin
    if rising_edge(clk125) then
      if filter_bypass = '1' then
        -- direct surrogate ADC output
        radio_axis_data_tdata <= surrogate_adc_data & surrogate_adc_data;
        radio_axis_data_tvalid <= surrogate_adc_data_valid;
      else
        -- account for FIR compiler scaling/gain and assign real to rigth channel (MSB), imaginary to left channel (LSB)
        radio_axis_data_tdata <= fir2_out_data_real(45 downto 30) & fir2_out_data_imag(45 downto 30);
        radio_axis_data_tvalid <= fir2_out_data_valid_real and fir2_out_data_valid_imag;
      end if;
    end if;
  end process;

end architecture;
