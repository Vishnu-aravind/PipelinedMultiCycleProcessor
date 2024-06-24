module mem_wb (
    input clk,
    input [2:0]wb,
    input [31:0]readdata,
    input [31:0]alu_result,
    input [4:0] ex_rd,
    output [2:0]out_wb,
    output [31:0]readdata_out,
    output [31:0]alu_result_out,
    output [4:0] mem_rd
);
always @(posedge clk ) begin
    out_wb <= wb;
    readdata_out <= readdata;
    alu_result_out <= alu_result;
    mem_rd <= ex_rd;
end
    
endmodule