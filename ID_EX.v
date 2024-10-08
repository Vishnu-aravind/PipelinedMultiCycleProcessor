module id_ex (
    input clk,
    input ALUSrc,MemtoReg,MemRead,MemWrite,RegWrite,
    input[1:0]ALUOp,
    input [31:0] rs1,
    input [31:0] rs2,
    input [4:0] if_rs1,
    input [4:0] if_rs2,
    input [31:0] immediate,
    input [4:0] if_rd,
    input [31:0]if_id_instruction,
    output reg id_ex_ALUSrc,id_ex_MemtoReg,id_ex_MemRead,id_ex_MemWrite,id_ex_RegWrite,
    output reg [1:0]id_ex_ALUOp,
    output reg [31:0] out_rs1,
    output reg [31:0] out_rs2,
    output reg [4:0] id_rs1,
    output reg [4:0] id_rs2,
    output reg [4:0] id_rd,
    output reg [31:0] immediate_out,
    output reg [31:0] id_ex_instr
);
always @(posedge clk ) begin
    out_rs1 <= rs1;
    out_rs2 <= rs2;
    id_rs1  <= if_rs1;
    id_rs2  <= if_rs2;
    id_rd   <= if_rd;
    id_ex_ALUSrc   <= ALUSrc;
    id_ex_MemtoReg <= MemtoReg;
    id_ex_MemRead  <= MemRead;
    id_ex_MemWrite <= MemWrite;
    id_ex_RegWrite <= RegWrite;
    id_ex_ALUOp    <= ALUOp;
    immediate_out <= immediate;
    id_ex_instr <= if_id_instruction;

end
    
endmodule