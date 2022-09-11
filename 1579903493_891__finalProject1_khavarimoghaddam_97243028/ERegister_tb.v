module ERegister_tb;
    reg clk;
    wire ops;
    reg [7:0] L;
    reg lds;
    wire [6:0] Q;
    reg sis;
    reg ebl;
    ERegister Register1(ops,Q,lds,L,clk,sis,ebl);

    always
    begin
        clk = 0; #50; clk = 1; #50;
    end

    initial 
    begin 

    ebl = 1;
    sis = 0;
    lds = 1;
    L = 8'b10011101;
    #100;
    ebl = 1;
    sis = 0;
    lds = 0;
    L = 8'b10011101;
    #700;
    ebl = 0;
    sis = 0;
    lds = 1;
    L = 8'b10011101;
    #100;

    end

endmodule