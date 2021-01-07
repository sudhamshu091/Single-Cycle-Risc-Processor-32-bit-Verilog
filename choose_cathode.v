module choose_cathode(tho, hun, ten, one, an, ca);
	input	[6:0]tho;
	input	[6:0]hun;
	input	[6:0]ten;
	input	[6:0]one;
	input	[3:0]an;
	output	[6:0]ca;
	assign ca = (an==4'b1110) ? one : 7'bzzzzzzz,
		   ca =	(an==4'b1101) ? ten : 7'bzzzzzzz,
		   ca = (an==4'b1011) ? hun : 7'bzzzzzzz,
		   ca =	(an==4'b0111) ? tho : 7'bzzzzzzz;
endmodule
