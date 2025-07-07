module sin_h(
    input signed [15:0] r_in,
    output signed [15:0] r_out
    );
     wire signed [15:0] a,b,c,d;
     assign a = r_in + (r_in >>> 2);
     assign b = (a >>> 4)+(r_in >>> 6);
     assign c = b+a; 
     assign d = (c >>> 5)+(r_in);
     assign r_out = d >>>1;     
endmodule
