// An edge detector

module day3 (
  input     wire    clk,
  input     wire    reset,

  input     wire    a_i,

  output    wire    rising_edge_o,
  output    wire    falling_edge_o
);

  logic  a_f;
  // Write your logic here...
  always@(posedge clk,posedge reset)
    begin
      if(reset)
        a_f <= 0;
      else 
        a_f <= a_i;
     end
  // rising edge detector
  assign rising_edge_o = ~a_f & a_i;
  
  // falling edge detector
  assign falling_edge_o = a_f & ~a_i;
  
  
endmodule
