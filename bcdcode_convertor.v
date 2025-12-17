module bcdcode_convertor(
        input clk,rst,
        input[3:0] X,
        input [1:0] sel,
        input B,
        output reg [7:0] bcd_result,
        output reg done);
        
         reg [3:0] r;
         reg [3:0] q;
        always @(posedge clk or posedge rst) begin    
                if(rst) begin 
                    bcd_result <= 0;
                    done <= 0;
                end
                
                else if(B) begin
                    r = X%10;
                    q = X/10;
                    
                    bcd_result <= {q,r};
                    done <= 1;
                end
                
                else done <=0;
                
         end
         
endmodule
                    
                    