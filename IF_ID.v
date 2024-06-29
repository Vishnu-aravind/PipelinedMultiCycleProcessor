module if_id (
    input clk,
    input [31:0]instr,
    input [31:0]pc,
    input [31:0]pc_branch,
    input if_idWrite,
    input if_flush,
    output reg [31:0]Instruction,
    output reg [31:0]pc_out
);
always @(posedge clk ) begin
    if (if_idWrite == 0) begin
        Instruction <= Instruction;
        pc_out      <= pc_out;
    end
    else if(if_flush == 1) begin
        Instruction <= 32'b0;
        pc_out      <= pc_branch;
    end
    else begin
        Instruction <= instr;
        pc_out      <= pc;

    end
end
    
endmodule