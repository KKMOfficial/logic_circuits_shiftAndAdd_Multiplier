module EBitCounter(rst,clk,state,X,PP,in,sign_set,sign_change);
    input rst,clk;
    output [3:0] state;
    output [1:0] X,PP;
    input in;
    output sign_set;
    output sign_change;
    wire [3:0]Q,nQ,D;
    wire res,nin;
    wire and_d0_1_w,and_d0_2_w,and_d1_1_w,and_d1_2_w,and_d1_3_w,and_d2_1_w,and_d2_2_w,and_d2_3_w,and_d3_1_w,and_d3_2_w,and_d3_3_w;
    wire and_X0_1_w,and_X0_2_w,and_X0_3_w;
    wire and_PP_1_w,and_PP_2_w,and_PP_3_w,nor_PP_1_w;


    RisingEdge_DFlipFlop Q3BIT(Q[3],nQ[3],D[3],clk,rst);
    RisingEdge_DFlipFlop Q2BIT(Q[2],nQ[2],D[2],clk,rst);
    RisingEdge_DFlipFlop Q1BIT(Q[1],nQ[1],D[1],clk,rst);
    RisingEdge_DFlipFlop Q0BIT(Q[0],nQ[0],D[0],clk,rst);

    //nrst
    not nrst_not(nrst, rst);
    not in_not(nin , in);

    //D3
    and and_d3_1(and_d3_1_w,nrst,Q[3]);
    and and_d3_2(and_d3_2_w,nrst,Q[0],Q[1],Q[2]);
    or or_d3_1(D[3],and_d3_1_w,and_d3_2_w);

    //D2
    and and_d2_1(and_d2_1_w,nrst,Q[2],nQ[1]);
    and and_d2_2(and_d2_2_w,nrst,Q[0],Q[1],nQ[2],nQ[3]);
    and and_d2_3(and_d2_3_w,nrst,Q[2],nQ[0]);
    or or_d2_1(D[2],and_d2_1_w,and_d2_2_w,and_d2_3_w);

    //D1
    and and_d1_1(and_d1_1_w,nrst,nQ[0],Q[1]);
    and and_d1_2(and_d1_2_w,nrst,Q[0],nQ[1]);
    and and_d1_3(and_d1_3_w,nrst,Q[3],Q[1]);
    or or_d1_1(D[1],and_d1_1_w,and_d1_2_w,and_d1_3_w);

    //D0
    and and_d0_1(and_d0_1_w,nrst,nQ[0]);
    and and_d0_2(and_d0_2_w,nrst,Q[1],Q[3]);
    or or_d0_1(D[0],and_d0_1_w,and_d0_2_w);

    //X
    and and_X1_1(X[1] , nrst , nQ[0] , nQ[1], nQ[2], nQ[3]);


    and and_X0_1(and_X0_1_w , nrst , nQ[3]);
    and and_X0_2(and_X0_2_w , nrst ,  nQ[0] ,  nQ[1]);
    and and_X0_3(and_X0_3_w , nrst ,  Q[1] , nQ[3]);
    or or_X1(X[0] , and_X0_1_w ,and_X0_2_w);

    //PP
    and and_PP_1(and_PP_1_w , nQ[0] ,  Q[1] , nQ[2] , Q[3]);
    and and_PP_2(and_PP_2_w ,  Q[0] , nQ[1] , nQ[2] ,nQ[3]);
    and and_PP_3(and_PP_3_w , nQ[0] , nQ[1] , nQ[2] ,nQ[3]);
    nor nor_PP_1(nor_PP_1_w , and_PP_1_w,and_PP_3_w);
    and and_PP_4(PP[0] , nor_PP_1_w , in);

    //sign
    and and_sign_1(sign_set ,  nQ[0] , nQ[1] , nQ[2] ,nQ[3]);
    and and_sign_2(sign_change , Q[3] , nQ[2] , Q[1] , Q[0]);

    assign PP[1] = PP[0];



    //state
    assign state[0] = Q[0];
    assign state[1] = Q[1];
    assign state[2] = Q[2];
    assign state[3] = Q[3];

endmodule
