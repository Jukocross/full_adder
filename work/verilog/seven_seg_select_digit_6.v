/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seven_seg_select_digit_6 (
    input [1:0] in,
    output reg [3:0] out
  );
  
  
  
  always @* begin
    out = 4'hf;
    
    case (in)
      2'h0: begin
        out = 4'he;
      end
      2'h1: begin
        out = 4'hd;
      end
      2'h2: begin
        out = 4'hb;
      end
      2'h3: begin
        out = 4'h7;
      end
      default: begin
        out = 4'hf;
      end
    endcase
  end
endmodule
