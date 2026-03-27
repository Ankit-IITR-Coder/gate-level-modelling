module tb_priority_encoder_4x2;

reg i3, i2, i1, i0;
wire y1, y0, v;

priority_encoder_4x2 DUT(i3, i2, i1, i0, y1, y0, v);

initial begin
  i3=0;i2=0;i1=0;i0=0;
  #10 i3=0;i2=0;i1=0;i0=1;
  #10 i3=0;i2=0;i1=1;i0=0;
  #10 i3=0;i2=1;i1=0;i0=0;
  #10 i3=1;i2=0;i1=0;i0=0;
  #10 i3=1;i2=1;i1=1;i0=1;
  #10 $finish;
end

endmodule
