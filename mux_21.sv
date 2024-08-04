module mux_21
  #(parameter	N = 8,
    parameter	type	T = logic[N-1:0])
(
	input	T	i_a,
	input 	T	i_b,
	input		i_sel,
	output	T	o_y
);

assign o_y = i_sel ? i_a : i_b;
endmodule

