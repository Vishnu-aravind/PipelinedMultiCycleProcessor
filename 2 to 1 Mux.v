module MUX_2 (input [31:0] a,b,
 input  s,
 output reg [31:0] out);
always@(a,b) begin
    casez (s)
        1'b0 : out <= a;
        1'b1 : out <= b;
        default : out <= a;
    endcase
end
endmodule
