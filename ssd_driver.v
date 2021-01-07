module ssd_driver (in_bcd, out_ssd);
	input [3:0] in_bcd;                         // input in BCD
	output [6:0] out_ssd;                       // output to Seven-Segment Display
	reg [6:0] out_ssd;
	always @(in_bcd) begin
		case (in_bcd)
		0:out_ssd=7'b0000001;
		1:out_ssd=7'b1001111;
		2:out_ssd=7'b0010010;
		3:out_ssd=7'b0000110;
		4:out_ssd=7'b1001100;
		5:out_ssd=7'b0100100;
		6:out_ssd=7'b0100000;
		7:out_ssd=7'b0001111;
		8:out_ssd=7'b0000000;
		9:out_ssd=7'b0000100;
		10:out_ssd=7'b0001000;
		11:out_ssd=7'b1100000;
		12:out_ssd=7'b0110001;
		13:out_ssd=7'b1000010;
		14:out_ssd=7'b0110000;
		15:out_ssd=7'b0111000;
			default out_ssd = 7'b1111111;          // no ssd
		endcase
	end
endmodule
