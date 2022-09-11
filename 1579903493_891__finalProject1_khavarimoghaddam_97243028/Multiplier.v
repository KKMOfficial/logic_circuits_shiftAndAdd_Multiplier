module Multiplier(Z,finish,W,Y,clk,nrst);
    //this unit gets two 8 bit number after 8 clock return's 16 bit result
    
    input [7:0] Y;
    input [7:0] W;
    input nrst,clk;
    output finish;
    wire [15:0] XRegParallelOut;
    wire [15:0] ALUOut;//result of summation of partial product and multiplicant register
    wire YRegSerialOut;//output for multipier register
    wire [15:0] PPRegParallelOut;
    supply0 sis;
    wire [3:0]state;
    output [15:0]Z;
    wire [15:0] XIN;
    wire [7:0] YIN;
    wire sign_set,sign_change;
    wire sign_and,QSIGN_XOR,fsign;
    wire QSIGN,nQSIGN;
    wire [1:0] XYRegMode;
    wire [1:0] PPRegMode;
    wire rst;



    //ALUPlus(Z,ofs,X,Y)
    //module RisingEdge_DFlipFlop(q,q1,d,c);
    //module EBitCounter(rst,clk,state,X,PP,in,sign_set,sign_change);
    //module UniversalRegister(SerialOutput , ParallelOutput , LoadSignal, RegisterMode, SerialInput, clr ,clk)
    //module UniversalRegister2(SerialOutput , ParallelOutput , LoadSignal, RegisterMode, SerialInput, clr , clk)


    assign Z = PPRegParallelOut;
    assign XIN = {sis,sis,sis,sis,sis,sis,sis,sis,sis,W[6:0]};
    assign YIN = {sis,Y[6:0]};
    assign finish = sign_change;



    and and_2(Z[15]  , QSIGN , sign_change);
    not not_1(rst, nrst);
    

    UniversalRegister MultiplierReg(YRegSerialOut,,YIN,XYRegMode,sis,rst,clk);
    //Register That store's Multiplicand(16 bits)
    UniversalRegister2 MultiplicandReg(,XRegParallelOut,XIN,XYRegMode,sis,rst,clk);
    //Register That store's PartialProduct(16 bits)
    UniversalRegister2 ProductReg(,PPRegParallelOut,ALUOut,PPRegMode,sis,rst,clk);
    //ALU for adding two 16 bit number and store them as partial product at seperate register
    ALUPlus ALUnit(ALUOut,,XRegParallelOut,PPRegParallelOut);
    //Counter For Controlling process
    EBitCounter Controller(rst,clk,state,XYRegMode,PPRegMode,YRegSerialOut,sign_set,sign_change);
    //FlipFlop for saving number sign_set

    xor xor_2(fsign , W[7],Y[7]);
    and and_1(sign_and,fsign,sign_set);
    xor xor_1(QSIGN_XOR, QSIGN , sign_and);
    RisingEdge_DFlipFlop Sign_FlipFlop(QSIGN,nQSIGN,QSIGN_XOR,clk,rst);



endmodule