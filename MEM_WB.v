module mem_wb (
    input clk,
    input ex_mem_RegWrite,ex_mem_MemtoReg,
    input [31:0]readdata,
    input [31:0]alu_result,
    input [4:0] ex_rd,
    output reg mem_wb_RegWrite,mem_wb_MemRead,
    output reg [31:0]readdata_out,
    output reg [31:0]alu_result_out,
    output reg [4:0] mem_rd
);
always @(posedge clk ) begin
    mem_wb_RegWrite  <= ex_mem_RegWrite;
    mem_wb_MemRead   <= ex_mem_MemtoReg;
    readdata_out <= readdata;
    alu_result_out <= alu_result;
    mem_rd <= ex_rd;
end
    
endmodule