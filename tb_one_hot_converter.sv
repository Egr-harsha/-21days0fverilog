module day8_tb();

  // Write your Testbench here...
  parameter BIN_W       = 4;
  parameter ONE_HOT_W   = 16;
  
  reg [BIN_W-1:0] bin_i ;
  wire [ONE_HOT_W-1:0] one_hot_o ;
  
  day8 #(BIN_W,ONE_HOT_W) dut(.*);
  
  initial begin
  integer i;
    for(i=0;i<32;i=i+1)
    begin
      bin_i = $urandom_range(0,4'hf);
      #5;
    end
  $finish();
  end

endmodule
