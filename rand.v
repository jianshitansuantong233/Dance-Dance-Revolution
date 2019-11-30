`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//from stackverflow
//link: https://stackoverflow.com/questions/14497877/how-to-implement-a-pseudo-hardware-random-number-generator
//////////////////////////////////////////////////////////////////////////////////

module rand(clk, reset, random);
    (* OPTIMIZE="OFF" *)                    //stop *xilinx* tools optimizing this away
input clk,reset;
output random;
    reg [30:0] stage;
    reg meta1, meta2;

assign random = meta2;
always@(posedge clk) begin
    if(reset) begin
        meta1 <= 1'b0;
        meta2 <= 1'b0;
        stage<=0;
    end else begin
        meta1 <= stage[1];
        meta2 <= meta1;
        stage[0] = (~&{stage[1] ^ stage[0]});
         stage[1] = !stage[2];
         stage[2] = !stage[3] ^ stage[0];
         stage[3] = !stage[4] ^ stage[0];
         stage[4] = !stage[5] ^ stage[0];
         stage[5] = !stage[6] ^ stage[0];
         stage[6] = !stage[7];
         stage[7] = !stage[8] ^ stage[0];
         stage[8] = !stage[9] ^ stage[0];
         stage[9] = !stage[10];
         stage[10] = !stage[11];
         stage[11] = !stage[12] ^ stage[0];
         stage[12] = !stage[13];
         stage[13] = !stage[14] ^ stage[0];
         stage[14] = !stage[15] ^ stage[0];
         stage[15] = !stage[16] ^ stage[0];
         stage[16] = !stage[17];
         stage[17] = !stage[18];
         stage[18] = !stage[19] ^ stage[0];
         stage[19] = !stage[20] ^ stage[0];
         stage[20] = !stage[21];
         stage[21] = !stage[22];
         stage[22] = !stage[23];
         stage[23] = !stage[24];
         stage[24] = !stage[25];
         stage[25] = !stage[26] ^ stage[0];
         stage[26] = !stage[27];
         stage[27] = !stage[28];
         stage[28] = !stage[29];
         stage[29] = !stage[30];
         stage[30] = !stage[0];
    end
end


endmodule
