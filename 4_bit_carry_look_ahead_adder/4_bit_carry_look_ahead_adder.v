module carry_look_ahead_adder_4bit(a, b, cin, sum, cout);

input  [3:0] a, b;
input  cin;
output [3:0] sum;
output cout;

wire [3:0] p, g;
wire c1, c2, c3;

/* Propagate and Generate */
xor x1 (p[0], a[0], b[0]);
xor x2 (p[1], a[1], b[1]);
xor x3 (p[2], a[2], b[2]);
xor x4 (p[3], a[3], b[3]);

and a1 (g[0], a[0], b[0]);
and a2 (g[1], a[1], b[1]);
and a3 (g[2], a[2], b[2]);
and a4 (g[3], a[3], b[3]);

/* Carry Equations */
wire t1, t2, t3, t4, t5, t6, t7, t8, t9;

and a5 (t1, p[0], cin);
or  o1 (c1, g[0], t1);

and a6 (t2, p[1], g[0]);
and a7 (t3, p[1], p[0], cin);
or  o2 (c2, g[1], t2, t3);

and a8  (t4, p[2], g[1]);
and a9  (t5, p[2], p[1], g[0]);
and a10 (t6, p[2], p[1], p[0], cin);
or  o3  (c3, g[2], t4, t5, t6);

and a11 (t7, p[3], g[2]);
and a12 (t8, p[3], p[2], g[1]);
and a13 (t9, p[3], p[2], p[1], g[0]);
wire t10;
and a14 (t10, p[3], p[2], p[1], p[0], cin);
or  o4  (cout, g[3], t7, t8, t9, t10);

/* Sum */
xor s1 (sum[0], p[0], cin);
xor s2 (sum[1], p[1], c1);
xor s3 (sum[2], p[2], c2);
xor s4 (sum[3], p[3], c3);

endmodule
