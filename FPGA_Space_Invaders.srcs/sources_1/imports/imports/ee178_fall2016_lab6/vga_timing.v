// File: vga_timing.v
// This is the vga timing design for EE178 Lab #6.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module vga_timing (
  output reg [10:0] vcount = 0,
  output wire vsync,
  output wire vblnk,
  output reg [10:0] hcount = 0,
  output wire hsync,
  output wire hblnk,
  input  wire pclk
  );

wire [10:0] htc;
always@(posedge pclk)
begin
   if(htc)
      hcount <= 0;
   else
      hcount <= hcount + 1;
end
assign htc = (hcount == 1055);

assign hblnk = (hcount >= 800);
assign hsync = (hcount >= 840) && (hcount <= 968);

wire [10:0] vtc;
always@(posedge pclk)
begin
   if(htc)
      begin
         if(vtc)
            vcount <= 0;
         else
            vcount <= vcount + 1;
      end
end
assign vtc = (vcount == 627);

assign vblnk = (vcount >= 600);
assign vsync = (vcount >= 601) && (vcount <= 605);

endmodule
