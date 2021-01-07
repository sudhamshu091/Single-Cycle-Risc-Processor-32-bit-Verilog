// shift-left-2 for branch instruction
// input width: 32 bits
// output width: 32 bits
// fill the void with 0 after shifting
module branch_shiftleft2 (shift_in, shift_out);
	input [31:0] shift_in;
	output [31:0] shift_out;
	assign shift_out[31:0]={shift_in[29:0],2'b00};
endmodule
