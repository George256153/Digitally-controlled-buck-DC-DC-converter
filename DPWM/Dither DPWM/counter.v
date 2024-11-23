module counter_dpwm(clk,rst, d_n_input, duty);
input clk,rst;
input[5:0]d_n_input;
output duty;

reg duty;
reg[5:0]count;

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

//comparator
always@(posedge clk or posedge rst) begin
    if(rst)begin
        duty<=0;
    end
    else begin
        if(count==0)begin
            duty<=1;
        end
        if(count>=d_n_input)begin
            duty<=0;
        end
    end
end
endmodule