// LFSR
module day7 (
  input     wire      clk,
  input     wire      reset,

  output    wire[3:0] lfsr_o
);

  // Write your logic here...
  reg [3:0] lfsr;
  
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        lfsr <= 4'ha;
      else
        lfsr <= {lfsr[2:0],lfsr[3]^lfsr[1]};
    end
  
  assign lfsr_o = lfsr;

endmodule
