// sync register file (write/read occupy half cycle each)
// height: 32 (from $0 to $ra), width: 32 bits
// write: on rising edge; data width 32 bit; address width 5 bit
// read: on falling edge; data width 32 bit; address width 5 bit
// control: write on rising edge if (reg_write == 1)
// async reset: set all register content to 0
module register_file (read_addr_1, read_addr_2, write_addr, read_data_1, read_data_2, write_data, reg_write, clk, reset);
	input [4:0] read_addr_1, read_addr_2, write_addr;
	input [31:0] write_data;
	input clk, reset, reg_write;
	output [31:0] read_data_1, read_data_2;

	reg [31:0] reg_file [31:0];
	integer k;
	
	assign read_data_1 = reg_file[read_addr_1];
	assign read_data_2 = reg_file[read_addr_2];

	always @(posedge clk or posedge reset) // Ou combines the block of reset into the block of posedge clk
	begin
		if (reset==1'b1)
		begin
			for (k=0; k<32; k=k+1) 
			begin
				reg_file[k] = 32'b0;
			end
		end 
		
		else if (reg_write == 1'b1) reg_file[write_addr] = write_data; 
	end
	


endmodule
