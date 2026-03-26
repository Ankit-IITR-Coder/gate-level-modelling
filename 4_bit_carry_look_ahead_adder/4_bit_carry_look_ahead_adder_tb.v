module tb_carry_look_ahead_adder_4bit;

reg  [3:0] a, b;
reg  cin;
wire [3:0] sum;
wire cout;

carry_look_ahead_adder_4bit DUT(a, b, cin, sum, cout);

initial begin
  a=4'b0000; b=4'b0000; cin=0;
  #10 a=4'b0011; b=4'b0101; cin=0;
  #10 a=4'b1111; b=4'b0001; cin=0;
  #10 a=4'b1010; b=4'b0101; cin=1;
  #10 a=4'b1111; b=4'b1111; cin=0;
  #10 $finish;
end

endmodule
