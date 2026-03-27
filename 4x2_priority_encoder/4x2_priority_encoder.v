module priority_encoder_4x2(i3, i2, i1, i0, y1, y0, v);

input i3, i2, i1, i0;
output y1, y0, v;

wire ni2;
wire t1;


not n1 (ni2, i2);

/* Y1 = I3 + I2 */
or o1 (y1, i3, i2);

/* Y0 = I3 + (I1 · I2') */
and a1 (t1, i1, ni2);
or  o2 (y0, i3, t1);

/* V = I3 + I2 + I1 + I0 */
or o3 (v, i3, i2, i1, i0);

endmodule
