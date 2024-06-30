module MUX_2 (input [31:0] a,b,
 input  s,
 output reg [31:0] out);
always@(*) begin
    if(s==0) begin
        out <= a;
    end
    else if(s==1) begin
         out <= b;
    end
end
endmodule
