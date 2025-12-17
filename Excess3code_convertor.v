module Excees3code_convertor(
        input clk,rst,
        input [3:0] X,
        input E,
        output reg [7:0] Excess_result,
        output reg done);
        
        reg [7:0] bcd;
        reg [3:0] r;
        reg [3:0] q;
        always @(posedge clk or posedge rst) begin
            if(rst) begin 
                Excess_result = 0;
                done = 0;
                bcd = 0;
            end
            
            else if(E) begin
                 r = X%10;
                 q = X/10;
                 bcd = {q,r};
                 Excess_result = bcd+(8'b00110011);
                 done = 1;
            end
            else done =0;
        end
        
endmodule