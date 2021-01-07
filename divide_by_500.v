module divide_by_500 (clock, reset, clock_out);
	parameter N = 9;
	input 	clock, reset;
	wire		load, asyclock_out;
	wire 		[N-1:0] dat;
	output 	clock_out;
	reg 		[N-1:0] q;
	assign	dat = 9'b000000000;
	assign	load = q[8] & q[7] & q[6] & q[5] & q[4] & q[1] & q[0]; // for FPGA implementaion
	always @ (posedge reset or posedge clock)
	begin
		if (reset == 1'b1) q <= 9'b000000000;
		else if (load == 1'b1) q <= dat;
		else q <= q + 1;
	end
	assign	asyclock_out = load;
	dff_asy dff (.q(clock_out), .d(asyclock_out), .clk(clock), .rst(reset));
endmodule
