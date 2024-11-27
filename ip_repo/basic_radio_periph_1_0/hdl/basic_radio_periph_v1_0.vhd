library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity basic_radio_periph_v1_0 is
  generic (
    -- Users to add parameters here
    -- User parameters ends
    -- Do not modify the parameters beyond this line
    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH : integer := 32;
    C_S00_AXI_ADDR_WIDTH : integer := 4
  );
  port (
    -- Users to add ports here
    filter_bypass   : in  std_logic;
    -- User ports ends
    -- Do not modify the ports beyond this line
    -- Ports of Axi Slave Bus Interface S00_AXI
    s00_axi_aclk    : in  std_logic;
    s00_axi_aresetn : in  std_logic;
    s00_axi_awaddr  : in  std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
    s00_axi_awprot  : in  std_logic_vector(2 downto 0);
    s00_axi_awvalid : in  std_logic;
    s00_axi_awready : out std_logic;
    s00_axi_wdata   : in  std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    s00_axi_wstrb   : in  std_logic_vector((C_S00_AXI_DATA_WIDTH / 8) - 1 downto 0);
    s00_axi_wvalid  : in  std_logic;
    s00_axi_wready  : out std_logic;
    s00_axi_bresp   : out std_logic_vector(1 downto 0);
    s00_axi_bvalid  : out std_logic;
    s00_axi_bready  : in  std_logic;
    s00_axi_araddr  : in  std_logic_vector(C_S00_AXI_ADDR_WIDTH - 1 downto 0);
    s00_axi_arprot  : in  std_logic_vector(2 downto 0);
    s00_axi_arvalid : in  std_logic;
    s00_axi_arready : out std_logic;
    s00_axi_rdata   : out std_logic_vector(C_S00_AXI_DATA_WIDTH - 1 downto 0);
    s00_axi_rresp   : out std_logic_vector(1 downto 0);
    s00_axi_rvalid  : out std_logic;
    s00_axi_rready  : in  std_logic;

    -- user defined master axis bus
    m00_axis_tvalid     : out std_logic;
    m00_axis_tdata      : out std_logic_vector(31 downto 0);
    m00_axis_data_ready : in  std_logic
  );
end entity;

architecture arch_imp of basic_radio_periph_v1_0 is

  signal radio_axis_data_tvalid : std_logic;
  signal radio_axis_data_tdata  : std_logic_vector(31 downto 0);
  signal radio_axis_data_ready  : std_logic;

  component basic_radio_periph_v1_0_S00_AXI is
    generic (
      C_S_AXI_DATA_WIDTH : integer;
      C_S_AXI_ADDR_WIDTH : integer
    );
    port (
      filter_bypass          : in  std_logic;
      radio_axis_data_tvalid : out std_logic;
      radio_axis_data_tdata  : out std_logic_vector(31 downto 0);
      radio_axis_data_ready  : in  std_logic;
      S_AXI_ACLK             : in  std_logic;
      S_AXI_ARESETN          : in  std_logic;
      S_AXI_AWADDR           : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
      S_AXI_AWPROT           : in  std_logic_vector(2 downto 0);
      S_AXI_AWVALID          : in  std_logic;
      S_AXI_AWREADY          : out std_logic;
      S_AXI_WDATA            : in  std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
      S_AXI_WSTRB            : in  std_logic_vector((C_S_AXI_DATA_WIDTH / 8) - 1 downto 0);
      S_AXI_WVALID           : in  std_logic;
      S_AXI_WREADY           : out std_logic;
      S_AXI_BRESP            : out std_logic_vector(1 downto 0);
      S_AXI_BVALID           : out std_logic;
      S_AXI_BREADY           : in  std_logic;
      S_AXI_ARADDR           : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
      S_AXI_ARPROT           : in  std_logic_vector(2 downto 0);
      S_AXI_ARVALID          : in  std_logic;
      S_AXI_ARREADY          : out std_logic;
      S_AXI_RDATA            : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
      S_AXI_RRESP            : out std_logic_vector(1 downto 0);
      S_AXI_RVALID           : out std_logic;
      S_AXI_RREADY           : in  std_logic
    );
  end component;

begin

  -- Instantiation of Axi Bus Interface S00_AXI
  i_basic_radio_periph_v1_0_S00_AXI: basic_radio_periph_v1_0_S00_AXI
    generic map (
      C_S_AXI_DATA_WIDTH => C_S00_AXI_DATA_WIDTH,
      C_S_AXI_ADDR_WIDTH => C_S00_AXI_ADDR_WIDTH
    )
    port map (
      filter_bypass          => filter_bypass,
      radio_axis_data_tvalid => radio_axis_data_tvalid,
      radio_axis_data_tdata  => radio_axis_data_tdata,
      radio_axis_data_ready  => radio_axis_data_ready,
      S_AXI_ACLK             => s00_axi_aclk,
      S_AXI_ARESETN          => s00_axi_aresetn,
      S_AXI_AWADDR           => s00_axi_awaddr,
      S_AXI_AWPROT           => s00_axi_awprot,
      S_AXI_AWVALID          => s00_axi_awvalid,
      S_AXI_AWREADY          => s00_axi_awready,
      S_AXI_WDATA            => s00_axi_wdata,
      S_AXI_WSTRB            => s00_axi_wstrb,
      S_AXI_WVALID           => s00_axi_wvalid,
      S_AXI_WREADY           => s00_axi_wready,
      S_AXI_BRESP            => s00_axi_bresp,
      S_AXI_BVALID           => s00_axi_bvalid,
      S_AXI_BREADY           => s00_axi_bready,
      S_AXI_ARADDR           => s00_axi_araddr,
      S_AXI_ARPROT           => s00_axi_arprot,
      S_AXI_ARVALID          => s00_axi_arvalid,
      S_AXI_ARREADY          => s00_axi_arready,
      S_AXI_RDATA            => s00_axi_rdata,
      S_AXI_RRESP            => s00_axi_rresp,
      S_AXI_RVALID           => s00_axi_rvalid,
      S_AXI_RREADY           => s00_axi_rready
    );

  -- Add user logic here
  m00_axis_tvalid       <= radio_axis_data_tvalid;
  m00_axis_tdata        <= radio_axis_data_tdata;
  radio_axis_data_ready <= m00_axis_data_ready;
  -- User logic ends
end architecture;
