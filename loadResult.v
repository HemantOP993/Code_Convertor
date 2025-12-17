module loadResult(
        input clk,rst,
        input [1:0] sel,
        input ldR,
        input [3:0] gray_result,
        input [7:0] bcd_result,
        input [7:0] Excess3_result,
        output reg [7:0] Result);
        
        always @(posedge clk  or posedge rst) begin
                if(rst) begin
                    Result <= 0;
                end
                
                else if(ldR) begin
                    case(sel)
                       2'b01: Result <= {4'b0000,gray_result};
                       2'b10: Result <= bcd_result;
                       2'b11: Result <= Excess3_result;
                       default: Result <= 0;
                    endcase
                end
       end
endmodule

                       
        