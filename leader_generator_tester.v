`include "leader_generator.v"

module Ler_tester ();
    reg clk;
    reg [1:0] output_data [0:31];
    reg [4:0] t;
    wire [1:0] l;
    integer i;

    initial begin
        // initialize clock
        clk = 1'b0;
        // read output data from a file
        $readmemh ("outputs_L.txt", output_data);
        // initalize the counter
        i = 0;
    end

    always begin
        #10 clk = ~clk; // next clock phase
    end

    leader_generator module_call (.t (t), .l (l));

    always @(negedge clk) begin
        t[4] = i / 16;
        t[3] = (i - 16 * t[4])/ 8;
        t[2] = (i - 16 * t[4] - 8 * t[3]) / 4;
        t[1] = (i - 16 * t[4] - 8 * t[3] - 4 * t[2]) / 2;
        t[0] = (i - 16 * t[4] - 8 * t[3] - 4 * t[2] - 2 * t[1]);
        i = i + 1;
    end

    always @(posedge clk) begin
        $display ("i: %b", t);
        $display ("l: %b", l);
        if (l != output_data [i - 1]) begin
            $display ("Error: inputs %b", t);
            $display ("Module output %b, expected output %b", l,
                                                    output_data [i - 1]);
        end
        if (i == 32) begin
            $display ("No more tests left");
            $finish;
        end
    end

endmodule
