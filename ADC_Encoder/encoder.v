module encoder(clk, rst, datain, en);
input clk, rst;
input [7:0] datain;
output [3:0] en;

reg [3:0] en;
always@ (posedge clk or posedge rst)
begin
    if(datain<=8'd114) begin         //4
        en<=4'b0100;
    end
    else if(datain<=8'd118) begin   //3
        en<=4'b0011;
    end
    else if(datain<=8'd122) begin   //2
        en<=4'b0010;
    end
    else if(datain<=8'd126) begin   //1
        en<=4'b0001;
    end
    else if(datain<=8'd130) begin  //0
        en<=4'b0000;
    end
    else if(datain<=8'd134) begin  //-1
        en<=4'b1111;
    end
    else if(datain<=8'd138) begin  //-2
        en<=4'b1110;
    end
    else if(datain<=8'd142) begin  //-3
        en<=4'b1101;
    end
    else begin                     //-4
        en<=4'b1100;
    end
end
endmodule