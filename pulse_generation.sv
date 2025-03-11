module pulse_generation (
    input   logic   clk,
    input   logic   rstn,
    output  logic   pulse_o
);
    
    logic   [2:0] count_q, nxt_count;
    always_ff @(posedge clk, negedge rstn)
        if(!rstn)
            count_q <= 3'b100;
        else    
            count_q <= nxt_count;    
    
    assign nxt_count = {count_q[0],count_q[2:1]};

    assign pulse_o = count_q[1];
    /*

    logic   [1:0] count_q, nxt_count;

    always_ff @(posedge clk, negedge rstn)
        if(!rstn)
            count_q <= 2'h0;
        else    
            count_q <= nxt_count;

    assign nxt_count = count_q + 2'h1;

    assign pulse_o = count_q[0];

    */

endmodule
