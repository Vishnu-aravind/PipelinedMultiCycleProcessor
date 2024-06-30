module Control_Unit (Opcode,jump,ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite,ALUOp);
    input [6:0] Opcode;
    output reg jump,ALUSrc,MemtoReg,MemRead,MemWrite,Branch,RegWrite;
    output reg [1:0] ALUOp;
    initial begin
        Branch <= 0;
        jump   <= 0;
    end
always@(*) begin
    case (Opcode)
        7'b0110011:
        begin
            jump     <= 0;
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;           
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 1;
            ALUOp    <= 2'b10;
        end 
        7'b0010011:
        begin
            jump     <= 0;
            ALUSrc   <= 1;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 1;
            ALUOp    <= 2'b10;
        end
        7'b1100011:
        begin
            jump     <= 0;
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 1;
            RegWrite <= 0;
            ALUOp    <= 2'b01;
        end
        7'b0000011:
        begin
            jump     <= 0;
            ALUSrc   <= 1;
            MemtoReg <= 1;
            MemRead  <= 1;
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 1;
            ALUOp    <= 2'b00;
        end
        7'b0100011:
        begin
            jump     <= 0;
            ALUSrc   <= 1;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 1;
            Branch   <= 0;
            RegWrite <= 0;
            ALUOp    <= 2'b00;
        end
        7'b1101111: 
        begin
            jump     <= 1;
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 1;
            ALUOp    <= 2'b11;
        end
        7'b1100111:
        begin
            jump     <= 1;
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 1;
            ALUOp    <= 2'b11;
        end
        default: 
        begin
            jump     <= 0;
            ALUSrc   <= 0;
            MemtoReg <= 0;
            MemRead  <= 0;
            MemWrite <= 0;
            Branch   <= 0;
            RegWrite <= 0;
            ALUOp    <= 2'b00;
        end 
    endcase
    
end
    
endmodule