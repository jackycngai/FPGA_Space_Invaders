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
// Generated by KCPSM6 Assembler: 13 Dec 2016 - 21:18:23. 
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
    .INIT_00                   (256'hDF061F03DF0CDF0BDF0ADF09DF081F00900103EA002A00282003800100160008),
    .INIT_01                   (256'hFF001F0016001B0014001500130012001100100050002012DF019F04DF051F0F),
    .INIT_02                   (256'h2057D0022039D0012033D00050009D0F5000FF06FF05FF04FF03FF021FFFFF01),
    .INIT_03                   (256'h15105000110123E1D13C603FDD105000110123E4D178603FDD10500023DDD003),
    .INIT_04                   (256'hFF01FF001F0016001100100203F09F031FF402F01F080F501580150175FF450A),
    .INIT_05                   (256'h1101006143AED6FF4128DB004126DD08010C5000FF06FF05FF04FF03FF021FFF),
    .INIT_06                   (256'hBF0200F0FF01BF06FF01BF05FF01BF04FF01BF03DF01BF020108DF00BF005000),
    .INIT_07                   (256'hFFFCBF04FFFCBF03DFFCBF0220ECFFFEBF06FFFEBF05FFFEBF04FFFEBF03DFFE),
    .INIT_08                   (256'h20E4FFF8BF06FFF8BF05FFF8BF04FFF8BF03DFF8BF0220E8FFFCBF06FFFCBF05),
    .INIT_09                   (256'hBF04FFE0BF03DFE0BF0220E0FFF0BF06FFF0BF05FFF0BF04FFF0BF03DFF0BF02),
    .INIT_0A                   (256'hFFC0BF06FFC0BF05FFC0BF04FFC0BF03DFC0BF0220DCFFE0BF06FFE0BF05FFE0),
    .INIT_0B                   (256'hC104DF01BF0120D020D4FF80BF06FF80BF05FF80BF04FF80BF03DF80BF0220D8),
    .INIT_0C                   (256'h500023E7FF00BF06FF00BF05FF00BF04FF00BF03DF00BF02E3E7DFBEBF018100),
    .INIT_0D                   (256'h20BD0108DFB7BF0020BD0108DFA7BF0020BD0108DF97BF0020BD0108DF87BF00),
    .INIT_0E                   (256'h20BD0108DFF7BF0020BD0108DFE7BF0020BD0108DFD7BF0020BD0108DFC7BF00),
    .INIT_0F                   (256'h5000FF064F0EBF06FF054F0EBF05FF044F0EBF04FF034F0EBF03FF024F0EBF02),
    .INIT_10                   (256'hDD01BF00DD021F005000FF011F05BF015000FF009F01BF005000FF001F01BF00),
    .INIT_11                   (256'h150250001500D0009502500002F01F080F505000DB00011FDF01011BDFFF3F00),
    .INIT_12                   (256'hD3D02144D6FF2145930190009E011E0850001B015000951015FFD0001F100F50),
    .INIT_13                   (256'hC3F01F08BF01221DC3F01F10BF0121B5C3F01F18BF01214DC3F01F20BF012355),
    .INIT_14                   (256'hE144CF20BF0050001B0003F09F031FF402F01F080F50212922EDC3F0BF012285),
    .INIT_15                   (256'hCF201F08E144CF201F20BF00E18BCF201F08E144CF201F10BF00E185CF201F08),
    .INIT_16                   (256'hBF00E19DCF201F08E144CF201F40BF00E197CF201F08E144CF201F30BF00E191),
    .INIT_17                   (256'hCF201F70BF00E1A9CF201F08E144CF201F60BF00E1A3CF201F08E144CF201F50),
    .INIT_18                   (256'hFF067F02E144DF02BF062145FF067F01E144DF01BF062144E1AFCF201F08E144),
    .INIT_19                   (256'hE144DF10BF062145FF067F08E144DF08BF062145FF067F04E144DF04BF062145),
    .INIT_1A                   (256'hBF062145FF067F40E144DF40BF062145FF067F20E144DF20BF062145FF067F10),
    .INIT_1B                   (256'h1F08E144CF201F10BF00E1EDCF201F08E144CF20BF002145FF067F80E144DF80),
    .INIT_1C                   (256'hE1FFCF201F08E144CF201F30BF00E1F9CF201F08E144CF201F20BF00E1F3CF20),
    .INIT_1D                   (256'h1F60BF00E20BCF201F08E144CF201F50BF00E205CF201F08E144CF201F40BF00),
    .INIT_1E                   (256'hE144DF01BF052144E217CF201F08E144CF201F70BF00E211CF201F08E144CF20),
    .INIT_1F                   (256'hBF052145FF057F04E144DF04BF052145FF057F02E144DF02BF052145FF057F01),
    .INIT_20                   (256'hFF057F20E144DF20BF052145FF057F10E144DF10BF052145FF057F08E144DF08),
    .INIT_21                   (256'hE144CF20BF002145FF057F80E144DF80BF052145FF057F40E144DF40BF052145),
    .INIT_22                   (256'hCF201F08E144CF201F20BF00E25BCF201F08E144CF201F10BF00E255CF201F08),
    .INIT_23                   (256'hBF00E26DCF201F08E144CF201F40BF00E267CF201F08E144CF201F30BF00E261),
    .INIT_24                   (256'hCF201F70BF00E279CF201F08E144CF201F60BF00E273CF201F08E144CF201F50),
    .INIT_25                   (256'hFF047F02E144DF02BF042145FF047F01E144DF01BF042144E27FCF201F08E144),
    .INIT_26                   (256'hE144DF10BF042145FF047F08E144DF08BF042145FF047F04E144DF04BF042145),
    .INIT_27                   (256'hBF042145FF047F40E144DF40BF042145FF047F20E144DF20BF042145FF047F10),
    .INIT_28                   (256'h1F08E144CF201F10BF00E2BDCF201F08E144CF20BF002145FF047F80E144DF80),
    .INIT_29                   (256'hE2CFCF201F08E144CF201F30BF00E2C9CF201F08E144CF201F20BF00E2C3CF20),
    .INIT_2A                   (256'h1F60BF00E2DBCF201F08E144CF201F50BF00E2D5CF201F08E144CF201F40BF00),
    .INIT_2B                   (256'hE144DF01BF032144E2E7CF201F08E144CF201F70BF00E2E1CF201F08E144CF20),
    .INIT_2C                   (256'hBF032145FF037F04E144DF04BF032145FF037F02E144DF02BF032145FF037F01),
    .INIT_2D                   (256'hFF037F20E144DF20BF032145FF037F10E144DF10BF032145FF037F08E144DF08),
    .INIT_2E                   (256'hE144CF20BF002145FF037F80E144DF80BF032145FF037F40E144DF40BF032145),
    .INIT_2F                   (256'hCF201F08E144CF201F20BF00E32BCF201F08E144CF201F10BF00E325CF201F08),
    .INIT_30                   (256'hBF00E33DCF201F08E144CF201F40BF00E337CF201F08E144CF201F30BF00E331),
    .INIT_31                   (256'hCF201F70BF00E349CF201F08E144CF201F60BF00E343CF201F08E144CF201F50),
    .INIT_32                   (256'hFF027F02E144DF02BF022145FF027F01E144DF01BF022144E34FCF201F08E144),
    .INIT_33                   (256'hE144DF10BF022145FF027F08E144DF08BF022145FF027F04E144DF04BF022145),
    .INIT_34                   (256'hBF022145FF027F40E144DF40BF022145FF027F20E144DF20BF022145FF027F10),
    .INIT_35                   (256'hC2F01F181F95A371C2F01F181F52A366C2F01F181F102145FF027F80E144DF80),
    .INIT_36                   (256'hCF201F181F10E144CF201F1021447FFF5F3F0F602144A387C2F01F181FD7A37C),
    .INIT_37                   (256'h21447FFF5FF30F60E399CF201F181F52E144CF201F5221447FFF5FCF0F60E392),
    .INIT_38                   (256'h1F181FD7E144CF201FD721447FFF5FFC0F60E3A0CF201F181F95E144CF201F95),
    .INIT_39                   (256'h214506F01F1021457FFF5FCF0F60214506F01F4021457FFF5F3F0F60E3A7CF20),
    .INIT_3A                   (256'h5F3F0F60214506F01F0121457FFF5FFC0F60214506F01F0421457FFF5FF30F60),
    .INIT_3B                   (256'h1910500043C87FFF5FFC0F6043C57FFF5FF30F6043C27FFF5FCF0F6043BF7FFF),
    .INIT_3C                   (256'h0756191807569A14075323CB1AD019D723CB1AD0199523CB1AD0195223CB1AD0),
    .INIT_3D                   (256'h110123E1D13C50000756990907561A060756990607569A060756990907561A14),
    .INIT_3E                   (256'hD002247CD00123F7D00003F45000110010035000110010015000110010005000),
    .INIT_3F                   (256'h0756193E07561A740756194E07531A70193A5000D108D00950002719D0032571),
    .INIT_40                   (256'h0756193A07561A820756194A07561A8C0756193A07561A900756194E07561A7E),
    .INIT_41                   (256'h1A700756195807561A900756195C07561A800756196C07531A70195807561A70),
    .INIT_42                   (256'h198207531A70197D07561A740756195C07561A7C0756196907531A74195C0756),
    .INIT_43                   (256'h0756197607561A90197A0756197C07561A8319840756198607561A90198A0756),
    .INIT_44                   (256'h07531A7019940756197D07561A7D198207561A73197F07531A7D07561A70197D),
    .INIT_45                   (256'h07561A700756199407561A90075619A807561A8C0756199807561A74075619A8),
    .INIT_46                   (256'h19B607561A82075619C407561A7E075619B607561A74075619C607531A7019B2),
    .INIT_47                   (256'h192107531A70190D500007561A70075619B207561A90075619C607561A8C0756),
    .INIT_48                   (256'h191507561A8C0756190D07561A900756192107561A8C0756191907561A740756),
    .INIT_49                   (256'h1A7007561A8C193B0756193007531A70192B07561A700756190D07561A740756),
    .INIT_4A                   (256'h07561A700756192B07561A9007561A74192F0756193A07561A900756193F0756),
    .INIT_4B                   (256'h07561A9019550756195D07561A70195907561A8C19530756194D07531A701949),
    .INIT_4C                   (256'h19740756197707561A90197B0756197307531A70196E07561A70194907561951),
    .INIT_4D                   (256'h1A73197107531A7D07561A70196E0756196707561A90196B0756196D07561A83),
    .INIT_4E                   (256'h199907561A7419910756198D07531A70198507561A7D196E07561A7D19730756),
    .INIT_4F                   (256'h198507561A90198507561A90198D07561A8C199107561A8207561A7F07561A7C),
    .INIT_50                   (256'h07561A84199507561A80199507561A7C19950756198D07531A74198907561A70),
    .INIT_51                   (256'h19A607561A74075619B607531A7019A207561A7419890756198907561A8C198D),
    .INIT_52                   (256'h19A207561A90075619B607561A8C075619A607561A82075619B407561A7E0756),
    .INIT_53                   (256'h19D007561A9019D4075619CA07561A80075619D407531A7019C007561A700756),
    .INIT_54                   (256'h1A7C075619D007531A7419C407561A70075619C007561A9007561A8019C40756),
    .INIT_55                   (256'h07561A7E075619E207561A74075619F207531A7019DE07561A74075619C40756),
    .INIT_56                   (256'h07561A70075619DE07561A82075619EE07561A8C075619DE07561A90075619F2),
    .INIT_57                   (256'h095007561A081AF4095007531AF4095007561A050A30092007530A3009205000),
    .INIT_58                   (256'h09F0BF00E593DF01BF0207561AF40950075619101AF4095007561A0819101AF4),
    .INIT_59                   (256'hBF00E5A5DF04BF02070F0AF0BF0109F01F10BF00E59CDF02BF02070F0AF0BF01),
    .INIT_5A                   (256'hDF10BF02070F0AF0BF0109F01F30BF00E5AEDF08BF02070F0AF0BF0109F01F20),
    .INIT_5B                   (256'h070F0AF0BF0109F01F50BF00E5C0DF20BF02070F0AF0BF0109F01F40BF00E5B7),
    .INIT_5C                   (256'hBF0109F01F70BF00E5D2DF80BF02070F0AF0BF0109F01F60BF00E5C9DF40BF02),
    .INIT_5D                   (256'h1F10BF00E5E5DF02BF03070F0AF01F08BF0109F0BF00E5DBDF01BF03070F0AF0),
    .INIT_5E                   (256'hBF03070F0AF01F08BF0109F01F20BF00E5EFDF04BF03070F0AF01F08BF0109F0),
    .INIT_5F                   (256'hBF0109F01F40BF00E603DF10BF03070F0AF01F08BF0109F01F30BF00E5F9DF08),
    .INIT_60                   (256'hE617DF40BF03070F0AF01F08BF0109F01F50BF00E60DDF20BF03070F0AF01F08),
    .INIT_61                   (256'h0AF01F08BF0109F01F70BF00E621DF80BF03070F0AF01F08BF0109F01F60BF00),
    .INIT_62                   (256'h09F01F10BF00E634DF02BF04070F0AF01F10BF0109F0BF00E62ADF01BF04070F),
    .INIT_63                   (256'hDF08BF04070F0AF01F10BF0109F01F20BF00E63EDF04BF04070F0AF01F10BF01),
    .INIT_64                   (256'h1F10BF0109F01F40BF00E652DF10BF04070F0AF01F10BF0109F01F30BF00E648),
    .INIT_65                   (256'hBF00E666DF40BF04070F0AF01F10BF0109F01F50BF00E65CDF20BF04070F0AF0),
    .INIT_66                   (256'h070F0AF01F10BF0109F01F70BF00E670DF80BF04070F0AF01F10BF0109F01F60),
    .INIT_67                   (256'hBF0109F01F10BF00E683DF02BF05070F0AF01F18BF0109F0BF00E679DF01BF05),
    .INIT_68                   (256'hE697DF08BF05070F0AF01F18BF0109F01F20BF00E68DDF04BF05070F0AF01F18),
    .INIT_69                   (256'h0AF01F18BF0109F01F40BF00E6A1DF10BF05070F0AF01F18BF0109F01F30BF00),
    .INIT_6A                   (256'h1F60BF00E6B5DF40BF05070F0AF01F18BF0109F01F50BF00E6ABDF20BF05070F),
    .INIT_6B                   (256'hBF06070F0AF01F18BF0109F01F70BF00E6BFDF80BF05070F0AF01F18BF0109F0),
    .INIT_6C                   (256'h1F20BF0109F01F10BF00E6D2DF02BF06070F0AF01F20BF0109F0BF00E6C8DF01),
    .INIT_6D                   (256'hBF00E6E6DF08BF06070F0AF01F20BF0109F01F20BF00E6DCDF04BF06070F0AF0),
    .INIT_6E                   (256'h070F0AF01F20BF0109F01F40BF00E6F0DF10BF06070F0AF01F20BF0109F01F30),
    .INIT_6F                   (256'h09F01F60BF00E704DF40BF06070F0AF01F20BF0109F01F50BF00E6FADF20BF06),
    .INIT_70                   (256'h07535000070F0AF01F20BF0109F01F70BF00D000DF80BF06070F0AF01F20BF01),
    .INIT_71                   (256'h192807561A90194807531A501948500007569A020756990807561A0207561908),
    .INIT_72                   (256'h1A90197807561A90195807531A70195807561A70194807561A70192807561A90),
    .INIT_73                   (256'h07561A7019A807561A70198807531A90198807561A70195807561A7019780756),
    .INIT_74                   (256'h19B807561A7019D807561A7019B807561A9019B807531A9019D807561A9019A8),
    .INIT_75                   (256'h50000012DF041F01DA03DF019F03D902DF009F025000DA03D902500007561A90),
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
    .INITP_00                  (256'h000C0000300000D26DDCAAA8A00104512772772DDDD8AAA280000B488AA8AAAA),
    .INITP_01                  (256'hA4924924B4B4B4B4B4B4B4B4B44444D3C2C0000300000C0000300000C0000300),
    .INITP_02                  (256'h535D4D7535D4D7535D4D7535D20412D353535353777489346361377510A4A4A4),
    .INITP_03                  (256'h28C28C28C2D7535D4D7535D4D7535D4D7535D28C28C28C28C28C28C28C28C2D7),
    .INITP_04                  (256'h28C28C28C28C28C28C28C2D7535D4D7535D4D7535D4D7535D28C28C28C28C28C),
    .INITP_05                  (256'h5D4D7535D28C28C28C28C28C28C28C28C2D7535D4D7535D4D7535D4D7535D28C),
    .INITP_06                  (256'hC0D4D303534C0B535353528C28C28C28C28C28C28C28C2D7535D4D7535D4D753),
    .INITP_07                  (256'h88882AB7776820827699999999A082082C0C0C0C093024C093024C0D4D303534),
    .INITP_08                  (256'h20A2222222222220888888888220822088220882208888822222220888888888),
    .INITP_09                  (256'h2082088820882082088220882208820882208220888822222088222222222222),
    .INITP_0A                  (256'h2420908288888888888882222208888220888822222222222220822082082208),
    .INITP_0B                  (256'h04C2104C2104C2104C21030804C20130804C20130804C20130804C200C209094),
    .INITP_0C                  (256'h04C2103084130841308413084130841308413084130840C2104C2104C2104C21),
    .INITP_0D                  (256'h1308413084130841308413084130840C2104C2104C2104C2104C2104C2104C21),
    .INITP_0E                  (256'h0000000000000000A8A28AA820820820820820820820820820829999A8413084),
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
