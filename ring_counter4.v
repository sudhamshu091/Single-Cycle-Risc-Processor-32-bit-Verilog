module ring_counter4(clock, reset, q);
	input 		clock, reset;
	output reg	[3:0]q;
	
	always @(posedge clock or posedge reset)
	begin
		if (reset == 1) q <= 4'b1110;
		else
		begin
			q[3] <= q[0];
			q[2] <= q[3];
			q[1] <= q[2];
			q[0] <= q[1];
		end
	end
endmodule
