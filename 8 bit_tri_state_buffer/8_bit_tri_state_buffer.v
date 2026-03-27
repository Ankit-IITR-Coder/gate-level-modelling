module tristate_buffer_8bit(a, en, y);

input  [7:0] a;
input  en;
output [7:0] y;

/* 8 Tri-State Buffers */
bufif1 b0 (y[0], a[0], en);
bufif1 b1 (y[1], a[1], en);
bufif1 b2 (y[2], a[2], en);
bufif1 b3 (y[3], a[3], en);
bufif1 b4 (y[4], a[4], en);
bufif1 b5 (y[5], a[5], en);
bufif1 b6 (y[6], a[6], en);
bufif1 b7 (y[7], a[7], en);

endmodule
