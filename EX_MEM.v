module ex_mem (
    input clk,
    input id_ex_MemtoReg,id_ex_MemRead,id_ex_MemWrite,id_ex_Branch,id_ex_RegWrite,
    input [31:0]pc,
    input zero,
    input [31:0]alu_result,
    input [31:0]rs2,
    input [4:0] id_rd,
    output reg [31:0]pc_out,
    output reg out_zero,
    output reg [31:0]alu_resultaddress,
    output reg [31:0]writedata,
    output reg [4:0] ex_rd,
    output reg ex_mem_MemtoReg,ex_mem_MemRead,ex_mem_MemWrite,ex_mem_Branch,ex_mem_RegWrite
);
always @(posedge clk ) begin
    pc_out  <= pc;
    out_zero <= zero;
    alu_resultaddress <= alu_result;
    writedata <= rs2;
    ex_rd <= id_rd;
    ex_mem_MemtoReg <= id_ex_MemtoReg;
    ex_mem_MemRead  <= id_ex_MemRead;
    ex_mem_MemWrite <= id_ex_MemWrite;
    ex_mem_Branch   <= id_ex_Branch;
    ex_mem_RegWrite <= id_ex_RegWrite;
end
    
endmodule