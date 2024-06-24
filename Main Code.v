module maincode (clk);
    input clk;
    wire [31:0] PC,pc_4,instr,if_id_instruction,if_id_pc,Write_data,Read_data1,Read_data2,if_id_ImmExt,id_ex_pc,id_ex_rs1val,id_ex_rs2val,id_ex_immediate;
    wire [7:0] control_in;
    wire [4:0] mem_wb_rd,id_ex_rs1,id_ex_rs2,id_ex_rd;
    wire [1:0] ALUOp,id_ex_ALUOp;
    wire if_idWrite,mem_wb_regwrite,ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,pc_write,controlmux,id_ex_ALUSrc,id_ex_MemtoReg,id_ex_MemRead,id_ex_MemWrite,id_ex_Branch,id_ex_RegWrite;
    reg [31:0] pc;
    initial begin
        pc<=32'b0;
    end
    Program_Counter pc1(clk,pc,pc_write,PC);
    adder add1(PC,pc_4);
    Instruction_Memory inst(PC,instr);
    if_id dut1(clk,instr,PC,if_idWrite,if_id_instruction,if_id_pc);
    Register_File rf(mem_wb_regwrite,if_id_instruction[19:15],if_id_instruction[24:20],mem_wb_rd, Write_data, Read_data1, Read_data2);
    Immediate_Generator ig(if_id_instruction,if_id_ImmExt);
    Control_Unit cu(if_id_instruction[6:0],ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,ALUOp);
    hazarddetection hd(id_ex_instr,id_ex_memread,pc_write,if_idWrite,controlmux);
    assign control_in = (controlmux == 1'b0) ? {ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,ALUOp} : 8'b0;
    id_ex dut2(clk,control_in[7],control_in[6],control_in[5],control_in[4],control_in[3],control_in[2],control_in[1:0],Read_data1,Read_data2,if_id_instruction[19:15],if_id_instruction[24:20],if_id_ImmExt,if_id_instruction[11:7],if_id_pc,id_ex_pc,id_ex_ALUSrc,id_ex_MemtoReg,id_ex_MemRead,id_ex_MemWrite,id_ex_Branch,id_ex_RegWrite,id_ex_ALUOp,id_ex_rs1val,id_ex_rs2val,id_ex_rs1,id_ex_rs2,id_ex_rd,id_ex_immediate);

endmodule