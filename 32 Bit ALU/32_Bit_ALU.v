module ALU (in1, in2, control, out, zero, neg);

// Port Declaration
input  [31:0] in1;
input  [31:0] in2;
input  [3:0]  control;
output [31:0] out;
output        zero;
output        neg;

// Internal Registers
reg [31:0] acc;
reg zero_reg;
reg neg_reg;

// ALU Logic
always @(*) begin
    case (control)

        4'b0000: acc = in1 + in2;                         // ADD

        4'b1000: acc = in1 - in2;                         // SUB

        4'b1001: acc = $signed(in1) - $signed(in2);       // SIGNED SUB

        4'b0001: acc = in1 << in2[4:0];                   // SLL

        4'b0010: begin                                    // SLT
            acc = 32'b0;
            acc[0] = ($signed(in1) < $signed(in2));
        end

        4'b0011: begin                                    // SLTU
            acc = 32'b0;
            acc[0] = (in1 < in2);
        end

        4'b0100: acc = in1 ^ in2;                         // XOR

        4'b0101: acc = in1 >> in2[4:0];                   // SRL

        4'b1101: acc = $signed(in1) >>> in2[4:0];         // SRA

        4'b0110: acc = in1 | in2;                         // OR

        4'b0111: acc = in1 & in2;                         // AND

        default: acc = 32'b0;

    endcase

    zero_reg = (acc == 32'b0);
    neg_reg  = acc[31];

end

// Output Assignment
assign out  = acc;
assign zero = zero_reg;
assign neg  = neg_reg;

endmodule
