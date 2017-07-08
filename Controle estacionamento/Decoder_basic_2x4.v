`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Universidade Federal de São João del-Rei
// Engineer:       Isabella Vieira, Lucivania Ester, Monica Neli.
// 
// Create Date:    14:05:02 11/16/2011 
// Design Name:    Decodificador 2x4
// Module Name:    Decoder_basic_2x4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Decodificador 2x4 controle de habilitacao dos displays
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Decoder_basic_2x4(input H, input Sel1, Sel2, 
					          output reg[3:0] AN);

		//Sequencial
		always @*
			
			//Se o decodificador estiver habilitado entao testa o controle.
			if (H == 0)
			
				AN =  4'b1111;
				
			else if ({Sel1,Sel2} == 2'b00)
			
						AN = 4'b0111;
						
			else if ({Sel1,Sel2} == 2'b01)
			
						AN = 4'b1011;
					
			else if ({Sel1,Sel2} == 2'b10)
			
						AN = 4'b1101;
					
			else if ({Sel1,Sel2} == 2'b11)
			
						AN = 4'b1110;
endmodule
