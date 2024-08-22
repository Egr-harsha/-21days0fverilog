// Simple TB

module day5_tb ();

  // Write your Testbench here...
  reg clk;
  reg reset;
  wire cnt_o;

  day5 dut(.*);
  
  initial clk=1;
  always#5 clk = ~clk;
  
  initial begin
    reset=1;
    @(posedge clk);
    reset=0;
    
    
    #200;
    $finish();
  end
endmodule
