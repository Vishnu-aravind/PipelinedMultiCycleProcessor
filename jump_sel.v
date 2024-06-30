module jump_sel(
    input [6:0] opcode,
    output reg sel
    );
    always@(*) begin
        if(opcode == 7'b1100111) begin
            sel <= 1;
        end
        else begin
            sel <= 0;
        end
    end
endmodule
