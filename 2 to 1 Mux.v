module MUX (input [31:0] a,b,
 input  s,
 output [31:0] out);

assign out = (s == 1'b0) ? a : b;
endmodule
