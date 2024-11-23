module counter_dwpm(clk,rst, d_n_input, duty);
input clk,rst;
input[8:0]d_n_input;
output duty;

reg duty;
reg[8:0]count;

//counter
always@ (posedge clk or posedge rst) begin
    if(rst)begin
        count<=0;
    end
    else if(count==9'b111111111) begin
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