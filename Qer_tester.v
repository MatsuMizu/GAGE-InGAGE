`include "Qer.v"

module Qer_tester ();
    reg clk;
    reg [1:0] output_data [0:15];
    reg [3:0] x;
    wire [1:0] Qx;
    integer i;

    initial begin
        // initialize clock
        clk = 1'b0;
        // read output data from a file
        $readmemh ("outputs_Q.txt", output_data);
        // initalize the counter
        i = 0;
    end

    always begin
        #10 clk = ~clk; // next clock phase
    end

    Q module_call (.x (x), .Qx (Qx));

    always @(posedge clk) begin
        x[3] = i / 8;
        x[2] = (i - 8 * x[3]) / 4;
        x[1] = (i - 8 * x[3] - 4 * x[2]) / 2;
        x[0] = (i - 8 * x[3] - 4 * x[2] - 2 * x[1]);
        i = i + 1;
    end

    always @(negedge clk) begin
        $display ("x: %b", x);
        $display ("Qx: %b", Qx);
        if (Qx != output_data [i - 1]) begin
            $display ("Error: inputs %b", x);
            $display ("Module output %b, expected output %b", Qx,
                                                    output_data [i - 1]);
        end
        if (i == 16) begin
            $display ("No more tests left");
            $finish;
        end
    end

endmodule
