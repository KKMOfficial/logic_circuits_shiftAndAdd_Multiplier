module EBitCounter_tb;
    reg rst;
    wire stp,lds;
    wire [3:0]state;
    reg clk;

//EBitCounter(rst,clk,stp,lds,state)
    EBitCounter NewInstance(rst,clk,stp,lds,state);
    always
    begin
        clk = 0; #50; clk = 1; #50;
    end
    initial
    begin
      rst = 0;
      #1200;

    end
endmodule