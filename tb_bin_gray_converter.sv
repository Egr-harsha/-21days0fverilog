module day9_tb ();
	parameter VEC_W = 6;
  // Write your Testbench here...
  logic [VEC_W-1:0] bin_i;
  logic [VEC_W-1:0] gray_o;
  logic [VEC_W-1:0] gray;
  
  day9 #(VEC_W) dut(.*);
  
  initial begin
    for(int i=0; i< 2**VEC_W; i=i+1) begin
      bin_i = i;
    	#5;
  	end
  $finish();
  end
endmodule
