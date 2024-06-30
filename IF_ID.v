module if_id (
    input clk,
    input [31:0]instr,
    input [31:0]pc,
    input [31:0]pc_branch,
    input [31:0]pc_4,
    input if_idWrite,
    input if_flush,
    output reg [31:0]Instruction,
    output reg [31:0]pc_out,
    output reg [31:0]if_id_pc_4
);
always @(posedge clk ) begin
    if (if_idWrite == 0) begin
        Instruction <= Instruction;
        pc_out      <= pc_out;
        if_id_pc_4  <= if_id_pc_4;
    end
    else if(if_flush == 1) begin
        Instruction <= 32'b0;
        pc_out      <= pc_branch;
        if_id_pc_4  <= pc_4;
    end
    else begin
        Instruction <= instr;
        pc_out      <= pc;
        if_id_pc_4  <= pc_4;

    end
end
    
endmodule