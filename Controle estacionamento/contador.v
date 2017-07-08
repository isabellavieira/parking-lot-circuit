`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:10 11/22/2011 
// Design Name:    Condicionador de clock - Contador de 17 bits
// Module Name:    contador 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Contador de 0 a 125000 para reduzir a frequencia do contador de 2 bits de 50 MHz para 400 Hz.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module contador17bits (input clk,
							  output reg max_tick);
	
	//Memoria interna
	reg [16:0]cont; 
	//reg [18:0]cont;
	
	initial begin
		cont = 17'd1; 
		//cont = 19'd1;
		max_tick = 1'b0;
	end
	
	//Sequencial
	always @ (posedge clk)
	
		//Verificando se atingiu o limite
		if (cont != 17'd125000)      
		//if (cont != 19'd500000)  
		 begin
			
		   max_tick <= 1'b0;
			cont <= cont + 17'd1;	
			//cont <= cont + 19'd1;		
			
		 end
		else
		begin
			
			//Se atingiu o limite volta para 1 e emite sinal.
			cont <= 17'b1;  
			//cont <= 19'b1;
			max_tick <= 1'b1;
			
		end

endmodule
