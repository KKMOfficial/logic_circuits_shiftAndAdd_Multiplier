module NotBus(In,Out,ebl);
input [15:0] In;
input ebl;
output [15:0] Out;
xor B0(Out[0], In[0] ,ebl);
xor B1(Out[1], In[1] ,ebl);
xor B2(Out[2], In[2] ,ebl);
xor B3(Out[3], In[3] ,ebl);
xor B4(Out[4], In[4] ,ebl);
xor B5(Out[5], In[5] ,ebl);
xor B6(Out[6], In[6] ,ebl);
xor B7(Out[7], In[7] ,ebl);
xor B8(Out[8], In[8] ,ebl);
xor B9(Out[9], In[9] ,ebl);
xor B10(Out[10],In[10] , ebl);
xor B11(Out[11],In[11] , ebl);
xor B12(Out[12],In[12] , ebl);
xor B13(Out[13],In[13] , ebl);
xor B14(Out[14],In[14] , ebl);
xor B15(Out[15],In[15] , ebl);

endmodule