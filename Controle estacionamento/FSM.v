`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Universidade Federal de Sao Joao del-Rei
// Engineer: Isabella Vieira, Lucivania Ester e Monica Neli
// 
// Create Date:    10:29:17 11/26/2011 
// Design Name: 
// Module Name:    FSM 
// Project Name: TP_ISL
// Target Devices: 
// Tool versions: 
// Description: Descricao da m�uina de estados finitos, para descri�o do controle
//de estacionamento
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM (input A,B,CLK,reset,
				output reg contar, up_down,
				output reg [2:0]estado);
	
localparam [2:0] s0=3'b000, s1=3'b001,s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101, s6=3'b110; 			

//variaveis internas			
reg [2:0]estado_atual, prox_estado;
reg carro;

//Inicializando as variaveis
initial begin
	carro = 1'b0;
	prox_estado = 3'b000;
	estado_atual = 3'b000;
	contar = 1'b0;
	up_down = 1'b0;
	estado = 3'b000;
end	


always @(posedge CLK, posedge reset)
	
	if (reset)
	begin
		estado_atual <= s0;
		contar = 1'b0;
		up_down= 1'b0;
	end
	else
		estado_atual <= prox_estado;
		
		
always @*                               
begin
	
		case(estado_atual)
		
	s0: case({A,B})			
			2'b01: prox_estado= s4;  
		
			2'b10: prox_estado = s1;
			
			default: prox_estado = s0;
		 
		 endcase
	
	s1:	case({A,B})
				2'b11: begin
							prox_estado = s2;
							carro=1'b1;    //Diferencicao de pedestre e veiculo
						end
						
				2'b00: prox_estado = s0;
				2'b10: prox_estado = s1;
				
				default: prox_estado = s0;
			endcase
			
	s2:	case ({A,B})
				2'b01: prox_estado = s3;
				
				2'b10: prox_estado = s1;
				
				2'b11: prox_estado = s2;
				
				default: prox_estado = s0;
				
			endcase
			
	s3: case ({A,B})
				2'b00: prox_estado = s0;							   													 
						
				2'b11: prox_estado = s2;
				
				2'b01: prox_estado = s3;				
				
				default: prox_estado = s0;
		endcase
		
			
	s4:	case ({A,B})
				2'b11: begin
							prox_estado = s5;
							carro = 1'b1;
						end
						
				2'b00: prox_estado = s0;
				
				2'b01: prox_estado = s4;
				
				default: prox_estado = s0;
			endcase
			
	s5:	case ({A,B})
				2'b10: prox_estado = s6;
				
				2'b01: prox_estado = s4;
				
				2'b11: prox_estado = s5;				
				
				default: prox_estado = s0;
			endcase
			
		
	s6:	case ({A,B})
				2'b00: prox_estado = s0;				
					
				2'b11: prox_estado = s5;
				
				2'b10: prox_estado = s6;				
				
				default: prox_estado = s0;
			endcase
	
	//default: prox_estado = s0; 	
	
	endcase
	
   estado = (estado_atual);
	assign contar = (estado_atual == s3)& (carro == 1'b1);//({A,B} == 2'b00);//&;  //&(~up_down);
	assign up_down =(estado_atual == s6)& (carro == 1'b1)&(({A,B})== 2'b00);//&(carro == 1'b1);  //&(~contar)	
   end //always

endmodule
