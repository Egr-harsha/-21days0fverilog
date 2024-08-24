module day10_tb ();

  // Write your Testbench here...
  logic clk;
  logic reset;
  logic load_i;
  logic [3:0] load_val_i;
  wire [3:0] count_o;
  
  day10 dut(.*);
  initial clk = 1'b1;
  always #5 clk = ~clk;
  
  initial begin
    reset = 0;
    load_i = 0;
    load_val_i = 4'd0;
    @(posedge clk);
    
    reset = 1;
    load_i = 1;
    load_val_i = $random;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
  
    reset = 1;
    load_i = 0;
    load_val_i = $random;
  end
endmodule
