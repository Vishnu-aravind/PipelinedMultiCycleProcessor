module testbench();
reg clk;
maincode arch(clk);

initial begin
    
    #5 clk = 0;
    #5 clk = 1;  //1
    #5 clk = 0;  
    #5 clk = 1;  //2
    #5 clk = 0;  
    #5 clk = 1;  //3
    #5 clk = 0;  
    #5 clk = 1;  //4
    #5 clk = 0;  
    #5 clk = 1;  //5
    #5 clk = 0;   
    #5 clk = 1;  //6
    #5 clk = 0;  
    #5 clk = 1;  //7
    #5 clk = 0;  
    #5 clk = 1;  //8
    #5 clk = 0;  
    #5 clk = 1;  //9
    #5 clk = 0;   
    #5 clk = 1;  //10
    #5 clk = 0;  
    #5 clk = 1;  //11
    #5 clk = 0;  
    #5 clk = 1;  //12
    #5 clk = 0;  
    #5 clk = 1;  //13
    #5 clk = 0;  
    #5 clk = 1;  //14
    #5 clk = 0;  
    #5 clk = 1;  //15
    #5 clk = 0;  
    #5 clk = 1;  //16
    #5 clk = 0;  
    #5 clk = 1;  //17 
    #5 clk = 0;  
    #5 clk = 1;  //18
    #5 clk = 0;  
    #5 clk = 1;  //19
    #5 clk = 0;  
    #5 clk = 1;  //20
    #5 clk = 0;  
    #5 clk = 1;  //21 
   
       
end

endmodule