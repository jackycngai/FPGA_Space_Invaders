`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: San Jose State University
// Engineer: Thi Trong Le - 009222018
// 
// Create Date: 09/15/2016 01:49:59 PM
// Design Name: Quad Seven Segment Display
// Module Name: qssd
// Project Name: EE 178 - Lab 2
// Target Devices: BASYS 3
// Tool Versions: Vivado 2016.2
// Description: This is the Verilog module for lab 2 of EE 178. The design allows
//              for the use of the 16 switches on the board to display numbers 
//              and letters on the individual seven segment displays. It also
//              allows control over the illumination of the decimal points.
// 
// Dependencies: 
// 
// Revision:
// Revision v0.01 - File Created
// Revision v0.02 - Module completed without clock and decimal point control
// Revision v0.03 - Added decimal point control
// Revision v0.03 - Module completed with basic clock divider
// Revision v1.00 - Clock divider completed, fully functional
// Revision v1.01 - Added comments to the Verilog code to explain things
// Additional Comments: Will use concatenation on the next lab!
//                      Syntax example: {an3, an2, an1, an0} = 4'b1110;
// 
//////////////////////////////////////////////////////////////////////////////////


module quad_seven_seg(
   input wire clk,
   input wire [3:0] val3, val2, val1, val0,
   input wire dot3, dot2, dot1, dot0,
   output reg an3, an2, an1, an0,
   output reg ca, cb, cc, cd, ce, cf, cg,
   output reg dp
   );
   
   /* Clock Divider - This uses a counter and two variables that are assigned equal
                      to each other. At every positive clock edge, the counter
                      increments and at a certain point, it goes back to zero and
                      the clkdiv variable is inverted. That clkdiv variable is then
                      used as the new clock. 18 bits is the best number to use for
                      this case: 100MHz -> 381Hz. */
   reg  [16:0] count;
   wire divclk;
   reg  divclkdiv;
   assign divclk = divclkdiv;
   always@(posedge clk)
   begin
      count <= count + 1;
      if(count == 17'b11111111111111111)
         divclkdiv <= ~divclkdiv;
      else
         divclkdiv <= divclkdiv;
   end
   
   /* Counter - This is a counter used to sweep through the quad seven segment displays.
                Because it is a 2 bit number, it goes 00, 01, 10, 11, and then resets. 
                Lines up perfectly with quad seven segment displays! */
   reg [1:0] step = 2'b00;
   always@(posedge divclk)
   begin
      step <= step + 1;
   end
   
   /* 2-4 Mux (Anode Control) - This is used to turn on and off the quad seven segment
                                displays. It uses the counter and sweeps through. Due to
                                the counter and clock, it is at a rate where the displays
                                appear to be lit at the same time. */
   always@(*)
   begin
      case(step)
         2'b00:   begin an3=1'b1; an2=1'b1; an1=1'b1; an0=1'b0; end
         2'b01:   begin an3=1'b1; an2=1'b1; an1=1'b0; an0=1'b1; end
         2'b10:   begin an3=1'b1; an2=1'b0; an1=1'b1; an0=1'b1; end
         2'b11:   begin an3=1'b0; an2=1'b1; an1=1'b1; an0=1'b1; end
         default: begin an3=1'bx; an2=1'bx; an1=1'bx; an0=1'bx; end
      endcase
   end
   
   /* 2-1 Mux (Decimal Point Control) - This allows for the decimal point to be turned
                                        on and off. Follows the same theory as the 2-4
                                        Mux and results in individual decimal points
                                        lighting up. */
   always@(*)
   begin
      case(step)
         2'b00:   dp = ~dot0;
         2'b01:   dp = ~dot1;
         2'b10:   dp = ~dot2;
         2'b11:   dp = ~dot3;
         default: dp = 1'b1;
      endcase
   end
   
   /* 4x 4-1 Mux (Switch Control) - This allows for the use of four switches per seven
                                    segment display. The first four for the first display,
                                    second four for the second display, third four for
                                    the third display, and last four for the last display. */
   reg [3:0] val;
   always@(*)
   begin
      case(step)
         2'b00: val = val0;
         2'b01: val = val1;
         2'b10: val = val2;
         2'b11: val = val3;
      endcase
   end
   
   /* 4-7 Decoder (Cathode Control) - This controls the cathods in the quad seven segment
                                      displays to actually display numbers and letters. */
   always@(*)
   begin
      case(val)
         4'b0000: begin ca=1'b0; cb=1'b0; cc=1'b0; cd=1'b0; ce=1'b0; cf=1'b0; cg=1'b1; end //0
         4'b0001: begin ca=1'b1; cb=1'b0; cc=1'b0; cd=1'b1; ce=1'b1; cf=1'b1; cg=1'b1; end //1
         4'b0010: begin ca=1'b0; cb=1'b0; cc=1'b1; cd=1'b0; ce=1'b0; cf=1'b1; cg=1'b0; end //2
         4'b0011: begin ca=1'b0; cb=1'b0; cc=1'b0; cd=1'b0; ce=1'b1; cf=1'b1; cg=1'b0; end //3
         4'b0100: begin ca=1'b1; cb=1'b0; cc=1'b0; cd=1'b1; ce=1'b1; cf=1'b0; cg=1'b0; end //4
         4'b0101: begin ca=1'b0; cb=1'b1; cc=1'b0; cd=1'b0; ce=1'b1; cf=1'b0; cg=1'b0; end //5
         4'b0110: begin ca=1'b0; cb=1'b1; cc=1'b0; cd=1'b0; ce=1'b0; cf=1'b0; cg=1'b0; end //6
         4'b0111: begin ca=1'b0; cb=1'b0; cc=1'b0; cd=1'b1; ce=1'b1; cf=1'b1; cg=1'b1; end //7
         4'b1000: begin ca=1'b0; cb=1'b0; cc=1'b0; cd=1'b0; ce=1'b0; cf=1'b0; cg=1'b0; end //8
         4'b1001: begin ca=1'b0; cb=1'b0; cc=1'b0; cd=1'b1; ce=1'b1; cf=1'b0; cg=1'b0; end //9
         4'b1010: begin ca=1'b0; cb=1'b0; cc=1'b0; cd=1'b0; ce=1'b0; cf=1'b1; cg=1'b0; end //a
         4'b1011: begin ca=1'b1; cb=1'b1; cc=1'b0; cd=1'b0; ce=1'b0; cf=1'b0; cg=1'b0; end //b
         4'b1100: begin ca=1'b1; cb=1'b1; cc=1'b1; cd=1'b0; ce=1'b0; cf=1'b1; cg=1'b0; end //c
         4'b1101: begin ca=1'b1; cb=1'b0; cc=1'b0; cd=1'b0; ce=1'b0; cf=1'b1; cg=1'b0; end //d
         4'b1110: begin ca=1'b0; cb=1'b0; cc=1'b1; cd=1'b0; ce=1'b0; cf=1'b0; cg=1'b0; end //e
         4'b1111: begin ca=1'b0; cb=1'b1; cc=1'b1; cd=1'b1; ce=1'b0; cf=1'b0; cg=1'b0; end //f
         default: begin ca=1'b1; cb=1'b1; cc=1'b1; cd=1'b1; ce=1'b1; cf=1'b1; cg=1'b1; end //off
      endcase
   end

endmodule