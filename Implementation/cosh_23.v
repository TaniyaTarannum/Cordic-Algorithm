module cosh_23(
    input signed [15:0] ri,
    input sel,
    output signed [15:0] ro
    );
    wire signed [15:0] a,b,c,d;
    assign a = ri >>>7;
    assign b = (ri >>> 8)+ ri;
    assign c = b >>> 5;
    assign d = sel? c:b;
    assign ro = d + ri;
endmodule
