`timescale 1ns / 100ps
module cordic_2taylor (
input clk,
input reset,
input signed [15:0] ang,
input signed [15:0] xin,
input signed [15:0] yin,
output signed [15:0] Xout,
output signed [15:0] Yout);
wire signed [15:0] x1, y1, theta1;          // Outputs from Stage 1
wire signed [15:0] x2, y2, theta2;          // Outputs from Stage 2
wire signed [15:0] x3, y3, theta3;          // outputs from stage 3
    
    stage_1 S1(xin,yin,ang,clk,reset,x1,y1,theta1);
    stage_23 S2(x1,y1,theta1,clk,reset,x2,y2,theta2);
    stage_45 S3(x2,y2,theta2,clk,reset,x3,y3,theta3);
    last_stage S4(x3,y3,theta3,clk,reset,Xout,Yout);
    
endmodule
