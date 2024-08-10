// A simple ALU

module day4 #(
  parameter type T	=	logic[7:0],
  parameter type O	=	logic[2:0]
)
  (
  input     T   a_i,
  input     T   b_i,
  input     O   op_i,
  output    T   alu_o
);

  // Write your logic here...
  always_comb begin : ALU_LOGIC
      case(op_i)
        3'b000:alu_o = a_i + b_i;
        3'b001:alu_o = a_i - b_i;
        3'b010:alu_o = b_i << 1;
        3'b011:alu_o = b_i >> 1;
        3'b100:alu_o = a_i & b_i;
        3'b101:alu_o = a_i | b_i;
        3'b110:alu_o = a_i ^ b_i;
        3'b111:alu_o = (a_i == b_i)? 8'b1:8'b0;
      endcase
    end

endmodule
