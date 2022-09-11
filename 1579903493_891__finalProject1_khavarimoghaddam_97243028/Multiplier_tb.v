module Multiplier_tb;
    wire [15:0]Z;
    wire finish;
    reg [7:0]X;
    reg [7:0]Y;
    reg clk;
    reg nrst;
    Multiplier MultiplierTest(Z,finish,X,Y,clk,nrst);
    always
    begin
        clk = 0; #50; clk = 1; #50;
    end
    
    initial
    begin
      nrst = 1;
      X = 8'b10010101;
      Y = 8'b11111111;
      #1000;
      nrst = 0;
      #200;
    end
endmodule