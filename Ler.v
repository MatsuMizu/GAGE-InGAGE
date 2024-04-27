module leader_generator (t, l);
    input [4:0] t;
    output [1:0] l;
    wire common1 = ~t[2] & t[0];
    wire common2 = t[4] & ~t[2];
    assign l[1] = ~t[3] & (t[4] & t[2] & (~t[1] | t[0]) | ~t[4] & common1) | t[3] & (common2 | ~t[0]) | t[1] & (~t[4] & t[2] | common1 | common2);
    assign l[0] = t[0];
endmodule