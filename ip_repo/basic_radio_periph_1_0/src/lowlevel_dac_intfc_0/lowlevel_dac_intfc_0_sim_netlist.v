// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Nov 20 21:13:54 2024
// Host        : KAI-DESKTOP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Xilinx/Projects/lab6/ip_repo/basic_radio_periph_1_0/src/lowlevel_dac_intfc_0/lowlevel_dac_intfc_0_sim_netlist.v
// Design      : lowlevel_dac_intfc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "lowlevel_dac_intfc_0,lowlevel_dac_intfc,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "lowlevel_dac_intfc,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module lowlevel_dac_intfc_0
   (resetn,
    clk125,
    data_word,
    sdata,
    lrck,
    bclk,
    mclk,
    latched_data,
    valid);
  (* x_interface_info = "xilinx.com:signal:reset:1.0 resetn RST" *) (* x_interface_parameter = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input resetn;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk125 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk125, ASSOCIATED_RESET resetn, ASSOCIATED_BUSIF data_in, FREQ_TOLERANCE_HZ -1, FREQ_HZ 100000000, PHASE 0.0, INSERT_VIP 0" *) input clk125;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 data_in TDATA" *) (* x_interface_parameter = "XIL_INTERFACENAME data_in, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]data_word;
  output sdata;
  output lrck;
  output bclk;
  output mclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 data_in TREADY" *) output latched_data;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 data_in TVALID" *) input valid;

  wire bclk;
  wire clk125;
  wire [31:0]data_word;
  wire latched_data;
  wire lrck;
  wire mclk;
  wire resetn;
  wire sdata;

  lowlevel_dac_intfc_0_lowlevel_dac_intfc U0
       (.bclk_i_reg_0(bclk),
        .clk125(clk125),
        .data_word(data_word),
        .latched_data(latched_data),
        .lrck(lrck),
        .mclk(mclk),
        .resetn(resetn),
        .sdata(sdata));
endmodule

(* ORIG_REF_NAME = "clkdivider" *) 
module lowlevel_dac_intfc_0_clkdivider
   (\cnt_reg[0]_0 ,
    mclk,
    resetn,
    clk125);
  output \cnt_reg[0]_0 ;
  input mclk;
  input resetn;
  input clk125;

  wire clk125;
  wire [2:0]cnt;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[1]_i_1_n_0 ;
  wire \cnt[2]_i_1_n_0 ;
  wire \cnt_reg[0]_0 ;
  wire mclk;
  wire resetn;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFB04)) 
    clk12p5_i_1
       (.I0(cnt[0]),
        .I1(cnt[2]),
        .I2(cnt[1]),
        .I3(mclk),
        .O(\cnt_reg[0]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h008A)) 
    \cnt[0]_i_1 
       (.I0(resetn),
        .I1(cnt[1]),
        .I2(cnt[2]),
        .I3(cnt[0]),
        .O(\cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \cnt[1]_i_1 
       (.I0(resetn),
        .I1(cnt[1]),
        .I2(cnt[0]),
        .O(\cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2880)) 
    \cnt[2]_i_1 
       (.I0(resetn),
        .I1(cnt[1]),
        .I2(cnt[2]),
        .I3(cnt[0]),
        .O(\cnt[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(clk125),
        .CE(1'b1),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(cnt[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(clk125),
        .CE(1'b1),
        .D(\cnt[1]_i_1_n_0 ),
        .Q(cnt[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(clk125),
        .CE(1'b1),
        .D(\cnt[2]_i_1_n_0 ),
        .Q(cnt[2]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "clkdivider" *) 
module lowlevel_dac_intfc_0_clkdivider__parameterized0
   (E,
    resetn_0,
    lrck_reg,
    bclk_i_reg,
    bclk_i_reg_0,
    latched_data_reg,
    resetn,
    lrck,
    lrck_reg_0,
    lrck_reg_1,
    clk125);
  output [0:0]E;
  output resetn_0;
  output lrck_reg;
  output bclk_i_reg;
  input bclk_i_reg_0;
  input latched_data_reg;
  input resetn;
  input lrck;
  input lrck_reg_0;
  input lrck_reg_1;
  input clk125;

  wire [0:0]E;
  wire bclk_i_reg;
  wire bclk_i_reg_0;
  wire clk125;
  wire \cnt[5]_i_1_n_0 ;
  wire [5:0]cnt_reg;
  wire latched_data_reg;
  wire lrck;
  wire lrck_reg;
  wire lrck_reg_0;
  wire lrck_reg_1;
  wire [5:0]p_0_in;
  wire resetn;
  wire resetn_0;
  wire toggle_bclk;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h60)) 
    bclk_i_i_1
       (.I0(bclk_i_reg_0),
        .I1(toggle_bclk),
        .I2(resetn),
        .O(bclk_i_reg));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[1]_i_1 
       (.I0(cnt_reg[0]),
        .I1(cnt_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[2]_i_1 
       (.I0(cnt_reg[1]),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \cnt[3]_i_1 
       (.I0(cnt_reg[3]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt[4]_i_1 
       (.I0(cnt_reg[3]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[4]),
        .O(p_0_in[4]));
  LUT2 #(
    .INIT(4'hB)) 
    \cnt[5]_i_1 
       (.I0(toggle_bclk),
        .I1(resetn),
        .O(\cnt[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6CCCCCCCCCCCCCCC)) 
    \cnt[5]_i_2 
       (.I0(cnt_reg[4]),
        .I1(cnt_reg[5]),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[0]),
        .I4(cnt_reg[1]),
        .I5(cnt_reg[3]),
        .O(p_0_in[5]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(clk125),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(cnt_reg[0]),
        .R(\cnt[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(clk125),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(cnt_reg[1]),
        .R(\cnt[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(clk125),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(cnt_reg[2]),
        .R(\cnt[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(clk125),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(cnt_reg[3]),
        .R(\cnt[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(clk125),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(cnt_reg[4]),
        .R(\cnt[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(clk125),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(cnt_reg[5]),
        .R(\cnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    latched_data_i_1
       (.I0(latched_data_reg),
        .I1(resetn),
        .I2(bclk_i_reg_0),
        .I3(toggle_bclk),
        .O(resetn_0));
  LUT5 #(
    .INIT(32'hEA2A0000)) 
    lrck_i_1
       (.I0(lrck),
        .I1(toggle_bclk),
        .I2(lrck_reg_0),
        .I3(lrck_reg_1),
        .I4(resetn),
        .O(lrck_reg));
  LUT2 #(
    .INIT(4'h8)) 
    \shiftreg[31]_i_2 
       (.I0(toggle_bclk),
        .I1(bclk_i_reg_0),
        .O(E));
  LUT6 #(
    .INIT(64'h0000400000000000)) 
    \shiftreg[31]_i_4 
       (.I0(cnt_reg[3]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[4]),
        .I5(cnt_reg[5]),
        .O(toggle_bclk));
endmodule

(* ORIG_REF_NAME = "lowlevel_dac_intfc" *) 
module lowlevel_dac_intfc_0_lowlevel_dac_intfc
   (sdata,
    bclk_i_reg_0,
    lrck,
    mclk,
    latched_data,
    clk125,
    resetn,
    data_word);
  output sdata;
  output bclk_i_reg_0;
  output lrck;
  output mclk;
  output latched_data;
  input clk125;
  input resetn;
  input [31:0]data_word;

  wire [31:1]SHIFT_LEFT;
  wire bclk_i_reg_0;
  wire bclk_tim_n_1;
  wire bclk_tim_n_2;
  wire bclk_tim_n_3;
  wire [4:0]bitcount_reg;
  wire clear;
  wire clk125;
  wire [31:0]data_word;
  wire latched_data;
  wire lrck;
  wire lrck_i_2_n_0;
  wire lrck_i_3_n_0;
  wire make12p5MHz_n_0;
  wire mclk;
  wire [4:0]plusOp;
  wire resetn;
  wire sdata;
  wire sel;
  wire \shiftreg[0]_i_1_n_0 ;
  wire \shiftreg[10]_i_1_n_0 ;
  wire \shiftreg[11]_i_1_n_0 ;
  wire \shiftreg[12]_i_1_n_0 ;
  wire \shiftreg[13]_i_1_n_0 ;
  wire \shiftreg[14]_i_1_n_0 ;
  wire \shiftreg[15]_i_1_n_0 ;
  wire \shiftreg[16]_i_1_n_0 ;
  wire \shiftreg[17]_i_1_n_0 ;
  wire \shiftreg[18]_i_1_n_0 ;
  wire \shiftreg[19]_i_1_n_0 ;
  wire \shiftreg[1]_i_1_n_0 ;
  wire \shiftreg[20]_i_1_n_0 ;
  wire \shiftreg[21]_i_1_n_0 ;
  wire \shiftreg[22]_i_1_n_0 ;
  wire \shiftreg[23]_i_1_n_0 ;
  wire \shiftreg[24]_i_1_n_0 ;
  wire \shiftreg[25]_i_1_n_0 ;
  wire \shiftreg[26]_i_1_n_0 ;
  wire \shiftreg[27]_i_1_n_0 ;
  wire \shiftreg[28]_i_1_n_0 ;
  wire \shiftreg[29]_i_1_n_0 ;
  wire \shiftreg[2]_i_1_n_0 ;
  wire \shiftreg[30]_i_1_n_0 ;
  wire \shiftreg[31]_i_3_n_0 ;
  wire \shiftreg[31]_i_5_n_0 ;
  wire \shiftreg[3]_i_1_n_0 ;
  wire \shiftreg[4]_i_1_n_0 ;
  wire \shiftreg[5]_i_1_n_0 ;
  wire \shiftreg[6]_i_1_n_0 ;
  wire \shiftreg[7]_i_1_n_0 ;
  wire \shiftreg[8]_i_1_n_0 ;
  wire \shiftreg[9]_i_1_n_0 ;

  FDRE bclk_i_reg
       (.C(clk125),
        .CE(1'b1),
        .D(bclk_tim_n_3),
        .Q(bclk_i_reg_0),
        .R(1'b0));
  lowlevel_dac_intfc_0_clkdivider__parameterized0 bclk_tim
       (.E(sel),
        .bclk_i_reg(bclk_tim_n_3),
        .bclk_i_reg_0(bclk_i_reg_0),
        .clk125(clk125),
        .latched_data_reg(\shiftreg[31]_i_5_n_0 ),
        .lrck(lrck),
        .lrck_reg(bclk_tim_n_2),
        .lrck_reg_0(lrck_i_2_n_0),
        .lrck_reg_1(lrck_i_3_n_0),
        .resetn(resetn),
        .resetn_0(bclk_tim_n_1));
  LUT1 #(
    .INIT(2'h1)) 
    \bitcount[0]_i_1 
       (.I0(bitcount_reg[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bitcount[1]_i_1 
       (.I0(bitcount_reg[0]),
        .I1(bitcount_reg[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \bitcount[2]_i_1 
       (.I0(bitcount_reg[1]),
        .I1(bitcount_reg[0]),
        .I2(bitcount_reg[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \bitcount[3]_i_1 
       (.I0(bitcount_reg[2]),
        .I1(bitcount_reg[0]),
        .I2(bitcount_reg[1]),
        .I3(bitcount_reg[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \bitcount[4]_i_1 
       (.I0(bitcount_reg[3]),
        .I1(bitcount_reg[4]),
        .I2(bitcount_reg[1]),
        .I3(bitcount_reg[0]),
        .I4(bitcount_reg[2]),
        .O(plusOp[4]));
  FDRE \bitcount_reg[0] 
       (.C(clk125),
        .CE(sel),
        .D(plusOp[0]),
        .Q(bitcount_reg[0]),
        .R(clear));
  FDRE \bitcount_reg[1] 
       (.C(clk125),
        .CE(sel),
        .D(plusOp[1]),
        .Q(bitcount_reg[1]),
        .R(clear));
  FDRE \bitcount_reg[2] 
       (.C(clk125),
        .CE(sel),
        .D(plusOp[2]),
        .Q(bitcount_reg[2]),
        .R(clear));
  FDRE \bitcount_reg[3] 
       (.C(clk125),
        .CE(sel),
        .D(plusOp[3]),
        .Q(bitcount_reg[3]),
        .R(clear));
  FDRE \bitcount_reg[4] 
       (.C(clk125),
        .CE(sel),
        .D(plusOp[4]),
        .Q(bitcount_reg[4]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    clk12p5_reg
       (.C(clk125),
        .CE(1'b1),
        .D(make12p5MHz_n_0),
        .Q(mclk),
        .R(1'b0));
  FDRE latched_data_reg
       (.C(clk125),
        .CE(1'b1),
        .D(bclk_tim_n_1),
        .Q(latched_data),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    lrck_i_2
       (.I0(bitcount_reg[0]),
        .I1(bclk_i_reg_0),
        .I2(bitcount_reg[1]),
        .I3(bitcount_reg[2]),
        .I4(bitcount_reg[3]),
        .O(lrck_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    lrck_i_3
       (.I0(bitcount_reg[4]),
        .I1(bitcount_reg[0]),
        .I2(bitcount_reg[1]),
        .I3(bitcount_reg[2]),
        .I4(bitcount_reg[3]),
        .O(lrck_i_3_n_0));
  FDRE lrck_reg
       (.C(clk125),
        .CE(1'b1),
        .D(bclk_tim_n_2),
        .Q(lrck),
        .R(1'b0));
  lowlevel_dac_intfc_0_clkdivider make12p5MHz
       (.clk125(clk125),
        .\cnt_reg[0]_0 (make12p5MHz_n_0),
        .mclk(mclk),
        .resetn(resetn));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \shiftreg[0]_i_1 
       (.I0(data_word[0]),
        .I1(bitcount_reg[3]),
        .I2(bitcount_reg[2]),
        .I3(bitcount_reg[1]),
        .I4(bitcount_reg[4]),
        .I5(bitcount_reg[0]),
        .O(\shiftreg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[10]_i_1 
       (.I0(SHIFT_LEFT[10]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[10]),
        .O(\shiftreg[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[11]_i_1 
       (.I0(SHIFT_LEFT[11]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[11]),
        .O(\shiftreg[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[12]_i_1 
       (.I0(SHIFT_LEFT[12]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[12]),
        .O(\shiftreg[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[13]_i_1 
       (.I0(SHIFT_LEFT[13]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[13]),
        .O(\shiftreg[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[14]_i_1 
       (.I0(SHIFT_LEFT[14]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[14]),
        .O(\shiftreg[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[15]_i_1 
       (.I0(SHIFT_LEFT[15]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[15]),
        .O(\shiftreg[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[16]_i_1 
       (.I0(SHIFT_LEFT[16]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[16]),
        .O(\shiftreg[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[17]_i_1 
       (.I0(SHIFT_LEFT[17]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[17]),
        .O(\shiftreg[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[18]_i_1 
       (.I0(SHIFT_LEFT[18]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[18]),
        .O(\shiftreg[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[19]_i_1 
       (.I0(SHIFT_LEFT[19]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[19]),
        .O(\shiftreg[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[1]_i_1 
       (.I0(SHIFT_LEFT[1]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[1]),
        .O(\shiftreg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[20]_i_1 
       (.I0(SHIFT_LEFT[20]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[20]),
        .O(\shiftreg[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[21]_i_1 
       (.I0(SHIFT_LEFT[21]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[21]),
        .O(\shiftreg[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[22]_i_1 
       (.I0(SHIFT_LEFT[22]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[22]),
        .O(\shiftreg[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[23]_i_1 
       (.I0(SHIFT_LEFT[23]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[23]),
        .O(\shiftreg[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[24]_i_1 
       (.I0(SHIFT_LEFT[24]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[24]),
        .O(\shiftreg[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[25]_i_1 
       (.I0(SHIFT_LEFT[25]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[25]),
        .O(\shiftreg[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[26]_i_1 
       (.I0(SHIFT_LEFT[26]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[26]),
        .O(\shiftreg[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[27]_i_1 
       (.I0(SHIFT_LEFT[27]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[27]),
        .O(\shiftreg[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[28]_i_1 
       (.I0(SHIFT_LEFT[28]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[28]),
        .O(\shiftreg[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[29]_i_1 
       (.I0(SHIFT_LEFT[29]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[29]),
        .O(\shiftreg[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[2]_i_1 
       (.I0(SHIFT_LEFT[2]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[2]),
        .O(\shiftreg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[30]_i_1 
       (.I0(SHIFT_LEFT[30]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[30]),
        .O(\shiftreg[30]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \shiftreg[31]_i_1 
       (.I0(resetn),
        .O(clear));
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[31]_i_3 
       (.I0(SHIFT_LEFT[31]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[31]),
        .O(\shiftreg[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFD)) 
    \shiftreg[31]_i_5 
       (.I0(bitcount_reg[0]),
        .I1(bitcount_reg[4]),
        .I2(bitcount_reg[1]),
        .I3(bitcount_reg[2]),
        .I4(bitcount_reg[3]),
        .O(\shiftreg[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[3]_i_1 
       (.I0(SHIFT_LEFT[3]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[3]),
        .O(\shiftreg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[4]_i_1 
       (.I0(SHIFT_LEFT[4]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[4]),
        .O(\shiftreg[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[5]_i_1 
       (.I0(SHIFT_LEFT[5]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[5]),
        .O(\shiftreg[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[6]_i_1 
       (.I0(SHIFT_LEFT[6]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[6]),
        .O(\shiftreg[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[7]_i_1 
       (.I0(SHIFT_LEFT[7]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[7]),
        .O(\shiftreg[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[8]_i_1 
       (.I0(SHIFT_LEFT[8]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[8]),
        .O(\shiftreg[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \shiftreg[9]_i_1 
       (.I0(SHIFT_LEFT[9]),
        .I1(\shiftreg[31]_i_5_n_0 ),
        .I2(data_word[9]),
        .O(\shiftreg[9]_i_1_n_0 ));
  FDRE \shiftreg_reg[0] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[0]_i_1_n_0 ),
        .Q(SHIFT_LEFT[1]),
        .R(clear));
  FDRE \shiftreg_reg[10] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[10]_i_1_n_0 ),
        .Q(SHIFT_LEFT[11]),
        .R(clear));
  FDRE \shiftreg_reg[11] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[11]_i_1_n_0 ),
        .Q(SHIFT_LEFT[12]),
        .R(clear));
  FDRE \shiftreg_reg[12] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[12]_i_1_n_0 ),
        .Q(SHIFT_LEFT[13]),
        .R(clear));
  FDRE \shiftreg_reg[13] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[13]_i_1_n_0 ),
        .Q(SHIFT_LEFT[14]),
        .R(clear));
  FDRE \shiftreg_reg[14] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[14]_i_1_n_0 ),
        .Q(SHIFT_LEFT[15]),
        .R(clear));
  FDRE \shiftreg_reg[15] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[15]_i_1_n_0 ),
        .Q(SHIFT_LEFT[16]),
        .R(clear));
  FDRE \shiftreg_reg[16] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[16]_i_1_n_0 ),
        .Q(SHIFT_LEFT[17]),
        .R(clear));
  FDRE \shiftreg_reg[17] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[17]_i_1_n_0 ),
        .Q(SHIFT_LEFT[18]),
        .R(clear));
  FDRE \shiftreg_reg[18] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[18]_i_1_n_0 ),
        .Q(SHIFT_LEFT[19]),
        .R(clear));
  FDRE \shiftreg_reg[19] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[19]_i_1_n_0 ),
        .Q(SHIFT_LEFT[20]),
        .R(clear));
  FDRE \shiftreg_reg[1] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[1]_i_1_n_0 ),
        .Q(SHIFT_LEFT[2]),
        .R(clear));
  FDRE \shiftreg_reg[20] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[20]_i_1_n_0 ),
        .Q(SHIFT_LEFT[21]),
        .R(clear));
  FDRE \shiftreg_reg[21] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[21]_i_1_n_0 ),
        .Q(SHIFT_LEFT[22]),
        .R(clear));
  FDRE \shiftreg_reg[22] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[22]_i_1_n_0 ),
        .Q(SHIFT_LEFT[23]),
        .R(clear));
  FDRE \shiftreg_reg[23] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[23]_i_1_n_0 ),
        .Q(SHIFT_LEFT[24]),
        .R(clear));
  FDRE \shiftreg_reg[24] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[24]_i_1_n_0 ),
        .Q(SHIFT_LEFT[25]),
        .R(clear));
  FDRE \shiftreg_reg[25] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[25]_i_1_n_0 ),
        .Q(SHIFT_LEFT[26]),
        .R(clear));
  FDRE \shiftreg_reg[26] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[26]_i_1_n_0 ),
        .Q(SHIFT_LEFT[27]),
        .R(clear));
  FDRE \shiftreg_reg[27] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[27]_i_1_n_0 ),
        .Q(SHIFT_LEFT[28]),
        .R(clear));
  FDRE \shiftreg_reg[28] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[28]_i_1_n_0 ),
        .Q(SHIFT_LEFT[29]),
        .R(clear));
  FDRE \shiftreg_reg[29] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[29]_i_1_n_0 ),
        .Q(SHIFT_LEFT[30]),
        .R(clear));
  FDRE \shiftreg_reg[2] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[2]_i_1_n_0 ),
        .Q(SHIFT_LEFT[3]),
        .R(clear));
  FDRE \shiftreg_reg[30] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[30]_i_1_n_0 ),
        .Q(SHIFT_LEFT[31]),
        .R(clear));
  FDRE \shiftreg_reg[31] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[31]_i_3_n_0 ),
        .Q(sdata),
        .R(clear));
  FDRE \shiftreg_reg[3] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[3]_i_1_n_0 ),
        .Q(SHIFT_LEFT[4]),
        .R(clear));
  FDRE \shiftreg_reg[4] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[4]_i_1_n_0 ),
        .Q(SHIFT_LEFT[5]),
        .R(clear));
  FDRE \shiftreg_reg[5] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[5]_i_1_n_0 ),
        .Q(SHIFT_LEFT[6]),
        .R(clear));
  FDRE \shiftreg_reg[6] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[6]_i_1_n_0 ),
        .Q(SHIFT_LEFT[7]),
        .R(clear));
  FDRE \shiftreg_reg[7] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[7]_i_1_n_0 ),
        .Q(SHIFT_LEFT[8]),
        .R(clear));
  FDRE \shiftreg_reg[8] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[8]_i_1_n_0 ),
        .Q(SHIFT_LEFT[9]),
        .R(clear));
  FDRE \shiftreg_reg[9] 
       (.C(clk125),
        .CE(sel),
        .D(\shiftreg[9]_i_1_n_0 ),
        .Q(SHIFT_LEFT[10]),
        .R(clear));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
