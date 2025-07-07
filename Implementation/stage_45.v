module stage_45(
    input signed [15:0] sx2_op,
    input signed [15:0] sy2_op,
    input signed [15:0] sa2_op,
    input clk,
    input reset,
    output reg signed [15:0] x_nxt,
    output reg signed [15:0] y_nxt,
    output reg signed [15:0] ang_nxt
    );
    wire signed [15:0] o5,o6,o7,o8,w5,w6,w7,w8,abs_theta2;
    wire sel45;
    assign abs_theta2 = sa2_op[15] ? (~sa2_op + 1'b1) : sa2_op;
    assign sel45 = (abs_theta2 > 16'b0000001100000000)? 1'b1:1'b0;
sinh_45 S3(.rin(sx2_op),.s(sel45),.rout(o5));
sinh_45 S4(.rin(sy2_op),.s(sel45),.rout(o6));
cosh_45 C3(.rin(sx2_op),.s(sel45),.rout(o7));
cosh_45 C4(.rin(sy2_op),.s(sel45),.rout(o8));

always @(posedge clk, posedge reset)
begin

   if(reset)
      begin
      x_nxt <= 16'b0000000000000000;
      y_nxt <= 16'b0000000000000000;
      ang_nxt <= 16'b0000000000000000;
      end
   else
      begin
         if(abs_theta2 <= 16'b0000000100000000)
             begin
             x_nxt <= sx2_op;
             y_nxt <= sy2_op;
             ang_nxt <= sa2_op;
             end 
         else
             begin
             if(sa2_op[15])
                begin
                x_nxt <= o7 - o5;
                y_nxt <= o8 - o6;
                ang_nxt <= sel45? (sa2_op + 16'b0000010000000000) : (sa2_op + 16'b0000001000000000);
                end
             else
                begin
                x_nxt <= o7 + o5;
                y_nxt <= o8 + o6;
                ang_nxt <= sel45? (sa2_op - 16'b0000010000000000) : (sa2_op - 16'b0000001000000000);
                end
             end
      end
end
endmodule
