module datamemory(Address,Writedata,MemRead,MemWrite,Readdata);
input [31:0]Address,Writedata;
input MemRead,MemWrite;
output reg [31:0]Readdata;

reg [31:0] datamem[64:0];

initial begin
    datamem [0] <= 32'b0;
    datamem [1] <= 32'd32;
    datamem [2] <= 32'd40;
    datamem [3] <= 32'd47;
    datamem [4] <= 32'd7;
    datamem [5] <= 32'd100;
end

always @(MemRead,MemWrite) begin
    if (MemWrite) begin
        datamem[Address] <= Writedata; 
        Readdata <= 32'b0;  
    end
    else if(MemRead) begin
        Readdata <= datamem[Address];
    end
end
endmodule