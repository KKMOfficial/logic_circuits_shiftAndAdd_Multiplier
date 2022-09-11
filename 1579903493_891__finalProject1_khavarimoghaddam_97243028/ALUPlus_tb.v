module ALUPlus_tb;
    reg [15:0] X,Y;
    wire [15:0] Z;
    wire ofs;
    //ALUPlus(X,Y,Z,ofs);
    ALUPlus alu1(Z,ofs,X,Y);

    initial
    begin
      X=8'b10000000;
      Y=8'b10000001;
      #100;

      X=8'b10101010;
      Y=8'b01010101;
      #100;

      X=8'b00001000;
      Y=8'b10001010;
      #100;
    end


endmodule