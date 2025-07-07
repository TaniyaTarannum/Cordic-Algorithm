module stage_23(
    input signed [15:0] x_pr,
    input signed [15:0] y_pr,
    input signed [15:0] ang_pr,
    input clk,
    input reset,
    output reg signed [15:0] sx2_op,
    output reg signed [15:0] sy2_op,
    output reg signed [15:0] sa2_op
    );
  wire signed [15:0] abs_theta,o1,o2,o3,o4,w1,w2,w3,w4;
  assign abs_theta = ang_pr[15] ? (~ang_pr + 1'b1) : ang_pr;
  wire sel23;
   
  //to assign a value to the select line for iteration 2 and 3
  assign sel23 = (abs_theta > 16'b0000110000000000)?1'b1:1'b0;
  sinh_23 S1(.rin(x_pr),.S(sel23),.rout(o1));
  sinh_23 S2(.rin(y_pr),.S(sel23),.rout(o2));
  cosh_23 C1(.ri(x_pr),.sel(sel23),.ro(o3));
  cosh_23 C2(.ri(y_pr),.sel(sel23),.ro(o4)); 
     
always @(posedge clk, posedge reset)
begin
  if(reset)
      begin
      sx2_op <= 16'b0000000000000000;
      sy2_op<= 16'b0000000000000000;
      sa2_op <= 16'b0000000000000000;
      end
  else 
     begin
     if (abs_theta > 16'b0000110000000000 | abs_theta <= 16'b0000010000000000)
      begin
      sx2_op <= x_pr;
      sy2_op <= y_pr;
      sa2_op <= ang_pr;
      end
  else
      begin
         if(ang_pr[15])
          begin
          sx2_op <= o3 - o2;
          sy2_op <= o4 - o1;
          sa2_op <= sel23? (ang_pr + 16'b0001000000000000) : (ang_pr + 16'b0000100000000000);
          end
         else
          begin
          sx2_op <= o3 + o2;
          sy2_op <= o4 + o1;
          sa2_op <= sel23? (ang_pr - 16'b0001000000000000) : (ang_pr - 16'b0000100000000000);
          end
      end 
    end
end
endmodule  
