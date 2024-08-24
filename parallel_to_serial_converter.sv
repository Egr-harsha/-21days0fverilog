module day11 (
  input     wire      clk,
  input     wire      reset,

  output    wire      empty_o,
  input     wire[3:0] parallel_i,
  
  output    wire      serial_o,
  output    wire      valid_o
);

  // Internal signals
  logic [3:0] shift_reg;
  logic [1:0] count; // 2-bit counter is enough for 4-bit parallel input
  logic empty;
  logic valid;
  logic serial_out;
  
  always_ff @(posedge clk or posedge reset)
  begin
    if (reset) begin
      shift_reg <= 4'h0;
      count     <= 2'd0;  // Initialize count to 0
      empty     <= 1'b1;  // Empty signal should be high on reset
      valid     <= 1'b0;  // Valid signal should be low on reset
      serial_out <= 1'b0; // Initialize serial output to 0
    end 
    else begin
      if (count == 2'd0) begin
        // Load new data when counter is zero
        shift_reg <= parallel_i;
        count     <= 2'd3;  // Start counting from 3 down to 0
        empty     <= 1'b0;
        valid     <= 1'b1;
      end else begin
        // Shift operation
        serial_out <= shift_reg[0];
        shift_reg  <= {1'b0, shift_reg[3:1]};  // Shift right
        count      <= count - 1;
        
        if (count == 2'd1) begin
          empty <= 1'b1;  // Set empty when last bit is about to be shifted out
          valid <= 1'b0;  // Valid goes low when last bit is shifted out
        end
      end
    end
  end
      
  assign empty_o  = empty;
  assign serial_o = serial_out;
  assign valid_o  = valid;

endmodule
