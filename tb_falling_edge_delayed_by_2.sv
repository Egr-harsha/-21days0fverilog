module tb_falling_edge_delayed_by_2();
  // Signals
  logic clk;   
  logic rst;
  logic x_i;
  logic y_o;

  // Instantiate the DUT (Device Under Test)
  falling_edge_delayed_by_2 dut (
    .clk(clk),
    .rst(rst),
    .x_i(x_i),
    .y_o(y_o)
  );

  initial clk = 1'b1;
  always #5 clk = !clk;
  // Stimulus Process
  initial begin
    // Initialize signals
    rst <= 1'b1;
    x_i <= 1'b0;
    
   @(posedge clk);
    rst <= 1'b0;  // De-assert reset after some time
    @(posedge clk);
    x_i <= 1'b1;  // Change x_i
    @(posedge clk);
    x_i <= 1'b1;  
    @(posedge clk);
    x_i <= 1'b1;
    @(posedge clk);
    x_i <= 1'b1;
    @(posedge clk);
    x_i <= 1'b0;

    // Observe output changes
    #50 $finish;
  end
endmodule
