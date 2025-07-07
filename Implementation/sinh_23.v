module sinh_23(
    input signed [15:0] rin,
    input S,
    output signed [15:0] rout
    );
     wire signed [15:0] a,b,c,d,e;
     assign a = (rin >>> 4)+ rin;
     assign b = rin + (rin >>> 9);
     assign c = b + (a >>> 7);
     assign d = c >>> 2;
     assign e = b >>> 3;
     assign rout = S? d:e;
endmodule
