module dither_dpwm(clk_in,rst,d_n_input,ditherin);
input clk_in,rst;
input[8:0] d_n_input;
output[5:0]ditherin;
reg[2:0]count;
reg[7:0]T[7:0];
wire[7:0]dith_row;
reg dith_point;
wire[8:0] d_n_input;
wire[5:0] ditherin;

//dither table
    initial begin
        T[3'b000] = 8'b00000000;
        T[3'b001] = 8'b00000001;
        T[3'b010] = 8'b00010001;
        T[3'b011] = 8'b00100101;
        T[3'b100] = 8'b01010101;
        T[3'b101] = 8'b01011011;
        T[3'b110] = 8'b01110111;
        T[3'b111] = 8'b01111111;
    end

//count
always@ (posedge clk_in or posedge rst) begin
    if(rst)count<=3'b0;
    else if(count==3'b111)count<=3'b0;
    else count<=count+3'b1;
end
assign dith_row=T[d_n_input[2:0]];

always@(count) begin
    case(count)
    3'b000 : dith_point=dith_row[7];
    3'b001 : dith_point=dith_row[6];
    3'b010 : dith_point=dith_row[5];
    3'b011 : dith_point=dith_row[4];
    3'b100 : dith_point=dith_row[3];
    3'b101 : dith_point=dith_row[2];
    3'b110 : dith_point=dith_row[1];
    3'b111 : dith_point=dith_row[0];
    endcase
end
assign ditherin=d_n_input[8:3]+dith_point;
endmodule
