module id_ex (
    input clk,
    input [2:0]wb,
    input [2:0]m,
    input [1:0]ex,
    input [31:0] rs1,
    input [31:0] rs2,
    input [4:0] if_rs1,
    input [4:0] if_rs2,
    input [31:0] immediate,
    input [4:0] if_rd,
    input [31:0] pc,
    output [31:0] pc_out,
    output [2:0]out_wb,
    output [2:0]out_m,
    output [31:0] out_rs1,
    output [31:0] out_rs2,
    output [4:0] id_rs1,
    output [4:0] id_rs2,
    output [4:0] id_rd,
    output [31:0] immediate_out
);
always @(posedge clk ) begin
    out_rs1 <= rs1;
    out_rs2 <= rs2;
    id_rs1  <= if_rs1;
    id_rs2  <= if_rs2;
    id_rd   <= if_rd;
    out_wb  <= wb;
    out_m   <= m;
    immediate_out <= immediate;
    pc_out  <= pc;

end
    
endmodule