module ex_mem (
    input clk,
    input [2:0]wb,
    input [2:0]m,
    input [31:0]pc,
    input zero,
    input [31:0]alu_result,
    input [31:0]rs2,
    input [4:0] id_rd,
    output [31:0]pc_out,
    output out_zero,
    output [31:0]alu_resultaddress,
    output [31:0]writedata,
    output [4:0] ex_rd,
    output [2:0]out_wb,
    output [2:0]out_m
);
always @(posedge clk ) begin
    pc_out  <= pc;
    out_zero <= zero;
    alu_resultaddress <= alu_result;
    writedata <= rs2;
    ex_rd <= id_rd;
    out_wb <= wb;
    out_m  <= m;
end
    
endmodule