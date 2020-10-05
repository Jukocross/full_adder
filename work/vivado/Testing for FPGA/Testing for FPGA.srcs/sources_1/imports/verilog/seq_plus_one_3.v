/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seq_plus_one_3 (
    input clk,
    input rst,
    output reg [2:0] out
  );
  
  
  
  reg [2:0] M_register_1_d, M_register_1_q = 1'h0;
  
  
  localparam S0_value_controller = 1'd0;
  localparam S1_value_controller = 1'd1;
  
  reg M_value_controller_d, M_value_controller_q = S0_value_controller;
  
  always @* begin
    M_value_controller_d = M_value_controller_q;
    M_register_1_d = M_register_1_q;
    
    M_register_1_d = 3'h0;
    
    case (M_value_controller_q)
      S0_value_controller: begin
        if (M_register_1_q <= 3'h7) begin
          M_register_1_d = M_register_1_q + 1'h1;
          M_value_controller_d = S0_value_controller;
        end else begin
          M_value_controller_d = S1_value_controller;
        end
      end
      S1_value_controller: begin
        M_register_1_d = 3'h0;
        M_value_controller_d = S0_value_controller;
      end
    endcase
    out = M_register_1_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_register_1_q <= 1'h0;
    end else begin
      M_register_1_q <= M_register_1_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_value_controller_q <= 1'h0;
    end else begin
      M_value_controller_q <= M_value_controller_d;
    end
  end
  
endmodule
