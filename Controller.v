module Controller(
    input clk,rst,
    input start,done_gray,done_bcd,done_excess3,
    input [1:0] sel,
    output reg ldA,ldR,G,B,E,Exc_over,
    output reg [2:0] state);
    
    parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5;
    
    always @(*) begin
        case(state)
             S0: begin
                    ldA=0;ldR=0;G=0;B=0;E=0;Exc_over=0;
             end
             S1: begin
                    ldA=1;ldR=0;G=0;B=0;E=0;Exc_over=0;
             end
             S2: begin
                    ldA=0;ldR=0;Exc_over=0;
                    case(sel)
                        2'b00: begin
                                    G=0;B=0;E=0; // No conversion happen in this state
                        end
                        2'b01: begin
                                    G=1;B=0;E=0; // Gray conversion
                       end
                       2'b10: begin
                                    G=0;B=1;E=0;  // BCD conversion
                       end
                       2'b11: begin
                                 G=0;B=0;E=1;
                         end
                 endcase
              end
              S3: begin
                    ldA=0;ldR=0;Exc_over=0;      // wait for conversion
              end
              
              S4: begin
                    ldA=0;ldR=1;G=0;B=0;E=0;Exc_over=0;  // Store result in this state
              end
              S5: begin
                    ldA=0;ldR=0;G=0;B=0;E=0;Exc_over=1;  // Now exc_over
              end
              
           endcase
              
    end
   
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= S0;
        end
        else begin  
            case(state)
                S0: state <= start ? S1:S0; // Ideal state
                S1: state <= S2;    // load reg
                S2: state <= S3;    // cal which o/p done in this state
                 S3: begin
                    // Wait until current conversion finishes
                    case(sel)
                        2'b01: state <= done_gray ? S4 : S3;
                        2'b10: state <= done_bcd ? S4 : S3;
                        2'b11: state <= (done_excess3) ? S4 : S3;
                        default: state <= S4; // No conversion
                    endcase
                end
                S4: state <= S5;    // load result into output reg
                S5: state <= S0;    // Execution over in this state
               default : state <= S0;  // Remain in Ideal state
            endcase
        end
        
    end
endmodule