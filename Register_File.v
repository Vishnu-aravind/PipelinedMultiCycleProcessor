module Register_File(RegWrite, Rs1, Rs2, Rd, Write_data, Read_data1, Read_data2);
    input RegWrite;
    input [4:0]Rs1, Rs2, Rd;
    input [31:0]Write_data;
    output [31:0]Read_data1, Read_data2;
    reg [31:0]reg_file[31:0];
initial begin
    reg_file[0] = 32'b0;
    reg_file[1] = 32'd1;
    reg_file[2] = 32'd2;
    reg_file[3] = 32'd3;
    reg_file[4] = 32'd4;
    reg_file[5] = 32'b1;
    reg_file[6] = 32'b1;
    reg_file[7] = 32'b1;
    reg_file[8] = 32'b1;
    reg_file[9] = 32'b1;
    reg_file[10] = 32'd5;
    reg_file[11] = 32'd6;
    reg_file[12] = 32'd7;
    reg_file[13] = 32'd8;
    reg_file[14] = 32'b1;
    reg_file[15] = 32'b1;
    reg_file[16] = 32'b1;
    reg_file[17] = 32'b1;
    reg_file[18] = 32'b1;
    reg_file[19] = 32'b1;
    reg_file[20] = 32'b1;
    reg_file[21] = 32'b1;
    reg_file[22] = 32'b1;
    reg_file[23] = 32'b1;
    reg_file[24] = 32'b1;
    reg_file[25] = 32'b1;
    reg_file[26] = 32'b1;
    reg_file[27] = 32'b1;
    reg_file[28] = 32'd2;
    reg_file[29] = 32'd32;
    reg_file[30] = 32'd2;
    reg_file[31] = 32'b1;
end
always@(*) begin
        case(RegWrite) 
            1'b1 : reg_file[Rd] <= Write_data;
            default : reg_file[Rd] <= 32'b0;
        endcase
end
assign Read_data1 = reg_file[Rs1];
assign Read_data2 = reg_file[Rs2];

endmodule