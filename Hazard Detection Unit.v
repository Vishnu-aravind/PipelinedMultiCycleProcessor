module hazarddetection (
    input [31:0] instr,
    input id_ex_memread,
    output pc_write,if_idWrite,controltomux
);
    wire [6:0]opcode;
    wire [4:0]id_ex_rd;
    wire rs1_comp,rs2_comp;
    assign opcode = instr[6:0];
    assign id_ex_rd = instr[11:7];
    rs1_comparator r1(instr[19:15],id_ex_rd,rs1_comp);
    rs2_comparator r2(instr[24:20],id_ex_rd,opcode,rs2_comp);
    assign controltomux = ((rs1_comp || rs2_comp) && id_ex_memread);
    assign if_idWrite   = ~((rs1_comp || rs2_comp) && id_ex_memread);
    assign pc_write     = ~((rs1_comp || rs2_comp) && id_ex_memread);

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