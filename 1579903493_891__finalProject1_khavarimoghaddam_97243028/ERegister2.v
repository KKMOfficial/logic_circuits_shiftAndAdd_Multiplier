module ERegister2(ops,Q,lds,L,clk,sis,ebl);
    //LEFT SHIFT REGISTER
    wire [15:0] D;
    input [15:0] L;
    input lds;//load signal
    wire [15:0] nQ;
    output [15:0] Q;
    input clk,sis;
    output ops;//output signal is Q0
    input ebl;//enable signal
    wire fclk;//final clock signal after checking enable

    and and_0(fclk, clk , ebl);
    assign Q[15] = ops;

    //RisingEdge_DFlipFlop(q,nq,d,c,rst);
    RisingEdge_DFlipFlop Q15BIT(ops  ,nQ[15],D[15],fclk);
    RisingEdge_DFlipFlop Q14BIT(Q[14],nQ[14],D[14],fclk);
    RisingEdge_DFlipFlop Q13BIT(Q[13],nQ[13],D[13],fclk);
    RisingEdge_DFlipFlop Q12BIT(Q[12],nQ[12],D[12],fclk);
    RisingEdge_DFlipFlop Q11BIT(Q[11],nQ[11],D[11],fclk);
    RisingEdge_DFlipFlop Q10BIT(Q[10],nQ[10],D[10],fclk);
    RisingEdge_DFlipFlop Q9BIT (Q[9], nQ[9], D[9], fclk);
    RisingEdge_DFlipFlop Q8BIT (Q[8], nQ[8], D[8], fclk);
    RisingEdge_DFlipFlop Q7BIT (Q[7], nQ[7], D[7], fclk);
    RisingEdge_DFlipFlop Q6BIT (Q[6], nQ[6], D[6], fclk);
    RisingEdge_DFlipFlop Q5BIT (Q[5], nQ[5], D[5], fclk);
    RisingEdge_DFlipFlop Q4BIT (Q[4], nQ[4], D[4], fclk);
    RisingEdge_DFlipFlop Q3BIT (Q[3], nQ[3], D[3], fclk);
    RisingEdge_DFlipFlop Q2BIT (Q[2], nQ[2], D[2], fclk);
    RisingEdge_DFlipFlop Q1BIT (Q[1], nQ[1], D[1], fclk);
    RisingEdge_DFlipFlop Q0BIT (Q[0], nQ[0], D[0], fclk);

    //multiplexer2to1(Out,I0, I1, S)
    multiplexer2to1 MULTQ15(D[15] ,Q[14], L[15], lds);
    multiplexer2to1 MULTQ14(D[14] ,Q[13], L[14], lds);
    multiplexer2to1 MULTQ13(D[13] ,Q[12], L[13], lds);
    multiplexer2to1 MULTQ12(D[12] ,Q[11], L[12], lds);
    multiplexer2to1 MULTQ11(D[11] ,Q[10], L[11], lds);
    multiplexer2to1 MULTQ10(D[10] ,Q[9],  L[10], lds);
    multiplexer2to1 MULTQ9 (D[9]  ,Q[8],  L[9],  lds);
    multiplexer2to1 MULTQ8 (D[8]  ,Q[7],  L[8],  lds);
    multiplexer2to1 MULTQ7 (D[7]  ,Q[6],  L[7],  lds);
    multiplexer2to1 MULTQ6 (D[6]  ,Q[5],  L[6],  lds);
    multiplexer2to1 MULTQ5 (D[5]  ,Q[4],  L[5],  lds);
    multiplexer2to1 MULTQ4 (D[4]  ,Q[3],  L[4],  lds);
    multiplexer2to1 MULTQ3 (D[3]  ,Q[2],  L[3],  lds);
    multiplexer2to1 MULTQ2 (D[2]  ,Q[1],  L[2],  lds);
    multiplexer2to1 MULTQ1 (D[1]  ,Q[0],  L[1],  lds);
    multiplexer2to1 MULTQ0 (D[0]  ,sis ,  L[0],  lds);

    

endmodule