module sinh_45(
    input signed [15:0] rin,
    input s,
    output signed [15:0] rout    
    );
    wire signed [15:0] a,b,c;
    assign a = rin >>> 4;
    assign b = rin >>> 5;
    assign c = s? a:b;
    assign rout = c;
endmodule
