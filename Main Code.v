module maincode (clk);
    input clk;
    wire [31:0] PC,pc_4,Pc,instr,if_id_instruction,if_id_pc,Write_data,Read_data1,Read_data2,if_id_ImmExt,id_ex_rs1val,id_ex_rs2val,id_ex_immediate,shift_out,shift_adderout,AluMuxoutput,id_ex_instr,rs1,rs2,id_ex_alu_result,ex_mem_pc,ex_mem_alu_result,ex_mem_writedata,ex_mem_Readdata,mem_wb_Readdata,mem_wb_alu_result,if_id_Read_data1,if_id_Read_data2,if_id_pc_4,adder_input;
    wire [6:0] control_in;
    wire [6:0] opcode;
    wire [4:0] mem_wb_rd,id_ex_rs1,id_ex_rs2,id_ex_rd,ex_mem_rd;
    wire [3:0] ALUControl_out;
    wire [1:0] ALUOp,id_ex_ALUOp,forward_a,forward_b;
    wire if_idWrite,mem_wb_RegWrite,jump,adder_sel,ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,sel,pc_write,controlmux,id_ex_ALUSrc,id_ex_MemtoReg,id_ex_MemRead,id_ex_MemWrite,id_ex_RegWrite,ex_mem_RegWrite,zero,ex_mem_MemtoReg,ex_mem_MemRead,ex_mem_MemWrite,mem_wb_MemtoReg;
    reg [31:0] pc;
    // fetch
    initial begin
        pc <= 32'b0;
    end
    assign opcode = if_id_instruction[6:0];
    Program_Counter pc1(clk,pc,pc_write,PC);
    adder add1(PC,pc_4);
    Instruction_Memory inst(PC,instr);
    if_id dut1(clk,instr,PC,pc,pc_4,if_idWrite,((zero && Branch)|| jump),if_id_instruction,if_id_pc,if_id_pc_4);
    // decode
    Register_File rf(mem_wb_RegWrite,if_id_instruction[19:15],if_id_instruction[24:20],mem_wb_rd, Write_data, Read_data1, Read_data2);
    Immediate_Generator ig(if_id_instruction,if_id_ImmExt);
    shift s1(if_id_ImmExt,shift_out);
    MUX_2 pc_adder(if_id_pc,Read_data1,adder_sel,adder_input);
    adderB add2(adder_input,shift_out,shift_adderout);
    comparator comp(Read_data1, Read_data2,zero);
    MUX_2 pc_mux(pc_4,shift_adderout,((zero && Branch)|| jump),Pc);
    
    always@(Pc) begin
        pc <= Pc;
    end
    Control_Unit cu(opcode,jump,ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,ALUOp);
    jump_sel js(if_id_instruction[6:0],adder_sel);
    
    hazarddetection hd(if_id_instruction,id_ex_rd,id_ex_MemRead,pc_write,if_idWrite,controlmux);
    assign control_in = (controlmux == 1'b0) ? {ALUSrc,MemtoReg,MemRead,MemWrite,RegWrite,ALUOp} : 7'b0;
    MUX_2 readdata1(Read_data1,if_id_pc_4,jump,if_id_Read_data1);
    MUX_2 readdata2(Read_data2,32'b0,jump,if_id_Read_data2);
    id_ex dut2(clk,control_in[6],control_in[5],control_in[4],control_in[3],control_in[2],control_in[1:0],if_id_Read_data1,if_id_Read_data2,if_id_instruction[19:15],if_id_instruction[24:20],if_id_ImmExt,if_id_instruction[11:7],if_id_instruction,id_ex_ALUSrc,id_ex_MemtoReg,id_ex_MemRead,id_ex_MemWrite,id_ex_RegWrite,id_ex_ALUOp,id_ex_rs1val,id_ex_rs2val,id_ex_rs1,id_ex_rs2,id_ex_rd,id_ex_immediate,id_ex_instr);
    // execute
    MUX_2 mux_alu(rs2,id_ex_immediate,id_ex_ALUSrc,AluMuxoutput); 
    ALU_Control alucontrol(id_ex_ALUOp,id_ex_instr[30],id_ex_instr[14:12],ALUControl_out);
    MUX_3 muxrs1(id_ex_rs1val,Write_data,ex_mem_alu_result,forward_a,rs1);
    MUX_3 muxrs2(id_ex_rs2val,Write_data,ex_mem_alu_result,forward_b,rs2);
    forwardunit fu(id_ex_rs1,id_ex_rs2,ex_mem_rd,mem_wb_rd,ex_mem_RegWrite,mem_wb_RegWrite,forward_a,forward_b);
    ALU alu(rs1,AluMuxoutput,ALUControl_out,id_ex_alu_result);
    ex_mem dut3(clk,id_ex_MemtoReg,id_ex_MemRead,id_ex_MemWrite,id_ex_RegWrite,id_ex_alu_result,rs2,id_ex_rd,ex_mem_alu_result,ex_mem_writedata,ex_mem_rd,ex_mem_MemtoReg,ex_mem_MemRead,ex_mem_MemWrite,ex_mem_RegWrite);
     // memory
    datamemory d1(ex_mem_alu_result,ex_mem_writedata,ex_mem_MemRead,ex_mem_MemWrite,ex_mem_Readdata);
    mem_wb dut4(clk,ex_mem_RegWrite,ex_mem_MemtoReg,ex_mem_Readdata,ex_mem_alu_result,ex_mem_rd,mem_wb_RegWrite,mem_wb_MemtoReg,mem_wb_Readdata,mem_wb_alu_result,mem_wb_rd);
    // writeback
    MUX_2 mux_writeback(mem_wb_alu_result,mem_wb_Readdata,mem_wb_MemtoReg,Write_data);

endmodule