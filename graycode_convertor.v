module graycode_convertor(
       
       input clk,rst,
       input [3:0] X,
       input G,
       output reg [3:0]gray_result,
       output reg done);
       
       always @(posedge clk or posedge rst) begin
            if(rst) begin
                gray_result <= 0;
                done <= 0;
            end
            
            else if(G) begin
                    gray_result <= {X[3],X[3]^X[2],X[2]^X[1],X[1]^X[0]};
                    done <= 1;
            end
            else
                done <= 0;
                
       end
endmodule