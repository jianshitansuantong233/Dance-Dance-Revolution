`timescale 1ns / 1ps
module vga(reset, vga_clk,clk_arr,arr,pressed,VGA_R,VGA_G,VGA_B,VGA_HS, VGA_VS, score,update );
    input reset,vga_clk,clk_arr;
    input [4:0] arr;
    input [3:0] pressed;
    output reg [3:0]VGA_R;
    output reg [3:0] VGA_B,VGA_G;
    output VGA_HS,VGA_VS;
    output reg [1:0] score;
    output reg update;
    
    wire u_a=arr[0];
    wire d_a=arr[1];
    wire l_a=arr[2];
    wire r_a=arr[3];
    wire enable=arr[4];
    
    wire up=pressed[0];
    wire down=pressed[1];
    wire left=pressed[2];
    wire right=pressed[3];
    reg [9:0] v_counter;
    reg [9:0] h_counter;
    reg [8:0] red_pos[5:0];
    reg [2:0] red_type[5:0];
    integer i;
    reg flag;
    reg [8:0] dis;
    always @(posedge clk_arr or posedge reset) begin
        if(reset) begin
            red_pos[5]<=0;
            red_type[5]<=3'b100;
            red_pos[4]<=0;
            red_type[4]<=3'b100;
            red_pos[3]<=0;
            red_type[3]<=3'b100;
            red_pos[2]<=0;
            red_type[2]<=3'b100;
            red_pos[1]<=0;
            red_type[1]<=3'b100;
            red_pos[0]<=0;
            red_type[0]<=3'b100;
            flag<=0;
        end else begin
            if(enable&&!flag) begin
                flag<=1;
                if(u_a) begin
                    red_pos[5]<=(dis==4) ? 0:(red_pos[4]-(red_pos[4]!=0));
                    red_pos[4]<=(dis==3) ? 0 : red_pos[3]-(red_pos[3]!=0);
                    red_pos[3]<=(dis==2) ? 0:red_pos[2]-(red_pos[2]!=0);
                    red_pos[2]<=(dis==1) ? 0:red_pos[1]-(red_pos[1]!=0);
                    red_pos[1]<=(dis==0) ? 0: red_pos[0]-(red_pos[0]!=0);
                    red_pos[0]<=9'b1101_1001_1;//435
                    red_type[5]<=red_type[4];
                    red_type[4]<=red_type[3];
                    red_type[3]<=red_type[2];
                    red_type[2]<=red_type[1];
                    red_type[1]<=red_type[0];
                    red_type[0]<=2'b00;
                end else if(d_a) begin
                    red_pos[5]<=(dis==4) ? 0:(red_pos[4]-(red_pos[4]!=0));
                    red_pos[4]<=(dis==3) ? 0 : red_pos[3]-(red_pos[3]!=0);
                    red_pos[3]<=(dis==2) ? 0:red_pos[2]-(red_pos[2]!=0);
                    red_pos[2]<=(dis==1) ? 0:red_pos[1]-(red_pos[1]!=0);
                    red_pos[1]<=(dis==0) ? 0: red_pos[0]-(red_pos[0]!=0);
                    red_pos[0]<=9'b1101_1001_1;
                    red_type[5]<=red_type[4];
                    red_type[4]<=red_type[3];
                    red_type[3]<=red_type[2];
                    red_type[2]<=red_type[1];
                    red_type[1]<=red_type[0];
                    red_type[0]<=2'b01;
                end else if(l_a) begin
                    red_pos[5]<=(dis==4) ? 0:(red_pos[4]-(red_pos[4]!=0));
                    red_pos[4]<=(dis==3) ? 0 : red_pos[3]-(red_pos[3]!=0);
                    red_pos[3]<=(dis==2) ? 0:red_pos[2]-(red_pos[2]!=0);
                    red_pos[2]<=(dis==1) ? 0:red_pos[1]-(red_pos[1]!=0);
                    red_pos[1]<=(dis==0) ? 0: red_pos[0]-(red_pos[0]!=0);
                    red_pos[0]<=9'b1101_1001_1;
                    red_type[5]<=red_type[4];
                    red_type[4]<=red_type[3];
                    red_type[3]<=red_type[2];
                    red_type[2]<=red_type[1];
                    red_type[1]<=red_type[0];
                    red_type[0]<=2'b10;
                end else if(r_a) begin
                    red_pos[5]<=(dis==4) ? 0:(red_pos[4]-(red_pos[4]!=0));
                    red_pos[4]<=(dis==3) ? 0 : red_pos[3]-(red_pos[3]!=0);
                    red_pos[3]<=(dis==2) ? 0:red_pos[2]-(red_pos[2]!=0);
                    red_pos[2]<=(dis==1) ? 0:red_pos[1]-(red_pos[1]!=0);
                    red_pos[1]<=(dis==0) ? 0: red_pos[0]-(red_pos[0]!=0);
                    red_pos[0]<=9'b1101_1001_1;
                    red_type[5]<=red_type[4];
                    red_type[4]<=red_type[3];
                    red_type[3]<=red_type[2];
                    red_type[2]<=red_type[1];
                    red_type[1]<=red_type[0];
                    red_type[0]<=2'b11;
                end
            end else begin
                if(!enable) flag<=0;
                red_pos[5]<=(dis==5) ? 0:(red_pos[5]-(red_pos[5]!=0));
                red_pos[4]<=(dis==4) ? 0 : red_pos[4]-(red_pos[4]!=0);
                red_pos[3]<=(dis==3) ? 0:red_pos[3]-(red_pos[3]!=0);
                red_pos[2]<=(dis==2) ? 0:red_pos[2]-(red_pos[2]!=0);
                red_pos[1]<=(dis==1) ? 0: red_pos[1]-(red_pos[1]!=0);
                red_pos[0]<=(dis==0) ? 0:red_pos[0]-(red_pos[0]!=0);
            end
        end
    end
    
    
    reg [5:0] red;
    always @(*) begin
        if(reset) red<=0;
        for(i=0;i<6;i=i+1) begin
            case(red_type[i])
                2'b00 : begin
                    red[i]<=(red_pos[i]!=0)&((h_counter>478&&h_counter<515&&v_counter==-h_counter+514+red_pos[i])|
                (h_counter>513&&h_counter<550&&v_counter==red_pos[i]-514+h_counter)|
                (h_counter>478&&h_counter<505&&v_counter==red_pos[i]+35)|
                (h_counter>523&&h_counter<550&&v_counter==red_pos[i]+35)|
                (h_counter>503&&h_counter<525&&v_counter==red_pos[i]+70)|
                (h_counter==504&&v_counter>red_pos[i]+34&&v_counter<red_pos[i]+71)|
                (h_counter==524&&v_counter>red_pos[i]+34&&v_counter<red_pos[i]+71));
                end
                2'b01: begin
                    red[i]<=(red_pos[i]!=0)&((h_counter>378&&h_counter<415&&v_counter==h_counter-344+red_pos[i])|
                (h_counter>413&&h_counter<450&&v_counter==-h_counter+484+red_pos[i])|
                (h_counter>378&&h_counter<405&&v_counter==red_pos[i]+35)|
                (h_counter>423&&h_counter<450&&v_counter==red_pos[i]+35)|
                (h_counter>403&&h_counter<425&&v_counter==red_pos[i])|
                (h_counter==404&&v_counter>red_pos[i]-1&&v_counter<red_pos[i]+36)|
                (h_counter==424&&v_counter>red_pos[i]-1&&v_counter<red_pos[i]+36));
                end
                2'b10: begin
                    red[i]<=(red_pos[i]!=0)&((v_counter>red_pos[i]-1&&v_counter<red_pos[i]+36&&v_counter==-h_counter+314+red_pos[i])|
                (v_counter>red_pos[i]+34&&v_counter<red_pos[i]+71&&v_counter==h_counter+red_pos[i]-244)|
                (v_counter>red_pos[i]-1&&v_counter<red_pos[i]+26&&h_counter==314)|
                (v_counter>red_pos[i]+24&&v_counter<red_pos[i]+46&&h_counter==349)|
                (v_counter>red_pos[i]+44&&v_counter<red_pos[i]+71&&h_counter==314)|
                (v_counter==red_pos[i]+25&&h_counter>313&&h_counter<350)|
                (v_counter==red_pos[i]+45&&h_counter>313&&h_counter<350));
                end
                2'b11: begin
                    red[i]<=(red_pos[i]!=0)&((v_counter>red_pos[i]-1&&v_counter<red_pos[i]+36&&v_counter==h_counter-614+red_pos[i])|
                (v_counter>red_pos[i]+34&&v_counter<red_pos[i]+71&&v_counter==-h_counter+684+red_pos[i])|
                (v_counter>red_pos[i]-1&&v_counter<red_pos[i]+26&&h_counter==614)|
                (v_counter>red_pos[i]+24&&v_counter<red_pos[i]+46&&h_counter==579)|
                (v_counter>red_pos[i]+44&&v_counter<red_pos[i]+71&&h_counter==614)|
                (v_counter==red_pos[i]+25&&h_counter>578&&h_counter<615)|
                (v_counter==red_pos[i]+45&&h_counter>578&&h_counter<615));
                end
                default: red[i]<=0;
            endcase
        end
    end
    
    
    wire blue_l,blue_r,blue_u,blue_d;
    assign blue_l=((v_counter>44&&v_counter<81&&h_counter==-v_counter+359)|
            (v_counter>79&&v_counter<116&&h_counter==v_counter+199)|
            (v_counter>44&&v_counter<71&&h_counter==314)|
            (v_counter>69&&v_counter<91&&h_counter==349)|
            (v_counter>89&&v_counter<116&&h_counter==314)|
            (v_counter==70&&h_counter>313&&h_counter<350)|
            (v_counter==90&&h_counter>313&&h_counter<350))&!reset;
    assign blue_r=((v_counter>44&&v_counter<81&&h_counter==v_counter+569)|
            (v_counter>79&&v_counter<116&&h_counter==-v_counter+729)|
            (v_counter>44&&v_counter<71&&h_counter==614)|
            (v_counter>69&&v_counter<91&&h_counter==579)|
            (v_counter>89&&v_counter<116&&h_counter==614)|
            (v_counter==70&&h_counter>578&&h_counter<615)|
            (v_counter==90&&h_counter>578&&h_counter<615))&!reset;
    assign blue_d=((h_counter>378&&h_counter<415&&v_counter==h_counter-299)|
            (h_counter>413&&h_counter<450&&v_counter==-h_counter+529)|
            (h_counter>378&&h_counter<405&&v_counter==80)|
            (h_counter>423&&h_counter<450&&v_counter==80)|
            (h_counter>403&&h_counter<425&&v_counter==45)|
            (h_counter==404&&v_counter>44&&v_counter<81)|
            (h_counter==424&&v_counter>44&&v_counter<81))&!reset;
     assign blue_u=((h_counter>478&&h_counter<515&&v_counter==-h_counter+559)|
            (h_counter>513&&h_counter<550&&v_counter==h_counter-469)|
            (h_counter>478&&h_counter<505&&v_counter==80)|
            (h_counter>523&&h_counter<550&&v_counter==80)|
            (h_counter>503&&h_counter<525&&v_counter==115)|
            (h_counter==504&&v_counter>79&&v_counter<116)|
            (h_counter==524&&v_counter>79&&v_counter<116))&!reset;
    
    
    
    always @(posedge vga_clk) begin
        if(blue_u|blue_d|blue_l|blue_r) begin
            VGA_B<=4'hf;
        end else VGA_B<=0;
    end
    always @(posedge vga_clk or posedge reset) begin
        if(reset) begin
            v_counter<=0;
            h_counter<=0;
        end else if(h_counter==799)begin
            h_counter<=0;
            if(v_counter==524) v_counter<=0;
            else v_counter<=v_counter+1;
        end else begin
            h_counter<=h_counter+1;
            if(red[0]!=0&&red_pos[0]!=0) VGA_R<=4'hf;
            else if(red[1]!=0&&red_pos[1]!=0)VGA_R<=4'hf;
            else if(red[2]!=0&&red_pos[2]!=0)VGA_R<=4'hf;
            else if(red[3]!=0&&red_pos[3]!=0)VGA_R<=4'hf;
            else if(red[4]!=0&&red_pos[4]!=0)VGA_R<=4'hf;
            else if(red[5]!=0&&red_pos[5]!=0)VGA_R<=4'hf;
            else VGA_R<=0;
        end
    end
    assign VGA_VS=(v_counter<3 && !reset);
    assign VGA_HS=(h_counter<97 && !reset);
    
    reg u_f;
    reg d_f;
    reg l_f;
    reg r_f;
    always @(negedge clk_arr or posedge reset) begin
        if(reset)begin
            score<=0;
            update<=0;
            u_f<=0;
            d_f<=0;
            l_f<=0;
            r_f<=0;
            dis<=6;
        end else if(up) begin
            for(i=0;i<6 && !u_f;i=i+1) begin
                if(red_type[i]==2'b00&&red_pos[i]!=0) begin
                    u_f<=1;
                    update<=1;
                    dis<=i;
                    if(red_pos[i]-45<10) score<=2'b11;
                    else if(red_pos[i]-45<20) score<=2'b10;
                    else if(red_pos[i]-45<30) score<=2'b01;
                    else score<=0;
                end
            end
            d_f<=0;
            l_f<=0;
            r_f<=0;
        end else if(down) begin
            for(i=0;i<6&&!d_f;i=i+1) begin
                if(red_type[i]==2'b01&&red_pos[i]!=0) begin
                    d_f<=1;
                    update<=1;
                    dis<=i;
                    if(red_pos[i]-45<10) score<=2'b11;
                    else if(red_pos[i]-45<20) score<=2'b10;
                    else if(red_pos[i]-45<30) score<=2'b01;
                    else score<=0;
                end
            end
            u_f<=0;
            l_f<=0;
            r_f<=0;
        end else if(left) begin
            for(i=0;i<6&&!l_f;i=i+1) begin
                if(red_type[i]==2'b10&&red_pos[i]!=0) begin
                    l_f<=1;
                    update<=1;
                    dis<=i;
                    if(red_pos[i]-45<10) score<=2'b11;
                    else if(red_pos[i]-45<20) score<=2'b10;
                    else if(red_pos[i]-45<30) score<=2'b01;
                    else score<=0;
                end
            end
            d_f<=0;
            u_f<=0;
            r_f<=0;
        end else if(right) begin
            for(i=0;i<6&&!r_f;i=i+1) begin
                if(red_type[i]==2'b11&&red_pos[i]!=0) begin
                    r_f<=1;
                    update<=1;
                    dis<=i;
                    if(red_pos[i]-45<10) score<=2'b11;
                    else if(red_pos[i]-45<20) score<=2'b10;
                    else if(red_pos[i]-45<30) score<=2'b01;
                    else score<=0;
                end
            end
           d_f<=0;
            u_f<=0;
            l_f<=0;
        end else begin
            update<=0;
            u_f<=0;
            l_f<=0;
            d_f<=0;
            r_f<=0;
            score<=0;
            dis<=6;
        end
    end
endmodule
