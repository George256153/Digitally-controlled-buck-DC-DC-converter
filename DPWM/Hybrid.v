module hybriddpwm(clk,rst,d_n_input,duty);
input clk,rst;
input[8:0] d_n_input;
output reg duty;

wire i0,i1,i2,i3,i4,i5,i6,i7,i8;
reg temp=0;
reg[5:0]count;
reg delay;

//counter
always@ (posedge clk or posedge rst) begin
    if(rst)begin
        count<=0;
    end
    else if(count==6'b111111) begin
        count<=0;
        temp<=0;
        delay<=0;
    end
    else begin
        count<=count+1;
    end
end

//comparator
always@(posedge clk or posedge rst) begin
    if(rst)begin
        duty<=0;
    end
    else begin
        if(count==0)begin
            duty<=1;
        end
        if(count>=d_n_input[8:3])begin
            temp<=1;
        end
        if(count==6'd63)begin
            temp<=0;
        end
    end
end

//buffer
assign i0=temp;
buf#(4,4)(i1,i0);
buf#(4,4)(i2,i1);
buf#(4,4)(i3,i2);
buf#(4,4)(i4,i3);
buf#(4,4)(i5,i4);
buf#(4,4)(i6,i5);
buf#(4,4)(i7,i6);
buf#(4,4)(i8,i7);

//mux
always@(*) begin
    case(d_n_input[2:0])
    3'b000 : delay<=i0;
    3'b001 : delay<=i1;
    3'b010 : delay<=i2;
    3'b011 : delay<=i3;
    3'b100 : delay<=i4;
    3'b101 : delay<=i5;
    3'b110 : delay<=i6;
    3'b111 : delay<=i7;
    default:delay<=i0;
    endcase
end

//SR latch
always@ (*) begin
    if(count==0)begin
        temp<=0;
    end
    else if(delay==1) begin
        duty<=0;
    end
end
endmodule