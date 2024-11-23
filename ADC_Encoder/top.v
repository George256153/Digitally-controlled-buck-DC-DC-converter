`timescale 1ns/1ns
`include "dither.v"
`include "deadtime.v"
`include "encoder.v"
`include "compensator.v"
`include "clk_divider.v"
module top(clk, rst, datain, duty_high, duty_low, convst_bar);

input clk, rst;
input [7:0] datain;
output duty_high, duty_low;
output convst_bar;

wire [5:0] d_n_input;
wire [8:0] d_n;
wire [3:0] en;
wire [5:0] count;
wire clk_comp, clk_dpwm, convst_bar;

encoder encoder         (clk,rst,datain,en);
compensator compensator (clk_comp,rst,en,d_n);
dither_dpwm ditherdpwm  (clk_dpwm,rst,d_n,d_n_input);
counter_deadtime deadtime      (clk,rst,d_n_input,duty_high,duty_low,count);
clk_divider clkdivider  (clk,rst,count,convst_bar,clk_comp,clk_dpwm);
endmodule