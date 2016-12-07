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
// Program defined by 'C:\Users\Jacky\FPGA_Space_Invaders\software\software.psm'.
//
// Generated by KCPSM6 Assembler: 07 Dec 2016 - 04:01:21. 
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
    .INIT_00                   (256'hDF061F03DF0CDF0BDF0ADF09DF081F00900100D6002900272003800100160008),
    .INIT_01                   (256'hFF01FF001F001B0014001500130012001100100050002012DF019F04DF051F0F),
    .INIT_02                   (256'hD003204CD0022038D0012032D00050009D0F5000FF06FF05FF04FF03FF021FFF),
    .INIT_03                   (256'h450A15105000110120CDD13C603EDD105000110120D0D178603EDD10500020C9),
    .INIT_04                   (256'hDB004086DD08006C50001100100203F09F031FF402F01F080F501580150175FF),
    .INIT_05                   (256'h500000D3DFBEBF018060C064DF01BF010068DF000068DF87BF00500000534088),
    .INIT_06                   (256'hDD01BF00DD021F005000FF011F05BF015000FF009F01BF005000FF001F01BF00),
    .INIT_07                   (256'h150250001500D0009502500002F01F080F505000DB00007FDF01007BDFFF3F00),
    .INIT_08                   (256'h20892098D3E02090930190009E011E0850001B015000951015FFD0001F100F50),
    .INIT_09                   (256'hA0B1C2F01F181F52A0A9C2F01F181F1050001B0003F09F031FF402F01F080F50),
    .INIT_0A                   (256'hE090CF201F181F10E08FCF201F10208FA0C1C2F01F181FD7A0B9C2F01F181F95),
    .INIT_0B                   (256'hE090CF201F181F95E08FCF201F955000E090CF201F181F52E08FCF201F525000),
    .INIT_0C                   (256'h5000110010005000110120CDD13C5000E090CF201F181FD7E08FCF201FD75000),
    .INIT_0D                   (256'h500023C7D003213CD0022120D00120E3D00000E0500011001003500011001001),
    .INIT_0E                   (256'h192804041A70194804041A90194804041A90192804011A5019285000D108D009),
    .INIT_0F                   (256'h1A70195804041A70197804041A90197804041A90195804011A70195804041A70),
    .INIT_10                   (256'h04011AB019B804041A9019A804041A7019A804041A70198804011A9019880404),
    .INIT_11                   (256'h500004041A9019D804041A9019B804041A7019B804041A7019D804041AB019D8),
    .INIT_12                   (256'h19A804041A90195804041A70197804041A70195804041A90195804011A901978),
    .INIT_13                   (256'h092004010A300920500004041A9019A804041A90198804041A70198804011A70),
    .INIT_14                   (256'h095004041A0819101AF4095004041A081AF4095004011AF4095004041A050A30),
    .INIT_15                   (256'h9A141AE0191004049A141AE0191004011AE0191004041AF40950040419101AF4),
    .INIT_16                   (256'h190F9A141AE019100404190F9A0E1AE01910040419099A0E1AE0191004041909),
    .INIT_17                   (256'h04011AE0195204041AE01910040419181AE0191004049A1419181AE019100404),
    .INIT_18                   (256'h1AE01952040419099A0E1AE01952040419099A141AE0195204049A141AE01952),
    .INIT_19                   (256'h19181AE0195204049A1419181AE019520404190F9A141AE019520404190F9A0E),
    .INIT_1A                   (256'h040419099A141AE0199504049A141AE0199504011AE0199504041AE019520404),
    .INIT_1B                   (256'h19950404190F9A141AE019950404190F9A0E1AE01995040419099A0E1AE01995),
    .INIT_1C                   (256'h1AE019D704011AE019D704041AE01995040419181AE0199504049A1419181AE0),
    .INIT_1D                   (256'h190F9A0E1AE019D7040419099A0E1AE019D7040419099A141AE019D704049A14),
    .INIT_1E                   (256'h19D7040419181AE019D704049A1419181AE019D70404190F9A141AE019D70404),
    .INIT_1F                   (256'hBF0004049A020404990804041A020404190804010AF0BF0109F0BF0004041AE0),
    .INIT_20                   (256'h09F01F20BF0004049A020404990804041A020404190804010AF0BF0109F01F10),
    .INIT_21                   (256'h0AF0BF0109F01F30BF0004049A020404990804041A020404190804010AF0BF01),
    .INIT_22                   (256'h190804010AF0BF0109F01F40BF0004049A020404990804041A02040419080401),
    .INIT_23                   (256'h1A020404190804010AF0BF0109F01F50BF0004049A020404990804041A020404),
    .INIT_24                   (256'h990804041A020404190804010AF0BF0109F01F60BF0004049A02040499080404),
    .INIT_25                   (256'h9A020404990804041A020404190804010AF0BF0109F01F70BF0004049A020404),
    .INIT_26                   (256'hBF0004049A020404990804041A020404190804010AF01F08BF0109F0BF000404),
    .INIT_27                   (256'h1F20BF0004049A020404990804041A020404190804010AF01F08BF0109F01F10),
    .INIT_28                   (256'h09F01F30BF0004049A020404990804041A020404190804010AF01F08BF0109F0),
    .INIT_29                   (256'hBF0109F01F40BF0004049A020404990804041A020404190804010AF01F08BF01),
    .INIT_2A                   (256'h1F08BF0109F01F50BF0004049A020404990804041A020404190804010AF01F08),
    .INIT_2B                   (256'h0AF01F08BF0109F01F60BF0004049A020404990804041A020404190804010AF0),
    .INIT_2C                   (256'h04010AF01F08BF0109F01F70BF0004049A020404990804041A02040419080401),
    .INIT_2D                   (256'h0404190804010AF01F10BF0109F0BF0004049A020404990804041A0204041908),
    .INIT_2E                   (256'h1A020404190804010AF01F10BF0109F01F10BF0004049A020404990804041A02),
    .INIT_2F                   (256'h04041A020404190804010AF01F10BF0109F01F20BF0004049A02040499080404),
    .INIT_30                   (256'h990804041A020404190804010AF01F10BF0109F01F30BF0004049A0204049908),
    .INIT_31                   (256'h0404990804041A020404190804010AF01F10BF0109F01F40BF0004049A020404),
    .INIT_32                   (256'h9A020404990804041A020404190804010AF01F10BF0109F01F50BF0004049A02),
    .INIT_33                   (256'h04049A020404990804041A020404190804010AF01F10BF0109F01F60BF000404),
    .INIT_34                   (256'hBF0004049A020404990804041A020404190804010AF01F10BF0109F01F70BF00),
    .INIT_35                   (256'h09F01F10BF0004049A020404990804041A020404190804010AF01F18BF0109F0),
    .INIT_36                   (256'hBF0109F01F20BF0004049A020404990804041A020404190804010AF01F18BF01),
    .INIT_37                   (256'h1F18BF0109F01F30BF0004049A020404990804041A020404190804010AF01F18),
    .INIT_38                   (256'h0AF01F18BF0109F01F40BF0004049A020404990804041A020404190804010AF0),
    .INIT_39                   (256'h04010AF01F18BF0109F01F50BF0004049A020404990804041A02040419080401),
    .INIT_3A                   (256'h190804010AF01F18BF0109F01F60BF0004049A020404990804041A0204041908),
    .INIT_3B                   (256'h0404190804010AF01F18BF0109F01F70BF0004049A020404990804041A020404),
    .INIT_3C                   (256'h04041A90192804041A90194804011A501948500004049A020404990804041A02),
    .INIT_3D                   (256'h197804041A90197804041A90195804011A70195804041A70194804041A701928),
    .INIT_3E                   (256'h1A9019A804041A7019A804041A70198804011A90198804041A70195804041A70),
    .INIT_3F                   (256'h04041A9019B804041A7019D804041A7019B804041A9019B804011A9019D80404),
    .INIT_40                   (256'h0000000050000012DF041F01DA03DF019F03D902DF009F025000DA03D9025000),
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
    .INITP_00                  (256'h6361377510A4A4A4B4F0DD2B7280411449DC9DCB77762AA8A0000B488AA8AAAA),
    .INITP_01                  (256'h082082082082082AB77768208276D4D2D4D2D4D2D4D2D4D4D4D48104B7748934),
    .INITP_02                  (256'h8209094250942509424208242509082420A0820820820820A082082082082082),
    .INITP_03                  (256'h2666600824250942509425090820909425094250942420824250942509425090),
    .INITP_04                  (256'h4999984126666102666601266660126666012666601266660126666012666601),
    .INITP_05                  (256'h9984126666104999984099998412666610499998412666610499998412666610),
    .INITP_06                  (256'h4126666104999984126666102666610499998412666610499998412666610499),
    .INITP_07                  (256'h8208208208208208208208208208299998412666610499998412666610499998),
    .INITP_08                  (256'h000000000000000000000000000000000000000000000000000000000A8A28AA),
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
