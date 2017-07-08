`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Universidade Federal de Sao Joao del-Rei
// Engineer:       Isabella Vieira, Lucivania Ester, Monica Neli.
// 
// Create Date:    20:30:09 12/02/2011 
// Design Name:    Maquina de estados finitos
// Module Name:    Maquina_de_estados 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Descricao da maquina de estados finitos de Moore
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Maquina_de_estados(input A, B, CLK, reset,
								  output  contar, up_down);

//Inicializando as saidas
localparam [3:0] s0=4'b0000, s1=4'b0001, s2=4'b0010, s3=4'b0011, s4=4'b0100, s5=4'b0101, s6=4'b0110, s7= 4'b0111 , s8=4'b1000; 			

//variaveis internas			
reg [3:0] estado_atual, prox_estado;

//Inicializando as variaveis
initial begin
	prox_estado = 4'b000;
	estado_atual = 4'b000;
end	

//Controle do clock e do reset na borda de subida - Sequencial
always @(posedge CLK, posedge reset)
	
	if (reset)
	begin
		estado_atual <= s0;
	end
	else
		estado_atual <= prox_estado;
		
//Controle das entradas - Combinacional	
always @*                               
begin
	
 case(estado_atual)
		
	//Estado inicial.
	s0: case({A,B})	
			2'b00: prox_estado = s0; 

			2'b01: prox_estado = s4;  
		
			2'b10: prox_estado = s1;
			
			default: prox_estado = s0;
		 
		 endcase
	
	//Controlando se o veiculo esta entrando.
	s1:	case({A,B})
				2'b00: prox_estado = s0;
				
				2'b10: prox_estado = s1;
				
				2'b11: prox_estado = s2;
				
				default: prox_estado = s0;
			endcase
			
	s2:	case ({A,B})
				2'b01: prox_estado = s3;
				
				2'b10: prox_estado = s1;
				
				2'b11: prox_estado = s2;
				
				default: prox_estado = s0;
			endcase
			
	s3: case ({A,B})
				2'b00: prox_estado = s7;	
				
				2'b01: prox_estado = s3;	
								
				2'b11: prox_estado = s2;
				
				default: prox_estado = s0;
		endcase
		
	//Se o veiculo chegou nesse estado, significa que o veiculo entrou.	
	s7: prox_estado = s0;
		
		
	// Controlando se o veiculo esta saindo	
	s4:	case ({A,B})	
				2'b00: prox_estado = s0;
				
				2'b01: prox_estado = s4;
				
				2'b11: prox_estado = s5;
				
				default: prox_estado = s0;
			endcase
			
	s5:	case ({A,B})
				2'b01: prox_estado = s4;
				
				2'b10: prox_estado = s6;
				
				2'b11: prox_estado = s5;	
				
				default: prox_estado = s0;
			endcase
			
		
	s6:	case ({A,B})
				2'b00: prox_estado = s8;		
				
				2'b10: prox_estado = s6;	

				2'b11: prox_estado = s5;		
				
				default: prox_estado = s0;
			endcase
			
	// Se o veiculo chegou ate esse estado,significa que saiu.		
	s8: prox_estado = s0;
	

  default: prox_estado = s0; 
	
 endcase
	
end //always

	assign contar = (estado_atual == s7)||(estado_atual == s8);
	
	assign up_down =(estado_atual == s8);	
  
endmodule
