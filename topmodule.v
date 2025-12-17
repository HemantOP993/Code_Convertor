module topmodule(
        input clk,rst,start,
        input [3:0] in,
        input [1:0] sel,
        output [7:0] Result,
        output ldA,ldR,G,B,E,done,Exc_over,
        output [2:0] state,
        output [3:0] X,
        output [3:0] gray_result,
        output [7:0] bcd_result,
        output [7:0] ER,
        output done_gray,
        output done_bcd,
        output done_excess3);
        
        datapath mod1(clk,rst,in,sel,ldA,ldR,G,B,E,
                        done,Result,X,gray_result,
                        bcd_result,ER,
                        done_gray,done_bcd,done_excess3);
                        
        Controller mod2(clk,rst,start,done_gray,done_bcd,done_excess3,sel,ldA,ldR,G,B,E,Exc_over,state);
        
endmodule 
        