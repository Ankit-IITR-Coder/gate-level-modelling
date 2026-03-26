module full_adder(a, b, cin, sum, cout);
  
input a, b, cin;
output sum, cout;

wire s1, c1, c2;

xor x1 (s1, a, b);
and a1 (c1, a, b);

xor x2 (sum, s1, cin);
and a2 (c2, s1, cin);

or  o1 (cout, c1, c2);

endmodule



module half_adder(a, b, sum, carry);

input a, b;
output sum, carry;

full_adder FA1(a, b, 1'b0, sum, carry);

endmodule
