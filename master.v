`timescale 1ns / 1ps

module master(clk,reset,CA,CB,CC,CD,CE,CF,CG,AN,VGA_R,VGA_G,VGA_B,VGA_HS,VGA_VS,bu);
    input clk,reset;
    input [3:0]bu;
    output CA,CB,CC,CD,CE,CF,CG;
    output [3:0]AN;
    output [3:0]VGA_R,VGA_G,VGA_B;
    output VGA_HS,VGA_VS;
    assign VGA_G=0;
    wire random;
    rand ra(clk,reset,random);
    reg ct;
    reg vga_clk;
    always @(negedge clk) begin
        if(reset) begin
            ct<=0;
            vga_clk<=0;
        end else if(ct==1) begin
            ct<=0;
            vga_clk=~vga_clk;
        end else ct<=ct+1;
    end
    //clock divider, 140Hz, for moving arrows
    reg clk_arr;
    reg [18:0] clk_arr_inc;
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            clk_arr_inc<=0;
            clk_arr<=1'b0;
        end else if(clk_arr_inc==19'b1010_1110_0110_0010_110)begin//357,142  1010_1110_0110_0010_110
            clk_arr_inc<= 0;
            clk_arr<=!clk_arr;
        end else  clk_arr_inc <= clk_arr_inc + 1; 
    end
    
    wire up=bu[0];
    wire down=bu[3];
    wire left=bu[1];
    wire right=bu[2];
    reg [2:0]up_d;
    reg [2:0]down_d;
    reg [2:0]left_d;
    reg [2:0]right_d;
    wire [3:0] pressed;
    assign pressed[0]=up_d[1]&~up_d[0];
    assign pressed[1]=down_d[1]&~down_d[0];
    assign pressed[2]=left_d[1]&~left_d[0];
    assign pressed[3]=right_d[1]&~right_d[0];
    always @(posedge clk_arr or posedge reset) begin
        if(reset) begin
            up_d<=0;
            down_d<=0;
            left_d<=0;
            right_d<=0;
        end else begin
            up_d<={up,up_d[2],up_d[1]};
            down_d<={down,down_d[2],down_d[1]};
            left_d<={left,left_d[2],left_d[1]};
            right_d<={right,right_d[2],right_d[1]};
        end
    end    
    
    //clock divider 2Hz, for generating arrows
    reg clk_div;
    reg [24:0] clk_dv_inc;
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            clk_dv_inc<=0;
            clk_div<=1'b0;
        end else if(clk_dv_inc==25'b1011_1110_1011_1100_0010_0000_0)begin//25,000,000  1011_1110_1011_1100_0010_0000_0
            clk_dv_inc<=0;
            clk_div<=!clk_div;
        end else clk_dv_inc <= clk_dv_inc + 1;  
    end
    //decode rand
    reg [1:0]ct_arr;
    reg [1:0] rand_res;
    wire [4:0] arr;
    assign arr[0]=(rand_res==2'b00);
    assign arr[1]=(rand_res==2'b01);
    assign arr[2]=(rand_res==2'b10);
    assign arr[3]=(rand_res==2'b11);
    assign arr[4]=(ct_arr%2==0);//enable
    always@(posedge clk_div or posedge reset) begin  //
        if(reset) begin
            rand_res<=0;
            ct_arr<=0;
        end else begin
            rand_res<={random,rand_res[1]};
            ct_arr<=ct_arr+1;
        end
    end
    
    wire [1:0]score;
    wire update;
    reg [31:0]total;
    vga v(reset,vga_clk,clk_arr,arr,pressed,VGA_R,VGA_G,VGA_B,VGA_HS,VGA_VS,score,update); 
    
    always @(posedge clk_arr or posedge reset) begin
        if(reset) begin
            total<=0;
        end else if(update) begin
            total<=total+score;
        end
    end
    
    display_master dis(clk,total,reset,CA,CB,CC,CD,CE,CF,CG,AN);
endmodule
