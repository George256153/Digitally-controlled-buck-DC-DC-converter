module counter_deadtime(clk,rst, d_n_input,duty_high,duty_low,count);
input clk,rst;
input[5:0]d_n_input;
output duty_high;
output duty_low;
output reg[5:0]count;

reg duty_high,duty_low;

//counter
always@ (posedge clk or posedge rst) begin
    if(rst)begin
        count<=0;
    end
    else if(count==6'b111111) begin
        count<=0;
    end
    else begin
        count<=count+1;
    end
end

//comparator_high
always@(posedge clk or posedge rst) begin
    if(rst)begin
        duty_high<=0;
    end
    else begin
        if(count==0)begin
            duty_high<=1;
        end
        if(count>=d_n_input)begin
            duty_high<=0;
        end
    end
end

//comparator_low
always@(posedge clk or posedge rst) begin
    if(rst)begin
        duty_low<=0;
    end
    else begin
        if(count==0)begin
            duty_low<=0;
        end
        if(count>=6'd58) begin
            duty_low<=0;
        end
        else if(count>=(d_n_input+6'd6))begin
            duty_low<=1;
        end
    end
end
endmodule