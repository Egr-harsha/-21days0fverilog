module day6_tb ();

  // Write your Testbench here...
  reg clk;
  reg reset;
  reg x_i;
  wire [3:0] sr_o;
  
  day6 dut(.*);
  
  initial clk=1'b1;
  always#5 clk=~clk;
  
  initial begin
    reset = 1;
    x_i = 0;
    @(posedge clk);
  
    reset = 0;
    x_i = 1;
    @(posedge clk);
    
    x_i = 0;
    @(posedge clk);
    
    x_i = 1;
    @(posedge clk);
    
    x_i = 0;
    @(posedge clk);
    
    #100
    $finish();
  end

endmodule
