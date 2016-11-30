// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Mon Nov 28 22:17:40 2016
// Host        : THI-ASUS-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/thile/Dropbox/School Work/EE 178/Labs/Lab
//               8/group2_lab8/group2_lab8.srcs/sources_1/ip/framebuffer/framebuffer_stub.v}
// Design      : framebuffer
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_4,Vivado 2016.3" *)
module framebuffer(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[15:0],dina[3:0],douta[3:0],clkb,web[0:0],addrb[14:0],dinb[7:0],doutb[7:0]" */;
  input clka;
  input [0:0]wea;
  input [15:0]addra;
  input [3:0]dina;
  output [3:0]douta;
  input clkb;
  input [0:0]web;
  input [14:0]addrb;
  input [7:0]dinb;
  output [7:0]doutb;
endmodule
