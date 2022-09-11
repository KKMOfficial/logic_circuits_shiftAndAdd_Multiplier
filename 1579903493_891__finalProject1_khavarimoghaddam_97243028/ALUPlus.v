module ALUPlus(Z,ofs,X,Y);
//alu that can calculate summation of two 15 bit number
input [15:0] X,Y;
output [15:0] Z;
output ofs;
wire [14:0] COUT;
supply0 gnd;

    //FullAdder(x,y,cin,s,cout);
    FullAdder FA0( X[0] ,Y[0] ,gnd     ,Z[0] ,COUT[0]);
    FullAdder FA1( X[1] ,Y[1] ,COUT[0] ,Z[1] ,COUT[1]);
    FullAdder FA2( X[2] ,Y[2] ,COUT[1] ,Z[2] ,COUT[2]);
    FullAdder FA3( X[3] ,Y[3] ,COUT[2] ,Z[3] ,COUT[3]);
    FullAdder FA4( X[4] ,Y[4] ,COUT[3] ,Z[4] ,COUT[4]);
    FullAdder FA5( X[5] ,Y[5] ,COUT[4] ,Z[5] ,COUT[5]);
    FullAdder FA6( X[6] ,Y[6] ,COUT[5] ,Z[6] ,COUT[6]);
    FullAdder FA7( X[7] ,Y[7] ,COUT[6] ,Z[7] ,COUT[7]);
    FullAdder FA8( X[8] ,Y[8] ,COUT[7] ,Z[8] ,COUT[8]);
    FullAdder FA9( X[9] ,Y[9] ,COUT[8] ,Z[9] ,COUT[9]);
    FullAdder FA10(X[10],Y[10],COUT[9] ,Z[10],COUT[10]);
    FullAdder FA11(X[11],Y[11],COUT[10],Z[11],COUT[11]);
    FullAdder FA12(X[12],Y[12],COUT[11],Z[12],COUT[12]);
    FullAdder FA13(X[13],Y[13],COUT[12],Z[13],COUT[13]);
    FullAdder FA14(X[14],Y[14],COUT[13],Z[14],COUT[14]);
    FullAdder FA15(X[15],Y[15],COUT[14],Z[15],ofs);




endmodule