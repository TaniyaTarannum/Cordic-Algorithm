module last_stage(
    input signed [15:0] x3,
    input signed [15:0] y3,
    input signed [15:0] ang3,
    input clk,
    input reset,
    output reg signed [15:0] xf,
    output reg signed [15:0] yf
    );
    wire signed [15:0] abs_theta,w1,w2,w3,w4,w5,w6;
    assign abs_theta = ang3[15] ? (~ang3 + 1'b1) : ang3;
    wire [3:0] k;
    assign k = abs_theta[15:12] + abs_theta[11];
    assign w1 = y3 >>> 9;
    assign w2 = x3 >>> 9;
    assign w3 = k*w1;
    assign w4 = k*w2;
    always @(posedge clk, posedge reset)
    begin
    // $display ($time,"k=%b,abs_theta=%b,w3=%b,w4=%b",k,abs_theta,w3,w4);
       if (reset)
         begin
         xf <= 16'b0000000000000000;
         yf <= 16'b0000000000000000;
         end
       else 
          begin
               if (ang3[15])
                 begin
                 xf <= x3 + w3;
                 yf <= y3 + w4;
                 end
               else 
                 begin
                 xf <= x3 - w3;
                 yf <= y3 - w4;
                 end
          end
    end
endmodule
