module comparator(
    input [31:0] Rs1,
    input [31:0] Rs2,
    output reg zero
    );
    initial begin 
        zero <= 0;
    end
    always @(*) begin
        if(Rs1 == Rs2) begin
            zero <= 1;
        end
        else begin
            zero <= 0;
        end
    end
endmodule
