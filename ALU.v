module ALU (A,B,ALUcontrol_In,ALUResult,zero);
    input [31:0] A,B;
    input [3:0] ALUcontrol_In;
    output reg [31:0] ALUResult;
    output reg zero;
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
always@(ALUResult) begin
    if(ALUResult == 32'b0 ) begin
        zero <= 1;
    end
    else begin
        zero <= 0;
    end
end
endmodule