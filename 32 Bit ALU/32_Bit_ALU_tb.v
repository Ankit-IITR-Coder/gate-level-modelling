`timescale 1ns/1ps

module ALU_tb;

// Declare inputs as reg
reg [31:0] in1;
reg [31:0] in2;
reg [3:0] control;

// Declare outputs as wire
wire [31:0] out;
wire zero;
wire neg;

// Instantiate ALU
ALU uut (in1, in2, control, out, zero, neg);

initial begin

    $display("Ctrl | in1 | in2 | out | zero | neg");

    // ADD
    in1 = 10; in2 = 3; control = 4'b0000;
    #10 $display("ADD  | %d | %d | %d | %b | %b", in1, in2, out, zero, neg);

    // SUB
    in1 = 10; in2 = 3; control = 4'b1000;
    #10 $display("SUB  | %d | %d | %d | %b | %b", in1, in2, out, zero, neg);

    // SLL
    in1 = 10; in2 = 2; control = 4'b0001;
    #10 $display("SLL  | %d | %d | %d | %b | %b", in1, in2, out, zero, neg);

    // XOR
    in1 = 10; in2 = 3; control = 4'b0100;
    #10 $display("XOR  | %d | %d | %d | %b | %b", in1, in2, out, zero, neg);

    // OR
    in1 = 10; in2 = 3; control = 4'b0110;
    #10 $display("OR   | %d | %d | %d | %b | %b", in1, in2, out, zero, neg);

    // AND
    in1 = 10; in2 = 3; control = 4'b0111;
    #10 $display("AND  | %d | %d | %d | %b | %b", in1, in2, out, zero, neg);

    // ZERO CHECK
    in1 = 5; in2 = 5; control = 4'b1000;
    #10 $display("ZERO | %d | %d | %d | %b | %b", in1, in2, out, zero, neg);

    $finish;

end

endmodule
