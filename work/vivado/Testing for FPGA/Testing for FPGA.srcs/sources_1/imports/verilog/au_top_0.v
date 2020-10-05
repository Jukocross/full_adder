/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [0:0] custominA,
    input [0:0] custominB,
    input [0:0] custominC
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_fulladder_s;
  wire [1-1:0] M_fulladder_cout;
  reg [1-1:0] M_fulladder_x;
  reg [1-1:0] M_fulladder_y;
  reg [1-1:0] M_fulladder_cin;
  full_adder_1 fulladder (
    .x(M_fulladder_x),
    .y(M_fulladder_y),
    .cin(M_fulladder_cin),
    .s(M_fulladder_s),
    .cout(M_fulladder_cout)
  );
  
  wire [1-1:0] M_slowclock_value;
  counter_2 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  
  wire [3-1:0] M_plus_one_out;
  seq_plus_one_3 plus_one (
    .clk(M_slowclock_value),
    .rst(custominA[0+0-:1] | custominB[0+0-:1] | custominC[0+0-:1]),
    .out(M_plus_one_out)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_4 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_fulladder_x = M_plus_one_out[0+0-:1] | custominA[0+0-:1];
    M_fulladder_y = M_plus_one_out[1+0-:1] | custominB[0+0-:1];
    M_fulladder_cin = M_plus_one_out[2+0-:1] | custominC[0+0-:1];
    io_led[16+1+0-:1] = M_fulladder_s;
    io_led[16+0+0-:1] = M_fulladder_cout;
  end
endmodule
