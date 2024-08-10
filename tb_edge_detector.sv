  // Simple edge detector TB

module day3_tb ();

  // Write your Testbench here...
  reg clk;
  reg reset;
  reg a_i;
  wire rising_edge_o;
  wire falling_edge_o;
  
  day3 dut(.*);
  
  initial clk=1;
  always#5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end

  
  initial begin
    reset <= 1'b1;
    a_i <= 1'b1;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    for (int i=0; i<32; i++) begin
      a_i <= $random%2;
      @(posedge clk);
    end
    $finish();
  end

endmodule
