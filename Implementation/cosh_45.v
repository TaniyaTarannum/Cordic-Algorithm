module cosh_45(
    input signed [15:0] rin,
    input s,
    output signed [15:0] rout    
    );
    wire signed [15:0] a,b,c;
    assign a = rin >>> 11;
    assign b = rin >>> 9;
    assign c = s? b:a;
    assign rout = rin + c;
endmodule
