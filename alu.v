// 32-bit alu
// data input width: 2 32-bit
// data output width: 1 32-bit and one "zero" output
// control: 4-bit
// zero: output 1 if all bits of data output is 0
module alu (in_a, in_b, alu_out, zero, control);
	input [31:0] in_a, in_b;
	output [31:0] alu_out;
	output zero;
	reg zero;
	reg [31:0] alu_out;
	input [3:0] control;
	always @ (control or in_a or in_b)
	begin
		case (control)
		4'b0000:begin zero<=0; alu_out<=in_a&in_b; end
		4'b0001:begin zero<=0; alu_out<=in_a|in_b; end
		4'b0010:begin zero<=0; alu_out<=in_a+in_b; end
		4'b0110:begin if(in_a==in_b) zero<=1; else zero<=0; alu_out<=in_a-in_b; end
		4'b0111:begin zero<=0; if(in_a-in_b>=32'h8000_0000) alu_out<=32'b1; else alu_out<=32'b0; end// how to implement signed number
		default: begin zero<=0; alu_out<=in_a; end
		endcase
	end
endmodule
