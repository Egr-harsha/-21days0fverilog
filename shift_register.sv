// Simple shift register
module day6(
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,      // Serial input

  output    wire[3:0]   sr_o
);

  // Write your logic here...
  reg [3:0] sr_1;
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        sr_1 <= 4'h0;
      else
        sr_1 <= {sr_1[2:0],x_i};
    end
  assign sr_o = sr_1;

endmodule
