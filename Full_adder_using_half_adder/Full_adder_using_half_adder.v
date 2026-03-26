module half_adder(a, b, sum, carry);
input a, b;
output sum, carry;

xor x1 (sum, a, b);
and a1 (carry, a, b);

endmodule


module full_adder(a, b, cin, sum, cout);

input a, b, cin;
output sum, cout;

wire s1, c1, c2;

half_adder HA1(a, b, s1, c1);
half_adder HA2(s1, cin, sum, c2);

or o1 (cout, c1, c2);

endmodule
