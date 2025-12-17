module testbench;

        reg clk;
        reg rst;
        reg start;
        reg [3:0] in;
        reg [1:0] sel;
        
        wire [7:0] Result;
        wire ldA;
        wire ldR;
        wire G;
        wire B;
        wire E;
        wire done;
        wire Exc_over;
        wire [2:0] state;
        wire [3:0] X;
        wire [3:0] gray_result;
        wire [7:0] bcd_result;
        wire [7:0] ER;
        wire done_gray;
        wire done_bcd;
        wire done_excess3;
        
        topmodule mod1(clk,rst,start,in,sel,Result,
                        ldA,ldR,G,B,E,done,Exc_over,
                        state,X,gray_result,bcd_result,
                        ER,done_gray,done_bcd,done_excess3);
                        
                        
        always #5 clk = ~clk;
        
        initial begin
            rst=1;clk=0;
            #2 rst=0;
            start =1;
            in = 4'b1101;
            sel = 1;
            #4 start =0;
        end
       
        initial #100 $finish;
        
endmodule
