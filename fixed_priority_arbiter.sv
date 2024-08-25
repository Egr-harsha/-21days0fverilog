// Priority arbiter
// port[3] - highest priority

module day14 #(
  parameter NUM_PORTS = 4
)(
    input       wire[NUM_PORTS-1:0] req_i,
    output      wire[NUM_PORTS-1:0] gnt_o   // One-hot grant signal
);

  // Write your logic here...
  assign gnt_o[NUM_PORTS-1] = req_i[NUM_PORTS-1];

  genvar i;
  for (i=NUM_PORTS-2; i>=0; i=i-1) begin
    assign gnt_o[i] = req_i[i] & ~(|gnt_o[NUM_PORTS-1:i+1]);
  end

endmodule
