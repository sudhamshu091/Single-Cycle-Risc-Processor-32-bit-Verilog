// async control to generate alu input signal
// input: 2-bit alu_mem_write control signal and 6-bit funct field from instruction
// output: 4-bit alu control input
module alucontrol (aluop, funct, out_to_alu);
	input [1:0] aluop;
	input [5:0] funct;
	output [3:0] out_to_alu;

	assign out_to_alu[3]=0;
	assign out_to_alu[2]=((~aluop[1])&(aluop[0])) | ((aluop[1])&(~aluop[0])&(~funct[3])&(~funct[2])&(funct[1])&(~funct[0])) | ((aluop[1])&(~aluop[0])&(funct[3])&(~funct[2])&(funct[1])&(~funct[0]));
	assign out_to_alu[1]=((~aluop[1])&(~aluop[0]))|((~aluop[1])&(aluop[0])) | ((aluop[1])&(~aluop[0])&(~funct[3])&(~funct[2])&(~funct[1])&(~funct[0])) | ((aluop[1])&(~aluop[0])&(~funct[3])&(~funct[2])&(funct[1])&(~funct[0]))|((aluop[1])&(~aluop[0])&(funct[3])&(~funct[2])&(funct[1])&(~funct[0]));
	assign out_to_alu[0]=((aluop[1])&(~aluop[0])&(~funct[3])&(funct[2])&(~funct[1])&(funct[0]))|((aluop[1])&(~aluop[0])&(funct[3])&(~funct[2])&(funct[1])&(~funct[0]));	
endmodule


