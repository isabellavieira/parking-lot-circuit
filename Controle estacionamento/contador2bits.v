`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Universidade Federal Sao Joao del-Rei
// Engineer:       Isabella Vieira, Lucivania Ester, Monica Neli
// 
// Create Date:    15:46:37 11/22/2011 
// Design Name:    Contador de 2 bits
// Module Name:    contador2bits 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Contador de 2 bits para alternar entre os displays. 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module contador2bits(input c, clck,
							output reg Qa,Qb);
							
		//Inicializando					
		initial begin
			Qa = 1'd0;
			Qb = 1'd0;
		end
		
		//Sequencial
		always @ (posedge clck)
		
		//Verificando se esta habilitado
		if (c)
			
			//Controle Qa
			Qa <= (c & ~Qa & Qb) | (Qa & ~Qb) | (~c & Qa);
		
		//Sequencial
		always @ (posedge clck)
		//Verificando se esta habilitado	
		if(c)
			
			//Controle Qb
			Qb <= (c ^ Qb);

endmodule
