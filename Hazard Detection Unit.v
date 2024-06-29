module hazarddetection (
    input [31:0] instr,
    input [4:0]id_ex_rd,
    input id_ex_memread,
    output reg pc_write,if_idWrite,controltomux
);
    wire [6:0]opcode;
    wire rs1_comp,rs2_comp,rs;
    assign opcode = instr[6:0];
    initial begin
        if_idWrite = 1;
        pc_write   = 1;
    end
    rs1_comparator r1(instr[19:15],id_ex_rd,rs1_comp);
    rs2_comparator r2(instr[24:20],id_ex_rd,opcode,rs2_comp);
    assign rs = rs1_comp || rs2_comp;
    always@(rs,id_ex_memread) begin
         controltomux = (rs && id_ex_memread);
         if_idWrite   = ~(rs && id_ex_memread);
         pc_write     = ~(rs && id_ex_memread);
    end
    

endmodule

module rs1_comparator(rs1,rd,rs1_comp);
input [4:0]rs1,rd;
output reg rs1_comp;
always@(*)begin
    if(rs1==rd) begin
        rs1_comp <= 1'b1;
    end
    else begin
        rs1_comp <= 1'b0;
    end
end
endmodule

module rs2_comparator(rs2,rd,opcode,rs2_comp);
input [4:0]rs2,rd;
input [6:0]opcode;
output reg rs2_comp;
always@(*)begin
    case(opcode)
        0010011: rs2_comp <= 1'b0;
        default:
            if(rs2 == rd) begin
                rs2_comp <= 1'b1;
            end
            else begin
                rs2_comp <= 1'b0;
            end
    endcase
end
endmodule