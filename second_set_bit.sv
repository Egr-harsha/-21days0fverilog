// Find second bit set from LSB for a N-bit vector

module day21 #(
  parameter WIDTH = 12
)(
  input       wire [WIDTH-1:0]  vec_i,
  output reg  [WIDTH-1:0]  second_bit_o
);

  // Internal signals
  integer i;
  reg first_found;
  reg second_set_flag;
  reg [WIDTH-1:0] sec_bin_pos;

  always_comb begin
    first_found = 1'b0;
    second_set_flag = 1'b0;
    sec_bin_pos = 0;
    second_bit_o = 0;  
    // Initialize output to avoid latches

    for (i = 0; i < WIDTH && ~second_set_flag; i = i + 1) begin
      if (vec_i[i]) begin
        if (first_found) begin
          sec_bin_pos = i;
          second_set_flag = 1'b1; // Stop the loop after finding the second set bit
        end else begin
          first_found = 1'b1;
        end
      end
    end
    
    // After the loop, if the second set bit was found, generate the one-hot output
    if (second_set_flag) begin
      second_bit_o = (1'b1 << sec_bin_pos);
    end
  end

endmodule
