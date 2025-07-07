module stage_1(
    input signed [15:0] x_in,
    input signed [15:0] y_in,
    input signed [15:0] ang_in,
    input clk,
    input reset,
    output reg signed [15:0] x_out,
    output reg signed [15:0] y_out,
    output reg signed [15:0] ang_out
    );
    
    wire signed [15:0] p,q,u,v,abs_theta;
    assign abs_theta = ang_in[15] ? (~ang_in + 1'b1) : ang_in;
    reg signed [15:0] r,s,w,x,z,k; 
    sin_h S1(.r_in(y_in), .r_out(q));
    sin_h S2(.r_in(x_in), .r_out(u));
    cos_h C1(.r(x_in), .r_o(p));
    cos_h C2(.r(y_in), .r_o(v));
    
    always @(posedge clk, posedge reset)
    begin
    if(reset)
      begin
      x_out <= 16'b0000000000000000;
      y_out <= 16'b0000000000000000;
      ang_out <= 16'b0000000000000000;
      end
    else
    begin
      if (abs_theta <= 16'b0001000000000000)
         begin
         x_out <= x_in;
         y_out <= y_in;
         ang_out <= ang_in;
         end
      else 
         begin
         case(ang_in[15])
         1'b0: begin 
              x_out <= p+q; 
              y_out <= u+v; 
              ang_out <= ang_in - 16'b0010000000000000; 
              end
         1'b1: begin 
              x_out <= p-q; 
              y_out <= v-u; 
              ang_out <= ang_in + 16'b0010000000000000; 
              end
          endcase
         end
  end
end
endmodule
