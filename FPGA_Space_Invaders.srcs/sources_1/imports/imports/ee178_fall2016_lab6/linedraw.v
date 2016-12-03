// File: linedraw.v
// This is the linedraw design for EE178 Lab #6.

// The `timescale directive specifies what the
// simulation time units are (1 ns here) and what
// the simulator time step should be (1 ps here).

`timescale 1 ns / 1 ps

// Declare the module and its ports. This is
// using Verilog-2001 syntax.

module linedraw (
  input  wire go,
  output wire busy,
  input  wire [7:0] stax,
  input  wire [7:0] stay,
  input  wire [7:0] endx,
  input  wire [7:0] endy,
  output wire wr,
  output wire [15:0] addr,
  input  wire pclk
  );

//Declarations for Control FSM
parameter IDLE = 2'b00;
parameter RUN  = 2'b01;
parameter DONE = 2'b10;
reg [1:0] state;
wire stop;

//Declarations for Bresenham Line Drawing Algorithm
wire signed [15:0] x0, x1, y0, y1, deltax, deltay, dx, dy, err_next, err1, err2, e2, x_next, y_next, xa, xb, ya, yb;
wire right, down, in_loop, e2_lt_dx, e2_gt_dy;
reg  signed [15:0] err, x, y;

//Control FSM
always@(posedge pclk)
begin
   case(state)
      IDLE: if(go)
               state <= RUN;
            else
               state <= IDLE;
      RUN:  if(stop)
               state <= DONE;
            else
               state <= RUN;
      DONE: if (go)
               state <= RUN;
            else
               state <= IDLE;
      default: state <= IDLE;
   endcase
end
assign in_loop = (state == RUN);

//Bresenham Line Drawing Algorithm
assign x0 = stax;
assign x1 = endx;
assign deltax = x1 - x0;
assign right = ~(deltax[15]);
assign dx = (!right) ? (-deltax) : (deltax);

assign y0 = stay;
assign y1 = endy;
assign deltay = y1 - y0;
assign down = ~(deltay[15]);
assign dy = (down) ? (-deltay) : (deltay);

assign e2 = err << 1;
assign e2_gt_dy = (e2 > dy);
assign e2_lt_dx = (e2 < dx);

assign err1 = (e2_gt_dy) ? (err + dy) : (err);
assign ya = (down) ? (y + 1) : (y - 1);
assign yb = (e2_lt_dx) ? (ya) : (y);
assign y_next = (in_loop) ? (yb) : (y0);

assign err2 = (e2_lt_dx) ? (err1 + dx) : (err1);
assign xa = (right) ? (x + 1) : (x - 1);
assign xb = (e2_gt_dy) ? (xa) : (x);
assign x_next = (in_loop) ? (xb) : (x0);

assign err_next = (in_loop) ? (err2) : (dx + dy);
assign stop = ( (x == x1) && (y == y1) );

always@(posedge pclk)
begin
   err <= err_next;
   x <= x_next;
   y <= y_next;
end

assign busy = in_loop;
assign wr = in_loop;
assign addr = {y[7:0], x[7:0]};

endmodule
