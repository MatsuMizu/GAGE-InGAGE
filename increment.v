`include "HDL_FLOP.v"

module increment (clk, resetn, t);
    input clk, resetn;
    output [4:0] t;

    wire [4:0] next;
    wire [3:1] carry;

    // attach flipflops
    HDL_FLOP bit0 (.CLOCK (clk), .RESETN (resetn), .D (next [0]), .Q (t[0]));
    HDL_FLOP bit1 (.CLOCK (clk), .RESETN (resetn), .D (next [1]), .Q (t[1]));
    HDL_FLOP bit2 (.CLOCK (clk), .RESETN (resetn), .D (next [2]), .Q (t[2]));
    HDL_FLOP bit3 (.CLOCK (clk), .RESETN (resetn), .D (next [3]), .Q (t[3]));
    HDL_FLOP bit4 (.CLOCK (clk), .RESETN (resetn), .D (next [4]), .Q (t[4]));

    // increment
    assign next[0] = ~t[0];
    assign next[1] = ~t[1] & t[0] | t[1] & ~t[0];
    assign carry[1] = t[1] & t[0];
    assign next[2] = ~t[2] & carry[1] | t[2] & ~carry[1];
    assign carry[2] = t[2] & carry[1];
    assign next[3] = ~t[3] & carry[2] | t[3] & ~carry[2];
    assign carry[3] = t[3] & carry[2];
    assign next[4] = ~t[4] & carry[3] | t[4] & ~carry[3];

endmodule
