module tb_pulse_generation ();
    logic   clk;
    logic   rstn;
    logic   pulse_o;

    pulse_generation pulse_gen(
        .clk        (clk),
        .rstn       (rstn),
        .pulse_o    (pulse_o)
    );

    initial clk = 1'b1;
    always #5 clk = !clk;

    initial begin

        rstn <= 1'b0;
        @(posedge clk);

        rstn <= 1'b1;
        
        #200;
        $finish();
    end


endmodule
