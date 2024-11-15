module twos_complement(
    input logic clk,
    input logic reset,
    
    input logic x_i,
    output logic y_o
    );
    
    typedef enum logic {
    A,
    B} fsm;
    
    fsm state ,next_state;
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            state <= A;
        else
            state <= next_state; 
    end
    
    always_comb begin
        y_o     = 1'b0;
        
        case(state)
            A: begin
                if(x_i) begin
                    next_state  = B;
                    y_o         = 1'b1;   
                end
                else begin
                    next_state   = A;
                end
            end
            
            B: begin
                if(x_i) begin
                    next_state   = B;   
                end
                else begin
                    next_state   = B;
                     y_o     = 1'b1;
                end
            end
            
            default: next_state = A;
            
        endcase
    end
    
endmodule
