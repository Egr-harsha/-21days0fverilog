module tb_alternate_1s_0s();


    // Inputs to the DUT (Device Under Test)
    reg clk;
    reg reset;
    reg x_i;

    // Output from the DUT
    wire y_o;

    // Instantiate the DUT
    alternate_1s_0s dut (
        .clk(clk),
        .reset(reset),
        .x_i(x_i),
        .y_o(y_o)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        x_i = 0;

        // Apply reset
        #10;
        reset = 0;

        // Apply test vectors
        // Pattern: 0 1 0 1 1 0 0 1 1
        @(posedge clk);
         x_i = 0; // Expect y_o = 0 (no '1's yet)
        @(posedge clk);
        
        x_i = 1; // Expect y_o = 0 (1 '1' detected)
        @(posedge clk);
        x_i = 0; // Expect y_o = 0 (1 '1' still within 3 samples)
        @(posedge clk);
         x_i = 1; // Expect y_o = 1 (second '1' within 3 samples)
        @(posedge clk);
        x_i = 1; // Expect y_o = 1 (three '1's within 3 samples)
        @(posedge clk); x_i = 0; // Expect y_o = 1 (two '1's still within 3 samples)
        @(posedge clk); x_i = 0; // Expect y_o = 0 (only one '1' left in the last 3 samples)
        @(posedge clk); x_i = 1; // Expect y_o = 1 (second '1' detected within 3 samples)
        @(posedge clk); x_i = 1; // Expect y_o = 1 (two '1's within 3 samples)

        // Finish simulation
        #10;
        $stop;
    end

    // Monitor changes to inputs and outputs
    initial begin
        $monitor("Time = %0dns, clk = %b, reset = %b, x_i = %b, y_o = %b", 
                 $time, clk, reset, x_i, y_o);
    end

endmodule
