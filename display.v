`timescale 1ns / 1ps

module display(AN,one,ten, hundred,thousand,CA,CB,CC,CD,CE,CF,CG);
    input [3:0]AN;
    input [3:0]one,ten, hundred, thousand;
    output CA,CB,CC,CD,CE,CF,CG;
    reg CA,CB,CC,CD,CE,CF,CG;
    always @(*) begin
        CA=0;
        CB=0;
        CC=0;
        CD=0;
        CE=0;
        CF=0;
        CG=0;
        case(one)
            4'b0000: begin
                if(AN[0]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=1;   
                end
            end
            4'b0001: begin
                if(AN[0]==1'b0) begin
                    CB=0;
                    CC=0;
                    CA=1;
                    CD=1;
                    CE=1;
                    CF=1;
                    CG=1;
                end   
            end
            4'b0010: begin
                if(AN[0]==1'b0) begin
                    CA=0;
                    CB=0;
                    CD=0;
                    CE=0;
                    CG=0;
                    CC=1;
                    CF=1;
                end
            end
            4'b0011: begin
                if(AN[0]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CG=0;
                    CE=1;
                    CF=1;
                end
            end
            4'b0100: begin
                if(AN[0]==1'b0) begin
                    CB=0;
                    CC=0;
                    CF=0;
                    CG=0;
                    CA=1;
                    CD=1;
                    CE=1;
                end
            end
            4'b0101: begin
                if(AN[0]==1'b0) begin
                    CA=0;
                    CC=0;
                    CD=0;
                    CF=0;
                    CG=0;
                    CB=1;
                    CE=1;
                end
            end
            4'b0110: begin
                if(AN[0]==1'b0) begin
                    CA=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=0;
                    CB=1;
                end
            end
            4'b0111: begin
                if(AN[0]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=1;
                    CE=1;
                    CF=1;
                    CG=1;
                end
             end
             4'b1000: begin
                 if(AN[0]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=0;
                end
             end
             4'b1001: begin
                 if(AN[0]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CF=0;
                    CG=0;
                    CE=1;
                end
            end
        endcase
         case(ten)
            4'b0000: begin
                if(AN[1]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=1;   
                end
            end
            4'b0001: begin
                if(AN[1]==1'b0) begin
                    CB=0;
                    CC=0;
                    CA=1;
                    CD=1;
                    CE=1;
                    CF=1;
                    CG=1;
                end   
            end
            4'b0010: begin
                if(AN[1]==1'b0) begin
                    CA=0;
                    CB=0;
                    CD=0;
                    CE=0;
                    CG=0;
                    CC=1;
                    CF=1;
                end
            end
            4'b0011: begin
                if(AN[1]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CG=0;
                    CE=1;
                    CF=1;
                end
            end
            4'b0100: begin
                if(AN[1]==1'b0) begin
                    CB=0;
                    CC=0;
                    CF=0;
                    CG=0;
                    CA=1;
                    CD=1;
                    CE=1;
                end
            end
            4'b0101: begin
                if(AN[1]==1'b0) begin
                    CA=0;
                    CC=0;
                    CD=0;
                    CF=0;
                    CG=0;
                    CB=1;
                    CE=1;
                end
            end
            4'b0110: begin
                if(AN[1]==1'b0) begin
                    CA=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=0;
                    CB=1;
                end
            end
            4'b0111: begin
                if(AN[1]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=1;
                    CE=1;
                    CF=1;
                    CG=1;
                end
             end
             4'b1000: begin
                 if(AN[1]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=0;
                end
             end
             4'b1001: begin
                 if(AN[1]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CF=0;
                    CG=0;
                    CE=1;
                end
            end
        endcase
        case(hundred)
            4'b0000: begin
                if(AN[2]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=1;   
                end
            end
            4'b0001: begin
                if(AN[2]==1'b0) begin
                    CB=0;
                    CC=0;
                    CA=1;
                    CD=1;
                    CE=1;
                    CF=1;
                    CG=1;
                end   
            end
            4'b0010: begin
                if(AN[2]==1'b0) begin
                    CA=0;
                    CB=0;
                    CD=0;
                    CE=0;
                    CG=0;
                    CC=1;
                    CF=1;
                end
            end
            4'b0011: begin
                if(AN[2]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CG=0;
                    CE=1;
                    CF=1;
                end
            end
            4'b0100: begin
                if(AN[2]==1'b0) begin
                    CB=0;
                    CC=0;
                    CF=0;
                    CG=0;
                    CA=1;
                    CD=1;
                    CE=1;
                end
            end
            4'b0101: begin
                if(AN[2]==1'b0) begin
                    CA=0;
                    CC=0;
                    CD=0;
                    CF=0;
                    CG=0;
                    CB=1;
                    CE=1;
                end
            end
            4'b0110: begin
                if(AN[2]==1'b0) begin
                    CA=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=0;
                    CB=1;
                end
            end
            4'b0111: begin
                if(AN[2]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=1;
                    CE=1;
                    CF=1;
                    CG=1;
                end
             end
             4'b1000: begin
                 if(AN[2]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=0;
                end
             end
             4'b1001: begin
                 if(AN[2]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CF=0;
                    CG=0;
                    CE=1;
                end
            end
        endcase
        case(thousand)
            4'b0000: begin
                if(AN[3]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=1;   
                end
            end
            4'b0001: begin
                if(AN[3]==1'b0) begin
                    CB=0;
                    CC=0;
                    CA=1;
                    CD=1;
                    CE=1;
                    CF=1;
                    CG=1;
                end   
            end
            4'b0010: begin
                if(AN[3]==1'b0) begin
                    CA=0;
                    CB=0;
                    CD=0;
                    CE=0;
                    CG=0;
                    CC=1;
                    CF=1;
                end
            end
            4'b0011: begin
                if(AN[3]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CG=0;
                    CE=1;
                    CF=1;
                end
            end
            4'b0100: begin
                if(AN[3]==1'b0) begin
                    CB=0;
                    CC=0;
                    CF=0;
                    CG=0;
                    CA=1;
                    CD=1;
                    CE=1;
                end
            end
            4'b0101: begin
                if(AN[3]==1'b0) begin
                    CA=0;
                    CC=0;
                    CD=0;
                    CF=0;
                    CG=0;
                    CB=1;
                    CE=1;
                end
            end
            4'b0110: begin
                if(AN[3]==1'b0) begin
                    CA=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=0;
                    CB=1;
                end
            end
            4'b0111: begin
                if(AN[3]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=1;
                    CE=1;
                    CF=1;
                    CG=1;
                end
             end
             4'b1000: begin
                 if(AN[3]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CE=0;
                    CF=0;
                    CG=0;
                end
             end
             4'b1001: begin
                 if(AN[3]==1'b0) begin
                    CA=0;
                    CB=0;
                    CC=0;
                    CD=0;
                    CF=0;
                    CG=0;
                    CE=1;
                end
            end
        endcase
    end
endmodule
