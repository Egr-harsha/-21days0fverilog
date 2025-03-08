module falling_edge_delayed_by_2(
    input logic clk,
    input logic rst,
    input logic x_i,
    output logic y_o
);

	logic y_q;
	logic y_q1;

	always_ff @(posedge clk)
    if(rst) begin
        y_q  <= 1'b0;
        y_q1 <= 1'b0;
    end
    else begin
        y_q  <= x_i;
       	y_q1 <= y_q;
    end
  
	assign y_o = x_i | y_q | y_q1 ;

endmodule
