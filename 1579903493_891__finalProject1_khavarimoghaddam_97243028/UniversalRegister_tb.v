module UniversalRegister_tb;
wire [7:0]ParallelOutput;
wire SerialOutput;
reg [7:0]LoadSignal;
reg [1:0]RegisterMode;
reg SerialInput;
reg clk;
UniversalRegister testInstance(SerialOutput , ParallelOutput , LoadSignal, RegisterMode, SerialInput, clk);
always
begin
  #50; clk = 0; #50; clk = 1;
end

initial
begin
  LoadSignal = 8'b10001001;
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