`timescale 1ns/1ns
module compensator(clk,reset,e_n_input,d_n_output);
input       clk,reset;
input    [3:0]  e_n_input;
output    [8:0]  d_n_output;

reg [3:0] e_n,e_n_1,e_n_2;
reg [15:0] ae_product,be_product,ce_product,d_n_reg,d_n_1;
wire [15:0] d_n_pre;
wire [3:0] e_n_input;

//delay blocks
always@(posedge clk or posedge reset)
begin
  if(reset)
  begin
    e_n <= 4'b0;
    e_n_1 <=4'b0;
    e_n_2 <= 4'b0;
    d_n_1 <=16'b0;
  end
  else
  begin
    e_n <= e_n_input;
    e_n_1 <= e_n;
    e_n_2 <= e_n_1;
    d_n_1 <= d_n_pre;
  end
end

//adder
assign d_n_pre = ae_product +be_product + ce_product +d_n_1;

//TableA
always@(e_n)
begin
  case(e_n)
    4'b1100:
    ae_product=16'b1101010110100100;
    4'b1101:
    ae_product=16'b1110000000111011;
    4'b1110:
    ae_product=16'b1110101011010010;
    4'b1111:
    ae_product=16'b1111010101101001;
    4'b0000:
    ae_product=16'b0000000000000000;
    4'b0001:
    ae_product=16'b0000101010010111;
    4'b0010:
    ae_product=16'b0001010100101110;
    4'b0011:
    ae_product=16'b0001111111000101;
    4'b0100:
    ae_product=16'b0010101001011100;

    default:ae_product=16'd0;
  endcase
end

//TableB
always@(e_n_1)
begin
  case(e_n_1)
   4'b1100: 
  be_product=16'b0101000100100000;
  4'b1101: 
  be_product=16'b0011110011011000;
  4'b1110:
  be_product=16'b0010100010010000;
  4'b1111:  
  be_product=16'b0001010001001000;
  4'b0000: 
  be_product=16'b0000000000000000;
  4'b0001:
  be_product=16'b1110101110111000;
  4'b0010: 
  be_product=16'b1101011101110000;
  4'b0011: 
  be_product=16'b1100001100101000;
  4'b0100: 
  be_product=16'b1010111011100000;

  default:be_product=16'd0;
  endcase
end

//Table C
always@(e_n_2)
begin
  case(e_n_2)
  4'b1100: 
  ce_product=16'b1101100100010100;
  4'b1101:   
  ce_product=16'b1110001011001111;
  4'b1110:
  ce_product=16'b1110110010001010;
  4'b1111:  
  ce_product=16'b1111011001000101;
  4'b0000:  
  ce_product=16'b0000000000000000;
  4'b0001:
  ce_product=16'b0000100110111011;
  4'b0010:
  ce_product=16'b0001001101110110;
  4'b0011:
  ce_product=16'b0001110100110001;
  4'b0100:
  ce_product=16'b0010011011101100;
  
  default:ce_product=16'd0;
  endcase
end

//limiter
always@(d_n_pre)
begin
  if(d_n_pre[15]==1)
    d_n_reg = 16'b0;
  else if(d_n_pre>16'b0111100110011001)
    d_n_reg = 16'b0111100110011001;
  else
    d_n_reg = d_n_pre;
end

//Truncation
assign d_n_output = d_n_reg[14:6];

endmodule