`timescale 1ns / 1ps

module display_master(
    input clk,
    input [31:0] total,
    input reset,
    output CA,
    output CB,
    output CC,
    output CD,
    output CE,
    output CF,
    output CG,
    output reg [3:0] AN
    );
    reg clk_blk;
    reg [17:0] clk_blk_inc;
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            clk_blk_inc<=0;
            clk_blk<=1'b0;
        end else if(clk_blk_inc==16'b1100_0011_0101_0000)begin//50,000  1100_0011_0101_0000
            clk_blk_inc<=16'b0000_0000_0000_0000;
            clk_blk<=!clk_blk;
        end else clk_blk_inc <= clk_blk_inc + 1; 
    end
    
    reg[1:0] cl;
    always @(negedge clk_blk or posedge reset) begin
        if(reset) begin
            AN[3:0]<=4'b1111;
            cl<=0;
        end else if(cl==0)begin
            AN[3:0]<=4'b1110;
            cl<=cl+1;
        end else if(cl==1) begin
            AN[3:0]<=4'b1101;
            cl<=cl+1;
        end else if(cl==2) begin
            AN[3:0]<=4'b1011;
            cl<=cl+1;
        end else if(cl==3)  begin
            AN[3:0]<=4'b0111;
            cl<=0;
        end
    end
    
    wire [3:0] thousand=total/1000; 
    wire [3:0] hundred=(total-(thousand*1000))/100;
    wire [3:0] ten=(total-hundred*100-thousand*1000)/10;
    wire [3:0] one=total-hundred*100-thousand*1000-ten*10;
    display di(AN,one,ten,hundred,thousand,CA,CB,CC,CD,CE,CF,CG);
endmodule
