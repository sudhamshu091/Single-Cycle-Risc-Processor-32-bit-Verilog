// async control signal generation unit based on mem_writecode
// input: 6 bits mem_writecode
// output: all 1 bit except alu_mem_write which is 2-bits wide
module control (mem_writecode, reg_dest, jump, branch, mem_read, mem_to_reg, alu_mem_write, mem_write, aluSrc, reg_write);
	input [5:0] mem_writecode;
	output reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, aluSrc, reg_write;
	output [1:0] alu_mem_write;

	assign reg_dest=(~mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(~mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0]);//000000
	assign jump=(~mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(~mem_writecode[2])&(mem_writecode[1])&(~mem_writecode[0]);//000010
	assign branch=(~mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0]);//000100
	assign mem_read=(mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(~mem_writecode[2])&(mem_writecode[1])&(mem_writecode[0]);//100011
	assign mem_to_reg=(mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(~mem_writecode[2])&(mem_writecode[1])&(mem_writecode[0]);//100011
	assign mem_write=(mem_writecode[5])&(~mem_writecode[4])&(mem_writecode[3])&(~mem_writecode[2])&(mem_writecode[1])&(mem_writecode[0]);//101011
	assign aluSrc=((~mem_writecode[5])&(~mem_writecode[4])&(mem_writecode[3])&(~mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0])) | ((~mem_writecode[5])&(~mem_writecode[4])&(mem_writecode[3])&(mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0])) | ((mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(~mem_writecode[2])&(mem_writecode[1])&(mem_writecode[0])) | (((mem_writecode[5])&(~mem_writecode[4])&(mem_writecode[3])&(~mem_writecode[2])&(mem_writecode[1])&(mem_writecode[0]))); //001000,001100,100011,101011
	assign reg_write=(~mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(~mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0]) | ((~mem_writecode[5])&(~mem_writecode[4])&(mem_writecode[3])&(~mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0])) | ((~mem_writecode[5])&(~mem_writecode[4])&(mem_writecode[3])&(mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0])) | ((mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(~mem_writecode[2])&(mem_writecode[1])&(mem_writecode[0]));//000000,001000,001100,100011
	assign alu_mem_write[1]=((~mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(~mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0]))|((~mem_writecode[5])&(~mem_writecode[4])&(mem_writecode[3])&(mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0]));//000000, 001100(andi)
	assign alu_mem_write[0]= ((~mem_writecode[5])&(~mem_writecode[4])&(~mem_writecode[3])&(mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0]))|((~mem_writecode[5])&(~mem_writecode[4])&(mem_writecode[3])&(mem_writecode[2])&(~mem_writecode[1])&(~mem_writecode[0]));//000100,001100(andi)
endmodule
