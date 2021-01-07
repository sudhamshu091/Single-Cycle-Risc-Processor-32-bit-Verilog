module divide_by_100k (clock, reset, clock_out);
	parameter N = 17;
	input	clock, reset;
	wire	load, asyclock_out;
	wire 	[N-1:0] dat;
	output 	clock_out;
	reg 	[N-1:0] q;
	assign	dat = 0;
	assign	load = q[16] & q[15] & q[10] & q[9] & q[7] & q[4] & q[3] & q[2] & q[1] & q[0];
	always @ (posedge reset or posedge clock)
	begin
		if (reset == 1'b1) q <= 0;
		else if (load == 1'b1) q <= dat;
		else q <= q + 1;
	end
	assign	asyclock_out = load;
	dff_asy dff (.q(clock_out), .d(asyclock_out), .clk(clock), .rst(reset));
endmodule
