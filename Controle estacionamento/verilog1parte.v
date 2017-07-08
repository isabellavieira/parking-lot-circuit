`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Universidade Federal de São João del-Rei
// Engineer:       Isabella Vieira, Lucivania Ester, Monica Neli.
// 
// Create Date:    17:50:45 11/14/2011 
// Design Name:    Decodificador BCD - 7 segmentos
// Module Name:    verilog1parte 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Decodificador BCD - 7 segmentos
//
// Dependencies:  
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Decoder_BCD_7seg(input [3:0] E, output [6:0] S);

	//Modelagem por fluxo de dados
	assign S[0] = (~E[3] & E[2] & ~E[1] & ~E[0]) | (~E[3] & ~E[2] & ~E[1] & E[0]);
	assign S[1] = (E[3] & E[2]) | (E[3] & E[1]) | (E[2] & (E[1] ^ E[0]));
	assign S[2] = (E[3] & E[2]) | (E[3] & E[1]) | (~E[2] & E[1] & ~E[0]);
	assign S[3] = (~E[3]& ~E[2]& ~E[1]& E[0]) | (~E[3]& E[2]& ~E[1]& ~E[0]) |(~E[3]& E[2]& E[1]& E[0]); 
	assign S[4] = (~E[3] & E[0]) | (~E[3] & E[2] & ~E[1]) | (~E[2] & ~E[1] & E[0]);
	assign S[5] = (~E[3] & ~E[2] & E[0]) | (~E[3] & E[1] & E[0]) | (~E[3] & ~E[2] & E[1]);
	assign S[6] = (~E[3] & ~E[2] & ~E[1]) | (~E[3] & E[2] & E[1] & E[0]);
	
	
endmodule


