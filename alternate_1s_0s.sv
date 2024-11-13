// Design the FSM to detect alternate 1's and 0's present in the last 3 samples.
// The RTL is Vivado Lint Free and Synthesizable.

module alternate_1s_0s(
    input logic clk,
    input logic reset,
    
    input wire x_i,
    
    output logic y_o
    );
    
    typedef enum logic [1:0] {
    A,
    B,
    C,
    D} fsm;
    
    fsm state , next_state;
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            state <= A;
        else 
            state <= next_state;
    end
    
    always_comb begin
        y_o          = 1'b0;
        case (state)
            A: begin
                if(x_i) begin
                   next_state   = B;
                end
                else begin 
                   next_state   = A; 
                end
                
            end
            
            B: begin
                if(x_i) begin
                   next_state   = D;
                    
                end
                else begin 
                   next_state   = C;
                   y_o          = 1'b1;
                end
                
            end
            
            C: begin
                if(x_i) begin
                   next_state   = B;
                   y_o          = 1'b1; 
                end
                else begin 
                   next_state   = A;
                   
                end
                
             end
            
            D: begin
                if(x_i) begin
                   next_state   = D;
                    
                end
                else begin 
                   next_state   = C;
                   
                end
                
             end
    endcase
    end
endmodule
