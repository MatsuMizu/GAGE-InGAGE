`include "header.v"
`include "increment.v"

module increment_tester ();
    reg clk;
    reg resetn;
    wire [4:0] t;
    integer i;

    initial begin
        // initialite clock
        clk = 1'b1;
        // push reset
        resetn = 1'b0;
        // hold reset and then release it
        #10 resetn = 1'b1;
        i = 0;
    end

    always begin
        #10 clk = ~clk; // next clock phase
    end

    increment module_call (.clk (clk), .resetn (resetn), .t (t));

    always @(negedge clk) begin
        $display ("Moment %d, module output %d", i, t);
        i = i + 1;
        if (i == `num_test) begin
            $display ("No more tests left");
            $finish;
        end
    end

endmodule
