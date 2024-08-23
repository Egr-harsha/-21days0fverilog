module day7_tb ();

  // Write your Testbench here...
  reg clk;
  reg reset;
  wire [3:0] lfsr_o;
  
  day7 dut(.*);
  
  initial clk = 1;
  always#5 clk = ~clk;
  
  initial begin
    reset = 1;
    @(posedge clk);
    
    reset = 0;
    @(posedge clk);
    #100
    $finish();
  end

endmodule
