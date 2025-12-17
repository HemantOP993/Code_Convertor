module datapath(
        input clk,rst,
        input [3:0] in,
        input [1:0] sel,
        input ldA,ldR,G,B,E,
        output done,
        output [7:0] Result,
        output [3:0] X,
        output [3:0] gray_result,
        output [7:0] bcd_result,
        output [7:0] ER,
        output done_gray,
        output done_bcd,
        output done_excess3);
        
//        wire [3:0] X;
//        wire [3:0] gray_resut;
//        wire [7:0] bcd_result;
//        wire [7:0] Excees3_result;

//        wire done_gray;
//        wire done_bcd;
//        wire done_excess3;
        
        // assign done = done_gray | done_bcd | done_excess3;
        wire [7:0] bcd_result1;
        loadreg mod1(clk,rst,in,ldA,X);
        graycode_convertor mod2(clk,rst,X,G,gray_result,done_gray);
        bcdcode_convertor mod3(clk,rst,X,sel,B,bcd_result,done_bcd);
        Excees3code_convertor mod4(clk,rst,X,E,ER,done_excess3);
        loadResult mod5(clk,rst,sel,ldR,gray_result,bcd_result,ER,Result);
        
endmodule