module MUX_3 (input [31:0] a,b,c,
 input [1:0]  s,
 output reg [31:0] out);

always @(*) begin
    case (s)
        2'b00: out <= a;
        2'b10: out <= b;
        2'b01: out <= c;
        default: out <= c;
    endcase
end
endmodule
