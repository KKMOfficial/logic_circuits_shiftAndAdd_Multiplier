module ERegister(ops,Q,lds,L,clk,sis,ebl);
    //RIGHT SHIFT REGISTER
    wire [7:0] D;
    input [7:0] L;
    input lds;//load signal
    wire [7:0] nQ;
    output [7:0] Q;
    input clk,sis;//sis serial in signal
    output ops;//output signal is Q0
    input ebl;//enable signal
    wire fclk;//final clock signal after checking enable

    and and_0(fclk, clk , ebl);

    //RisingEdge_DFlipFlop(q,nq,d,c);
    RisingEdge_DFlipFlop Q7BIT(Q[7],nQ[7],D[7],fclk);
    RisingEdge_DFlipFlop Q6BIT(Q[6],nQ[6],D[6],fclk);
    RisingEdge_DFlipFlop Q5BIT(Q[5],nQ[5],D[5],fclk);
    RisingEdge_DFlipFlop Q4BIT(Q[4],nQ[4],D[4],fclk);
    RisingEdge_DFlipFlop Q3BIT(Q[3],nQ[3],D[3],fclk);
    RisingEdge_DFlipFlop Q2BIT(Q[2],nQ[2],D[2],fclk);
    RisingEdge_DFlipFlop Q1BIT(Q[1],nQ[1],D[1],fclk);
    RisingEdge_DFlipFlop Q0BIT(ops ,nQ[0],D[0],fclk);

    //multiplexer2to1(Out,I0, I1, S)
    multiplexer2to1 MULTQ7(D[7],sis , L[7], lds);
    multiplexer2to1 MULTQ6(D[6],Q[7], L[6], lds);
    multiplexer2to1 MULTQ5(D[5],Q[6], L[5], lds);
    multiplexer2to1 MULTQ4(D[4],Q[5], L[4], lds);
    multiplexer2to1 MULTQ3(D[3],Q[4], L[3], lds);
    multiplexer2to1 MULTQ2(D[2],Q[3], L[2], lds);
    multiplexer2to1 MULTQ1(D[1],Q[2], L[1], lds);
    multiplexer2to1 MULTQ0(D[0],Q[1], L[0], lds);

    //assign sis to Q0
    assign Q[0] = ops;

endmodule