/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seven_seg_select_value_7 (
    input [1:0] in,
    input [2:0] value,
    output reg [7:0] out
  );
  
  
  
  wire [8-1:0] M_seg_segs;
  reg [1-1:0] M_seg_char;
  seven_seg_8 seg (
    .char(M_seg_char),
    .segs(M_seg_segs)
  );
  
  always @* begin
    M_seg_char = 1'h0;
    
    case (in)
      2'h0: begin
        M_seg_char = value[0+0-:1];
        out = M_seg_segs;
      end
      2'h1: begin
        M_seg_char = value[1+0-:1];
        out = M_seg_segs;
      end
      2'h2: begin
        M_seg_char = value[2+0-:1];
        out = M_seg_segs;
      end
      default: begin
        out = 8'hff;
      end
    endcase
  end
endmodule
