module tb_twos_complement;

    // Testbench signals
    logic clk;
    logic reset;
    logic x_i;
    logic y_o;

    // DUT instantiation
    twos_complement dut (
        .clk(clk),
        .reset(reset),
        .x_i(x_i),
        .y_o(y_o)
    );

    // Clock generation: 10 ns clock period
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 1;
        reset = 0;
        x_i = 0;

        // Apply reset
        reset = 1;
        @(posedge clk); // Wait for one clock edge
        reset = 0;
        @(posedge clk); // Wait for one clock edge

        // Test case 1: Input sequence 0 -> 1 -> 0 -> 1
        x_i = 0; // Input 0
        @(posedge clk);

        x_i = 1; // Input 1
        @(posedge clk);

        x_i = 0; // Input 0
        @(posedge clk);

        x_i = 1; // Input 1
        @(posedge clk);

        // Test case 2: Continuous 0
        x_i = 0; // Input 0
        @(posedge clk);

        x_i = 0; // Input 0
        @(posedge clk);

        // Test case 3: Continuous 1
        x_i = 1; // Input 1
        @(posedge clk);

        x_i = 1; // Input 1
        @(posedge clk);

        // End simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | clk: %b | reset: %b | x_i: %b | y_o: %b", 
                  $time, clk, reset, x_i, y_o);
    end

endmodule
