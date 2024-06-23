module Program_Counter(clk,pc, PC);
    input clk;
    input [31:0]pc;
    output reg [31:0]PC;

    always @(posedge clk)
    begin
            PC <= pc;
    end
   
endmodule