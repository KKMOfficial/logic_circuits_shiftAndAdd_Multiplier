module UniversalRegister2_tb;
wire [15:0]ParallelOutput;
wire SerialOutput;
reg [15:0]LoadSignal;
reg [1:0]RegisterMode;
reg SerialInput;
reg clk;
UniversalRegister2 testInstance(SerialOutput , ParallelOutput , LoadSignal, RegisterMode, SerialInput, clk);
always
begin
  #50; clk = 0; #50; clk = 1;
end

initial
begin
  LoadSignal = 16'b1111000010001001;
  RegisterMode = 11;
  SerialInput = 0;
  #200;
  RegisterMode = 10;
  #200;
  RegisterMode = 01;
  #200;
  RegisterMode = 00;
  #200;
end
endmodule