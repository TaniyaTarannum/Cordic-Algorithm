`timescale 1ns / 100ps
module cordic_2taylor_tb;                                                                                                                             
reg signed [15:0] x,y,ang;                                                                                                                            
reg clk,reset;                                                                                                                                        
wire signed [15:0] cosh,sinh;                                                                                                                         
    cordic_2taylor C1(.clk(clk),.reset(reset),.ang(ang),.xin(x),.yin(y),.Xout(cosh),.Yout(sinh));                                                     
    initial                                                                                                                                           
    begin clk=1'b0;                                                                                                                                   
    forever #5 clk = ~clk;                                                                                                                            
    end                                                                                                                                               
    initial                                                                                                                                           
    begin                                                                                                                                             
    $monitor ($time," x=%b,y=%b,ang=%b,clk=%b,reset=%b,cosh=%b,sinh=%b",x,y,ang,clk,reset,cosh,sinh);                                                 
    #4 reset = 1'b1;                                                                                                                                  
    #8 reset = 1'b0; x = 16'b0100000000000000; y = 16'b0000000000000000; ang = 16'b0001110110101100;                                                  
    // #5 ang = 16'b0011001001000100;                                                                                                                 
    // #5 ang = 16'b1011001001000100;                                                                                                                 
    #100 $finish;                                                                                                                                     
    end                                                                                                                                               
                                                                                                                                                      
endmodule                                                                                                                                             
                                                                                                                                                      
                                                                                                                                                      
