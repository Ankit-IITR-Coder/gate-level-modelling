module tb_tristate_buffer_8bit;

reg  [7:0] a;
reg  en;
wire [7:0] y;

tristate_buffer_8bit DUT(a, en, y);

initial begin
  a=8'b10101010; en=0;   // ZZZZZZZZ
  #10 en=1;              // Output = 10101010
  #10 a=8'b11110000;     // Output = 11110000
  #10 en=0;              // ZZZZZZZZ
  #10 $finish;
end

endmodule
