module ALU (A,B,ALUcontrol_In,ALUResult);
    input [31:0] A,B;
    input [3:0] ALUcontrol_In;
    output reg [31:0] ALUResult;
    
always@(*) begin
    case (ALUcontrol_In)
    4'b0000: ALUResult <= A&B;
    4'b0001: ALUResult <= A|B;
    4'b0010: ALUResult <= A+B;
    4'b0110: ALUResult <= A-B;
    4'b1000: ALUResult <= A << B;
    4'b1001: ALUResult <= A >> B;
    4'b1011: ALUResult <= A >> B;
    default: ALUResult <= 0;
    endcase
end
endmodule