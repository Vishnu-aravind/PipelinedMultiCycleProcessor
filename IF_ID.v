module if_id (
    input clk,
    input [31:0]instr,
    input [31:0]pc,
    input if_idWrite,
    output Instruction;
    output [31:0]pc_out
);
always @(posedge clk ) begin
    if (if_idWrite==0) begin
        Instruction <= Instruction;
        pc_out      <= pc_out;
    end
    else begin
        Instruction <= instr;
        pc_out      <= pc;

    end
end
    
endmodule