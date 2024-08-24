// Detecting a big sequence - 1110_1101_1011
module day12 (
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,

  output    wire        det_o
);

  // Write your logic here...
  logic [11:0] shift_reg;
  localparam SEQUENCE = 12'b1110_1101_1011;
  
  always_ff@(posedge clk,posedge reset) begin
    if(reset) begin
      shift_reg <= SEQUENCE;
    end
    else 
      shift_reg <= {shift_reg[10:0],x_i};
  end
  
  assign det_o = (SEQUENCE == shift_reg) ? 1'b1 : 1'b0;

endmodule
