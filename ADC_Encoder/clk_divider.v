module clk_divider(clk,rst,count,convst_bar,clk_comp,clk_dpwm);
input clk, rst;
input [5:0] count;
output convst_bar;
output reg clk_comp, clk_dpwm;

reg convst_bar;
reg [5:0]clk2;
wire [3:0] count_lsb;
assign count_lsb = count[5:2];

//convst_bar
always@(posedge clk or posedge rst) begin
    if(rst) begin
        convst_bar<=0;
    end
    else if(count_lsb==4'd4) begin
        convst_bar<=0;
    end
    else begin
        convst_bar<=1;
    end
end
//clk_comp
always@(posedge clk or posedge rst) begin
    if(rst) begin
        clk_comp<=0;
    end
    else if(count_lsb==4'd15) begin
        clk_comp<=1;
    end
    else begin
        clk_comp<=0;
    end
end
//clk_dpwm
always@(posedge clk or posedge rst) begin
    if(rst) begin
        clk_dpwm=0;
        clk2=6'b0;
    end
    else if(clk2==6'd31) begin
        clk_dpwm=~clk_dpwm;
        clk2=6'b0;
    end
    else begin
        clk2=clk2+6'd1;
    end
end
endmodule