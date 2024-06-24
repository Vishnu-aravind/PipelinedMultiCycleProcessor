module forwardunit (rs1,rs2,ex_mem_rd,mem_wb_rd,ex_mem_regwrite,mem_wb_regwrite,forward_a,forward_b);
input [4:0]rs1,rs2,ex_mem_rd,mem_wb_rd;
input ex_mem_regwrite,mem_wb_regwrite;
output reg [1:0]forward_a,forward_b;
always @(*) begin
    if (ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == rs1)) begin
        forward_a <= 2'b10;
    end
    else if(mem_wb_regwrite && (mem_wb_rd != 0) && (mem_wb_rd == rs1)) begin
        forward_a <= 2'b01;
    end
    else begin
        forward_a <= 2'b00;
    end
end    
always @(*) begin
    if (ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == rs2)) begin
        forward_b <= 2'b10;
    end
    else if(mem_wb_regwrite && (mem_wb_rd != 0) && (mem_wb_rd == rs2)) begin
        forward_b <= 2'b01;
    end
    else begin
        forward_b <= 2'b00;
    end
end    
endmodule