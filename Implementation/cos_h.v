module cos_h(
    input signed [15:0] r,
    output signed [15:0] r_o
    );
    wire signed [15:0] a,b,c,d;
  assign a = r + (r >>> 2);
  assign b = r + (a >>> 2);
  assign c = b >>> 9;
  assign d = r + (r >>> 3);
  assign r_o = c+d;
endmodule
