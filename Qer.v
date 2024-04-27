module Q(x, Qx);
    input [3:0] x;
    output [1:0] Qx;
    wire common_block = ~x[3] & x[1] | x[3] & ~x[1];
    assign Qx[1] = ~x[2] & common_block | x[2] & (~x[3] & x[0] | x[3] & ~x[0]);
    assign Qx[0] = x[2] & common_block | ~x[2] & (~x[3] & ~x[0] | x[3] & x[0]);
endmodule