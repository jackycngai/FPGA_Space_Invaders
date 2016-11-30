///////////////////////////////////////////////////////////////////////////////////////////
// Copyright � 2010-2013, Xilinx, Inc.
// This file contains confidential and proprietary information of Xilinx, Inc. and is
// protected under U.S. and international copyright and other intellectual property laws.
///////////////////////////////////////////////////////////////////////////////////////////
//
// Disclaimer:
// This disclaimer is not a license and does not grant any rights to the materials
// distributed herewith. Except as otherwise provided in a valid license issued to
// you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
// MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
// DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
// INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
// OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
// (whether in contract or tort, including negligence, or under any other theory
// of liability) for any loss or damage of any kind or nature related to, arising
// under or in connection with these materials, including for any direct, or any
// indirect, special, incidental, or consequential loss or damage (including loss
// of data, profits, goodwill, or any type of loss or damage suffered as a result
// of any action brought by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-safe, or for use in any
// application requiring fail-safe performance, such as life-support or safety
// devices or systems, Class III medical devices, nuclear facilities, applications
// related to the deployment of airbags, or any other applications that could lead
// to death, personal injury, or severe property or environmental damage
// (individually and collectively, "Critical Applications"). Customer assumes the
// sole risk and liability of any use of Xilinx products in Critical Applications,
// subject only to applicable laws and regulations governing limitations on product
// liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
//
///////////////////////////////////////////////////////////////////////////////////////////
//
// Production definition of a 2K program for KCPSM6 in a 7-Series device using a 
// RAMB36E1 primitive.
//
// Note: The complete 12-bit address bus is connected to KCPSM6 to facilitate future code 
//       expansion with minimum changes being required to the hardware description. 
//       Only the lower 11-bits of the address are actually used for the 2K address range
//       000 to 7FF hex.  
//
// Program defined by 'C:\Users\thile\Dropbox\School Work\EE 178\Labs\Lab 8\group2_lab8\software\software.psm'.
//
// Generated by KCPSM6 Assembler: 28 Nov 2016 - 22:34:40. 
//
///////////////////////////////////////////////////////////////////////////////////////////
 
`timescale 1 ns / 1 ps
 
module software (
  input  [11:0] address,
  output [17:0] instruction,
  input         bram_enable,
  input         clk
  );
 
  wire [15:0] address_a;
  wire [35:0] data_in_a;
  wire [35:0] data_out_a;
  wire [15:0] address_b;
  wire [35:0] data_in_b;
  wire [35:0] data_out_b;
  wire        enable_b;
  wire        clk_b;
  wire [7:0]  we_b;
  
  assign address_a = {1'b1, address[10:0], 4'b1111};
  assign instruction = {data_out_a[33:32],  data_out_a[15:0]};
  assign data_in_a = {35'b000000000000000000000000000000000000, address[11]};
  
  assign address_b = 16'b1111111111111111;
  assign data_in_b = {2'h0,  data_out_b[33:32], 16'h0000, data_out_b[15:0]};
  assign enable_b = 1'b0;
  assign we_b = 8'h00;
  assign clk_b = 1'b0;
 
  RAMB36E1 #(
    .READ_WIDTH_A              (18),
    .WRITE_WIDTH_A             (18),
    .DOA_REG                   (0),
    .INIT_A                    (36'h000000000),
    .RSTREG_PRIORITY_A         ("REGCE"),
    .SRVAL_A                   (36'h000000000),
    .WRITE_MODE_A              ("WRITE_FIRST"),
    .READ_WIDTH_B              (18),
    .WRITE_WIDTH_B             (18),
    .DOB_REG                   (0),
    .INIT_B                    (36'h000000000),
    .RSTREG_PRIORITY_B         ("REGCE"),
    .SRVAL_B                   (36'h000000000),
    .WRITE_MODE_B              ("WRITE_FIRST"),
    .INIT_FILE                 ("NONE"),
    .SIM_COLLISION_CHECK       ("ALL"),
    .RAM_MODE                  ("TDP"),
    .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
    .EN_ECC_READ               ("FALSE"),
    .EN_ECC_WRITE              ("FALSE"),
    .RAM_EXTENSION_A           ("NONE"),
    .RAM_EXTENSION_B           ("NONE"),
    .SIM_DEVICE                ("7SERIES"),
    .INIT_00                   (256'hDF061F03DF0CDF0BDF0ADF09DF081F00900100AB002A001E2003800100160008),
    .INIT_01                   (256'h9B0D9D0F5000150014001600130012001100100050002012DF019F04DF051F0F),
    .INIT_02                   (256'h203FD0022039D0012033D0005000EBC01000DD04DF0AAFC0DC0B500000239C0E),
    .INIT_03                   (256'h0049500011012086D13C608CDD10500011012089D178608CDD1050002082D003),
    .INIT_04                   (256'h0053DFFF3F00DD01BF00DD021F00500020A8F400D500005E50001101E044D11E),
    .INIT_05                   (256'h9E011E035000962016FFD0001F200F60160450001600D000960450000057DF01),
    .INIT_06                   (256'h15FFA070CF201F200F60A070CF601F080F206070C3F09F081FD0035002409000),
    .INIT_07                   (256'h15006081C3F09F081FFF14FF607BC2F09F081FFF15016076D30014016073D200),
    .INIT_08                   (256'h420A920711001002500011001001500011001000500011012086D13C205F1400),
    .INIT_09                   (256'h20A114FF20A0D48094071680160176FF460A1620137F430A430A9307127F420A),
    .INIT_0A                   (256'h20F5D00120B8D00000B55000110010035000150120A715FF20A6D58095071401),
    .INIT_0B                   (256'h1A90194801751A90192801721A5019285000D108D00950002138D0032111D002),
    .INIT_0C                   (256'h01751A90197801751A90195801721A70195801751A70192801751A7019480175),
    .INIT_0D                   (256'h19A801751A7019A801751A70198801721A90198801751A70195801751A701978),
    .INIT_0E                   (256'h1A9019B801751A7019B801751A7019D801751AB019D801721AB019B801751A90),
    .INIT_0F                   (256'h1A70197801751A70195801751A90195801721A901978500001751A9019D80175),
    .INIT_10                   (256'h01751A9019A801751A90198801751A70198801721A7019A801751A9019580175),
    .INIT_11                   (256'h19080A30092001751A0819080A30092001751A080A30092001720A3009205000),
    .INIT_12                   (256'h01751A0819201AD0096001751A081AD0096001721AD0096001750A3009200175),
    .INIT_13                   (256'h1A90192801751A90194801721A501948500001751AD00960017519201AD00960),
    .INIT_14                   (256'h01751A90197801751A90195801721A70195801751A70194801751A7019280175),
    .INIT_15                   (256'h19A801751A7019A801751A70198801721A90198801751A70195801751A701978),
    .INIT_16                   (256'h1A9019B801751A7019D801751A7019B801751A9019B801721A9019D801751A90),
    .INIT_17                   (256'h000050000012DF041F01DA03DF019F03D902DF009F025000DA03D90250000175),
    .INIT_18                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F                   (256'h2004000000000000000000000000000000000000000000000000000000000000),
    .INITP_00                  (256'h350D434D353535174934636DD442D69DA772772DDDDAC8A808000B488AA8AAAA),
    .INITP_01                  (256'h082082820820820820820820820820820820AADDDDA088C08C144545408209D8),
    .INITP_02                  (256'h2A28A2AA0820820820820820820820820820A090942420824250908282082082),
    .INITP_03                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E                  (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F                  (256'h8000000000000000000000000000000000000000000000000000000000000000))
  rom_2048x18 (
    .ADDRARDADDR               (address_a),
    .ENARDEN                   (bram_enable),
    .CLKARDCLK                 (clk),
    .DOADO                     (data_out_a[31:0]),
    .DOPADOP                   (data_out_a[35:32]), 
    .DIADI                     (data_in_a[31:0]),
    .DIPADIP                   (data_in_a[35:32]), 
    .WEA                       (4'h0),
    .REGCEAREGCE               (1'b0),
    .RSTRAMARSTRAM             (1'b0),
    .RSTREGARSTREG             (1'b0),
    .ADDRBWRADDR               (address_b),
    .ENBWREN                   (enable_b),
    .CLKBWRCLK                 (clk_b),
    .DOBDO                     (data_out_b[31:0]),
    .DOPBDOP                   (data_out_b[35:32]), 
    .DIBDI                     (data_in_b[31:0]),
    .DIPBDIP                   (data_in_b[35:32]), 
    .WEBWE                     (we_b),
    .REGCEB                    (1'b0),
    .RSTRAMB                   (1'b0),
    .RSTREGB                   (1'b0),
    .CASCADEINA                (1'b0),
    .CASCADEINB                (1'b0),
    .CASCADEOUTA               (),
    .CASCADEOUTB               (),
    .DBITERR                   (),
    .ECCPARITY                 (),
    .RDADDRECC                 (),
    .SBITERR                   (),
    .INJECTDBITERR             (1'b0),
    .INJECTSBITERR             (1'b0));
 
endmodule