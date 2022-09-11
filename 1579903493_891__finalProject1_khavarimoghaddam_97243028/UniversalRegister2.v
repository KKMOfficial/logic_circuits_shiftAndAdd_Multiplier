module UniversalRegister2(SerialOutput , ParallelOutput , LoadSignal, RegisterMode, SerialInput, clr , clk);
input [15:0]LoadSignal;
input [1:0]RegisterMode;
input SerialInput;
input clk;
input clr;
output SerialOutput;
output [15:0]ParallelOutput;
supply1 vcc;
supply0 gnd;
wire [15:0]D;
wire [15:0]nQ;
wire [15:0]S,C;

    //RisingEdge_DFlipFlop(q,q1,d,c)
    //Multiplexer4to1(O,S,I0,I1,I2,I3)
    //HalfAdder(s,c,x,y)

    //Register Mode Information
    //mode 00 ---> parraller register without shift
    //mode 01 ---> left shift register 
    //mode 10 ---> increase register data by 1
    //mode 11 ---> load data in register

    assign SerialOutput = ParallelOutput[15];

    RisingEdge_DFlipFlop Bit00FF(ParallelOutput[00],nQ[00],D[00],clk,clr);
    RisingEdge_DFlipFlop Bit01FF(ParallelOutput[01],nQ[01],D[01],clk,clr);
    RisingEdge_DFlipFlop Bit02FF(ParallelOutput[02],nQ[02],D[02],clk,clr);
    RisingEdge_DFlipFlop Bit03FF(ParallelOutput[03],nQ[03],D[03],clk,clr);
    RisingEdge_DFlipFlop Bit04FF(ParallelOutput[04],nQ[04],D[04],clk,clr);
    RisingEdge_DFlipFlop Bit05FF(ParallelOutput[05],nQ[05],D[05],clk,clr);
    RisingEdge_DFlipFlop Bit06FF(ParallelOutput[06],nQ[06],D[06],clk,clr);
    RisingEdge_DFlipFlop Bit07FF(ParallelOutput[07],nQ[07],D[07],clk,clr);
    RisingEdge_DFlipFlop Bit08FF(ParallelOutput[08],nQ[08],D[08],clk,clr);
    RisingEdge_DFlipFlop Bit09FF(ParallelOutput[09],nQ[09],D[09],clk,clr);
    RisingEdge_DFlipFlop Bit10FF(ParallelOutput[10],nQ[10],D[10],clk,clr);
    RisingEdge_DFlipFlop Bit11FF(ParallelOutput[11],nQ[11],D[11],clk,clr);
    RisingEdge_DFlipFlop Bit12FF(ParallelOutput[12],nQ[12],D[12],clk,clr);
    RisingEdge_DFlipFlop Bit13FF(ParallelOutput[13],nQ[13],D[13],clk,clr);
    RisingEdge_DFlipFlop Bit14FF(ParallelOutput[14],nQ[14],D[14],clk,clr);
    RisingEdge_DFlipFlop Bit15FF(ParallelOutput[15],nQ[15],D[15],clk,clr);

    Multiplexer4to1 Bit00MP(D[00],RegisterMode,ParallelOutput[00],SerialInput       ,S[00],LoadSignal[00]);
    Multiplexer4to1 Bit01MP(D[01],RegisterMode,ParallelOutput[01],ParallelOutput[00],S[01],LoadSignal[01]);
    Multiplexer4to1 Bit02MP(D[02],RegisterMode,ParallelOutput[02],ParallelOutput[01],S[02],LoadSignal[02]);
    Multiplexer4to1 Bit03MP(D[03],RegisterMode,ParallelOutput[03],ParallelOutput[02],S[03],LoadSignal[03]);
    Multiplexer4to1 Bit04MP(D[04],RegisterMode,ParallelOutput[04],ParallelOutput[03],S[04],LoadSignal[04]);
    Multiplexer4to1 Bit05MP(D[05],RegisterMode,ParallelOutput[05],ParallelOutput[04],S[05],LoadSignal[05]);
    Multiplexer4to1 Bit06MP(D[06],RegisterMode,ParallelOutput[06],ParallelOutput[05],S[06],LoadSignal[06]);
    Multiplexer4to1 Bit07MP(D[07],RegisterMode,ParallelOutput[07],ParallelOutput[06],S[07],LoadSignal[07]);
    Multiplexer4to1 Bit08MP(D[08],RegisterMode,ParallelOutput[08],ParallelOutput[07],S[08],LoadSignal[08]);
    Multiplexer4to1 Bit09MP(D[09],RegisterMode,ParallelOutput[09],ParallelOutput[08],S[09],LoadSignal[09]);
    Multiplexer4to1 Bit10MP(D[10],RegisterMode,ParallelOutput[10],ParallelOutput[09],S[10],LoadSignal[10]);
    Multiplexer4to1 Bit11MP(D[11],RegisterMode,ParallelOutput[11],ParallelOutput[10],S[11],LoadSignal[11]);
    Multiplexer4to1 Bit12MP(D[12],RegisterMode,ParallelOutput[12],ParallelOutput[11],S[12],LoadSignal[12]);
    Multiplexer4to1 Bit13MP(D[13],RegisterMode,ParallelOutput[13],ParallelOutput[12],S[13],LoadSignal[13]);
    Multiplexer4to1 Bit14MP(D[14],RegisterMode,ParallelOutput[14],ParallelOutput[13],S[14],LoadSignal[14]);
    Multiplexer4to1 Bit15MP(D[15],RegisterMode,ParallelOutput[15],ParallelOutput[14],S[15],LoadSignal[15]);

    HalfAdder Bit00HA(S[00],C[00],ParallelOutput[00],vcc );
    HalfAdder Bit01HA(S[01],C[01],ParallelOutput[01],C[00]);
    HalfAdder Bit02HA(S[02],C[02],ParallelOutput[02],C[01]);
    HalfAdder Bit03HA(S[03],C[03],ParallelOutput[03],C[02]);
    HalfAdder Bit04HA(S[04],C[04],ParallelOutput[04],C[03]);
    HalfAdder Bit05HA(S[05],C[05],ParallelOutput[05],C[04]);
    HalfAdder Bit06HA(S[06],C[06],ParallelOutput[06],C[05]);
    HalfAdder Bit07HA(S[07],C[07],ParallelOutput[07],C[06]);
    HalfAdder Bit08HA(S[08],C[08],ParallelOutput[08],C[07]);
    HalfAdder Bit09HA(S[09],C[09],ParallelOutput[09],C[08]);
    HalfAdder Bit10HA(S[10],C[10],ParallelOutput[10],C[09]);
    HalfAdder Bit11HA(S[11],C[11],ParallelOutput[11],C[10]);
    HalfAdder Bit12HA(S[12],C[12],ParallelOutput[12],C[11]);
    HalfAdder Bit13HA(S[13],C[13],ParallelOutput[13],C[12]);
    HalfAdder Bit14HA(S[14],C[14],ParallelOutput[14],C[13]);
    HalfAdder Bit15HA(S[15],C[15],ParallelOutput[15],C[14]);

endmodule