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
// Generated by KCPSM6 Assembler: 13 Dec 2016 - 22:05:14. 
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
    .INIT_00                   (256'hDF061F03DF0CDF0BDF0ADF09DF081F00900103EE002A00282003800100160008),
    .INIT_01                   (256'hFF001F0016001B0014001500130012001100100050002012DF019F04DF051F0F),
    .INIT_02                   (256'h2057D0022039D0012033D00050009D0F5000FF06FF05FF04FF03FF021FFFFF01),
    .INIT_03                   (256'h15105000110123E5D13C603FDD105000110123E8D178603FDD10500023E1D003),
    .INIT_04                   (256'hFF01FF001F0016001100100203F09F031FF402F01F080F501580150175FF450A),
    .INIT_05                   (256'h8062D10143B2D6FF412CDB00412ADD0801105000FF06FF05FF04FF03FF021FFF),
    .INIT_06                   (256'h00F1FF01BF06FF01BF05FF01BF04FF01BF03DF01BF02010CDF00BF0050001101),
    .INIT_07                   (256'hBF04FFFCBF03DFFCBF0220EDFFFEBF06FFFEBF05FFFEBF04FFFEBF03DFFEBF02),
    .INIT_08                   (256'hFFF8BF06FFF8BF05FFF8BF04FFF8BF03DFF8BF0220E9FFFCBF06FFFCBF05FFFC),
    .INIT_09                   (256'hFFE0BF03DFE0BF0220E1FFF0BF06FFF0BF05FFF0BF04FFF0BF03DFF0BF0220E5),
    .INIT_0A                   (256'hBF06FFC0BF05FFC0BF04FFC0BF03DFC0BF0220DDFFE0BF06FFE0BF05FFE0BF04),
    .INIT_0B                   (256'hDF01BF0120D120D5FF80BF06FF80BF05FF80BF04FF80BF03DF80BF0220D9FFC0),
    .INIT_0C                   (256'h23EBFF00BF06FF00BF05FF00BF04FF00BF03DF00BF02E3EBDFBEBF018104C108),
    .INIT_0D                   (256'h010CDFB7BF0020BE010CDFA7BF0020BE010CDF97BF0020BE010CDF87BF005000),
    .INIT_0E                   (256'h010CDFF7BF0020BE010CDFE7BF0020BE010CDFD7BF0020BE010CDFC7BF0020BE),
    .INIT_0F                   (256'hFF064F0EBF06FF054F0EBF05FF044F0EBF04FF034F0EBF03FF024F0EBF0220BE),
    .INIT_10                   (256'h5000FF011F05BF015000FF009F01BF005000FF001F01BF005000FF001F10BF00),
    .INIT_11                   (256'h9502500002F01F080F505000DB000123DF01011FDFFF3F00DD01BF00DD021F00),
    .INIT_12                   (256'h930190009E011E0850001B015000951015FFD0001F100F50150250001500D000),
    .INIT_13                   (256'hC3F01F08BF012221C3F01F10BF0121B9C3F01F18BF012151C3F01F20BF012149),
    .INIT_14                   (256'h1B0003F09F031FF402F01F080F50212D2359D3D02148D6FF22F1C3F0BF012289),
    .INIT_15                   (256'h1F20BF00E18FCF201F08E148CF201F10BF00E189CF201F08E148CF20BF005000),
    .INIT_16                   (256'hE148CF201F40BF00E19BCF201F08E148CF201F30BF00E195CF201F08E148CF20),
    .INIT_17                   (256'hCF201F08E148CF201F60BF00E1A7CF201F08E148CF201F50BF00E1A1CF201F08),
    .INIT_18                   (256'hBF062149FF067F01E148DF01BF062148E1B3CF201F08E148CF201F70BF00E1AD),
    .INIT_19                   (256'hFF067F08E148DF08BF062149FF067F04E148DF04BF062149FF067F02E148DF02),
    .INIT_1A                   (256'hE148DF40BF062149FF067F20E148DF20BF062149FF067F10E148DF10BF062149),
    .INIT_1B                   (256'hBF00E1F1CF201F08E148CF20BF002149FF067F80E148DF80BF062149FF067F40),
    .INIT_1C                   (256'hCF201F30BF00E1FDCF201F08E148CF201F20BF00E1F7CF201F08E148CF201F10),
    .INIT_1D                   (256'h1F08E148CF201F50BF00E209CF201F08E148CF201F40BF00E203CF201F08E148),
    .INIT_1E                   (256'hE21BCF201F08E148CF201F70BF00E215CF201F08E148CF201F60BF00E20FCF20),
    .INIT_1F                   (256'hE148DF04BF052149FF057F02E148DF02BF052149FF057F01E148DF01BF052148),
    .INIT_20                   (256'hBF052149FF057F10E148DF10BF052149FF057F08E148DF08BF052149FF057F04),
    .INIT_21                   (256'hFF057F80E148DF80BF052149FF057F40E148DF40BF052149FF057F20E148DF20),
    .INIT_22                   (256'h1F20BF00E25FCF201F08E148CF201F10BF00E259CF201F08E148CF20BF002149),
    .INIT_23                   (256'hE148CF201F40BF00E26BCF201F08E148CF201F30BF00E265CF201F08E148CF20),
    .INIT_24                   (256'hCF201F08E148CF201F60BF00E277CF201F08E148CF201F50BF00E271CF201F08),
    .INIT_25                   (256'hBF042149FF047F01E148DF01BF042148E283CF201F08E148CF201F70BF00E27D),
    .INIT_26                   (256'hFF047F08E148DF08BF042149FF047F04E148DF04BF042149FF047F02E148DF02),
    .INIT_27                   (256'hE148DF40BF042149FF047F20E148DF20BF042149FF047F10E148DF10BF042149),
    .INIT_28                   (256'hBF00E2C1CF201F08E148CF20BF002149FF047F80E148DF80BF042149FF047F40),
    .INIT_29                   (256'hCF201F30BF00E2CDCF201F08E148CF201F20BF00E2C7CF201F08E148CF201F10),
    .INIT_2A                   (256'h1F08E148CF201F50BF00E2D9CF201F08E148CF201F40BF00E2D3CF201F08E148),
    .INIT_2B                   (256'hE2EBCF201F08E148CF201F70BF00E2E5CF201F08E148CF201F60BF00E2DFCF20),
    .INIT_2C                   (256'hE148DF04BF032149FF037F02E148DF02BF032149FF037F01E148DF01BF032148),
    .INIT_2D                   (256'hBF032149FF037F10E148DF10BF032149FF037F08E148DF08BF032149FF037F04),
    .INIT_2E                   (256'hFF037F80E148DF80BF032149FF037F40E148DF40BF032149FF037F20E148DF20),
    .INIT_2F                   (256'h1F20BF00E32FCF201F08E148CF201F10BF00E329CF201F08E148CF20BF002149),
    .INIT_30                   (256'hE148CF201F40BF00E33BCF201F08E148CF201F30BF00E335CF201F08E148CF20),
    .INIT_31                   (256'hCF201F08E148CF201F60BF00E347CF201F08E148CF201F50BF00E341CF201F08),
    .INIT_32                   (256'hBF022149FF027F01E148DF01BF022148E353CF201F08E148CF201F70BF00E34D),
    .INIT_33                   (256'hFF027F08E148DF08BF022149FF027F04E148DF04BF022149FF027F02E148DF02),
    .INIT_34                   (256'hE148DF40BF022149FF027F20E148DF20BF022149FF027F10E148DF10BF022149),
    .INIT_35                   (256'hC2F01F181F52A36AC2F01F181F102149FF027F80E148DF80BF022149FF027F40),
    .INIT_36                   (256'hCF201F1021487FFF5F3F0F602148A38BC2F01F181FD7A380C2F01F181F95A375),
    .INIT_37                   (256'hE39DCF201F181F52E148CF201F5221487FFF5FCF0F60E396CF201F181F10E148),
    .INIT_38                   (256'h1FD721487FFF5FFC0F60E3A4CF201F181F95E148CF201F9521487FFF5FF30F60),
    .INIT_39                   (256'h7FFF5FCF0F60214906F01F4021497FFF5F3F0F60E3ABCF201F181FD7E148CF20),
    .INIT_3A                   (256'h1F0121497FFF5FFC0F60214906F01F0421497FFF5FF30F60214906F01F102149),
    .INIT_3B                   (256'h5FFC0F6043C97FFF5FF30F6043C67FFF5FCF0F6043C37FFF5F3F0F60214906F0),
    .INIT_3C                   (256'h075723CF1AD019D723CF1AD0199523CF1AD0195223CF1AD01910500043CC7FFF),
    .INIT_3D                   (256'h075A9909075A1A06075A9906075A9A06075A9909075A1A14075A1918075A9A14),
    .INIT_3E                   (256'hD00003F85000110010035000110010015000110010005000110123E5D13C5000),
    .INIT_3F                   (256'h075A194E07571A70193A5000D108D0095000271DD0032575D0022480D00123FB),
    .INIT_40                   (256'h075A194A075A1A8C075A193A075A1A90075A194E075A1A7E075A193E075A1A74),
    .INIT_41                   (256'h1A90075A195C075A1A80075A196C07571A701958075A1A70075A193A075A1A82),
    .INIT_42                   (256'h075A1A74075A195C075A1A7C075A196907571A74195C075A1A70075A1958075A),
    .INIT_43                   (256'h197A075A197C075A1A831984075A1986075A1A90198A075A198207571A70197D),
    .INIT_44                   (256'h197D075A1A7D1982075A1A73197F07571A7D075A1A70197D075A1976075A1A90),
    .INIT_45                   (256'h075A1A90075A19A8075A1A8C075A1998075A1A74075A19A807571A701994075A),
    .INIT_46                   (256'h19C4075A1A7E075A19B6075A1A74075A19C607571A7019B2075A1A70075A1994),
    .INIT_47                   (256'h5000075A1A70075A19B2075A1A90075A19C6075A1A8C075A19B6075A1A82075A),
    .INIT_48                   (256'h190D075A1A90075A1921075A1A8C075A1919075A1A74075A192107571A70190D),
    .INIT_49                   (256'h075A193007571A70192B075A1A70075A190D075A1A74075A1915075A1A8C075A),
    .INIT_4A                   (256'h075A1A90075A1A74192F075A193A075A1A90075A193F075A1A70075A1A8C193B),
    .INIT_4B                   (256'h195D075A1A701959075A1A8C1953075A194D07571A701949075A1A70075A192B),
    .INIT_4C                   (256'h1A90197B075A197307571A70196E075A1A701949075A1951075A1A901955075A),
    .INIT_4D                   (256'h075A1A70196E075A1967075A1A90196B075A196D075A1A831974075A1977075A),
    .INIT_4E                   (256'h075A198D07571A701985075A1A7D196E075A1A7D1973075A1A73197107571A7D),
    .INIT_4F                   (256'h075A1A90198D075A1A8C1991075A1A82075A1A7F075A1A7C1999075A1A741991),
    .INIT_50                   (256'h1A801995075A1A7C1995075A198D07571A741989075A1A701985075A1A901985),
    .INIT_51                   (256'h19B607571A7019A2075A1A741989075A1989075A1A8C198D075A1A841995075A),
    .INIT_52                   (256'h19B6075A1A8C075A19A6075A1A82075A19B4075A1A7E075A19A6075A1A74075A),
    .INIT_53                   (256'h075A19CA075A1A80075A19D407571A7019C0075A1A70075A19A2075A1A90075A),
    .INIT_54                   (256'h1A7419C4075A1A70075A19C0075A1A90075A1A8019C4075A19D0075A1A9019D4),
    .INIT_55                   (256'h075A1A74075A19F207571A7019DE075A1A74075A19C4075A1A7C075A19D00757),
    .INIT_56                   (256'h075A1A82075A19EE075A1A8C075A19DE075A1A90075A19F2075A1A7E075A19E2),
    .INIT_57                   (256'h095007571AF40950075A1A050A30092007570A3009205000075A1A70075A19DE),
    .INIT_58                   (256'hBF02075A1AF40950075A19101AF40950075A1A0819101AF40950075A1A081AF4),
    .INIT_59                   (256'h07130AF0BF0109F01F10BF00E5A0DF02BF0207130AF0BF0109F0BF00E597DF01),
    .INIT_5A                   (256'hBF0109F01F30BF00E5B2DF08BF0207130AF0BF0109F01F20BF00E5A9DF04BF02),
    .INIT_5B                   (256'h1F50BF00E5C4DF20BF0207130AF0BF0109F01F40BF00E5BBDF10BF0207130AF0),
    .INIT_5C                   (256'hE5D6DF80BF0207130AF0BF0109F01F60BF00E5CDDF40BF0207130AF0BF0109F0),
    .INIT_5D                   (256'hBF0307130AF01F08BF0109F0BF00E5DFDF01BF0307130AF0BF0109F01F70BF00),
    .INIT_5E                   (256'hBF0109F01F20BF00E5F3DF04BF0307130AF01F08BF0109F01F10BF00E5E9DF02),
    .INIT_5F                   (256'hE607DF10BF0307130AF01F08BF0109F01F30BF00E5FDDF08BF0307130AF01F08),
    .INIT_60                   (256'h0AF01F08BF0109F01F50BF00E611DF20BF0307130AF01F08BF0109F01F40BF00),
    .INIT_61                   (256'h1F70BF00E625DF80BF0307130AF01F08BF0109F01F60BF00E61BDF40BF030713),
    .INIT_62                   (256'hDF02BF0407130AF01F10BF0109F0BF00E62EDF01BF0407130AF01F08BF0109F0),
    .INIT_63                   (256'h1F10BF0109F01F20BF00E642DF04BF0407130AF01F10BF0109F01F10BF00E638),
    .INIT_64                   (256'hBF00E656DF10BF0407130AF01F10BF0109F01F30BF00E64CDF08BF0407130AF0),
    .INIT_65                   (256'h07130AF01F10BF0109F01F50BF00E660DF20BF0407130AF01F10BF0109F01F40),
    .INIT_66                   (256'h09F01F70BF00E674DF80BF0407130AF01F10BF0109F01F60BF00E66ADF40BF04),
    .INIT_67                   (256'hE687DF02BF0507130AF01F18BF0109F0BF00E67DDF01BF0507130AF01F10BF01),
    .INIT_68                   (256'h0AF01F18BF0109F01F20BF00E691DF04BF0507130AF01F18BF0109F01F10BF00),
    .INIT_69                   (256'h1F40BF00E6A5DF10BF0507130AF01F18BF0109F01F30BF00E69BDF08BF050713),
    .INIT_6A                   (256'hBF0507130AF01F18BF0109F01F50BF00E6AFDF20BF0507130AF01F18BF0109F0),
    .INIT_6B                   (256'hBF0109F01F70BF00E6C3DF80BF0507130AF01F18BF0109F01F60BF00E6B9DF40),
    .INIT_6C                   (256'hBF00E6D6DF02BF0607130AF01F20BF0109F0BF00E6CCDF01BF0607130AF01F18),
    .INIT_6D                   (256'h07130AF01F20BF0109F01F20BF00E6E0DF04BF0607130AF01F20BF0109F01F10),
    .INIT_6E                   (256'h09F01F40BF00E6F4DF10BF0607130AF01F20BF0109F01F30BF00E6EADF08BF06),
    .INIT_6F                   (256'hDF40BF0607130AF01F20BF0109F01F50BF00E6FEDF20BF0607130AF01F20BF01),
    .INIT_70                   (256'h1F20BF0109F01F70BF00D000DF80BF0607130AF01F20BF0109F01F60BF00E708),
    .INIT_71                   (256'h07571A5019485000075A9A02075A9908075A1A02075A19080757500007130AF0),
    .INIT_72                   (256'h195807571A701958075A1A701948075A1A701928075A1A901928075A1A901948),
    .INIT_73                   (256'h1A70198807571A901988075A1A701958075A1A701978075A1A901978075A1A90),
    .INIT_74                   (256'h075A1A7019B8075A1A9019B807571A9019D8075A1A9019A8075A1A7019A8075A),
    .INIT_75                   (256'hDA03DF019F03D902DF009F025000DA03D9025000075A1A9019B8075A1A7019D8),
    .INIT_76                   (256'h00000000000000000000000000000000000000000000000050000012DF041F01),
    .INIT_77                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E                   (256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F                   (256'h2004000000000000000000000000000000000000000000000000000000000000),
    .INITP_00                  (256'h00300000C0000349CDDCAAA8A00104512772772DDDD8AAA280000B488AA8AAAA),
    .INITP_01                  (256'h92492492D2D2D2D2D2D2D2D2D111134F0B00000C0000300000C0000300000C00),
    .INITP_02                  (256'h5D4D7535D4D7535D4D7535D20412DDD3535353537489346361377510A4A4A4A4),
    .INITP_03                  (256'hC28C28C2D7535D4D7535D4D7535D4D7535D28C28C28C28C28C28C28C28C2D753),
    .INITP_04                  (256'hC28C28C28C28C28C28C2D7535D4D7535D4D7535D4D7535D28C28C28C28C28C28),
    .INITP_05                  (256'h4D7535D28C28C28C28C28C28C28C28C2D7535D4D7535D4D7535D4D7535D28C28),
    .INITP_06                  (256'hD4D303534C0B535353528C28C28C28C28C28C28C28C2D7535D4D7535D4D7535D),
    .INITP_07                  (256'h882AB7776820827699999999A082082C0C0C0C093024C093024C0D4D303534C0),
    .INITP_08                  (256'hA222222222222088888888822082208822088220888882222222088888888888),
    .INITP_09                  (256'h8208882088208208822088220882088220822088882222208822222222222220),
    .INITP_0A                  (256'h2090828888888888888222220888822088882222222222222082208208220820),
    .INITP_0B                  (256'hC2104C2104C2104C21030804C20130804C20130804C20130804C200C20909424),
    .INITP_0C                  (256'hC2103084130841308413084130841308413084130840C2104C2104C2104C2104),
    .INITP_0D                  (256'h08413084130841308413084130840C2104C2104C2104C2104C2104C2104C2104),
    .INITP_0E                  (256'h00000000000000A8A28AA820820820820820820820820820829999A841308413),
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
