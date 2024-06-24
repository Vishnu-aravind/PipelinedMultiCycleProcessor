module Program_Counter(clk,pc,pc_write,PC);
    input clk,pc_write;
    input [31:0]pc;
    output reg [31:0]PC;

    always @(posedge clk) begin
        case (pc_write)
            1'b0: PC <= PC;
            default: PC <= pc;
        endcase
    end
   
endmodule