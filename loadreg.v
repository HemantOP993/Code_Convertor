module loadreg(
    input clk,rst,
    input [3:0] in,
    input ldA,
    output reg [3:0] X);
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            X <= 0;
        end 
        else if (ldA) begin
            X <= in;
        end
    end

endmodule