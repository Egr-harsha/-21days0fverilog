module tb();
  logic	[7:0] i_a;
  logic	[7:0] i_b;
  logic	 	  i_sel;
  logic	[7:0] o_y;
  
  mux_21	#() dut(.*);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
  initial begin
    for(int i=0;i<10;i++) begin
      i_a = $urandom_range(0,8'hff);
      i_b = $urandom_range(0,8'hff);
      i_sel= $random%2;
      #10;
    end
    $finish(); 
  end
endmodule
