module ALU_Control(ALUOp,func7,func3,ALUControl_out);
    input [1:0] ALUOp;
    input func7;
    input [14:12] func3;
    output reg [3:0] ALUControl_out;
always@(*) begin
    casez ({ALUOp,func7,func3})
        6'b00_0_000 : ALUControl_out <= 4'b0010;
        6'b01_0_000 : ALUControl_out <= 4'b0110;
        6'b10_0_000 : ALUControl_out <= 4'b0010;
        6'b10_1_000 : ALUControl_out <= 4'b0110;
        6'b10_0_111 : ALUControl_out <= 4'b0000;
        6'b10_0_110 : ALUControl_out <= 4'b0001;
        6'b00_z_zzz : ALUControl_out <= 4'b0010;
        6'b10_0_001 : ALUControl_out <= 4'b1000;
        6'b10_0_101 : ALUControl_out <= 4'b1001;
        6'b10_1_101 : ALUControl_out <= 4'b1011;
        default     : ALUControl_out <= 4'b0000;
    endcase
end
endmodule