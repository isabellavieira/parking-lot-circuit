`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Universidade Federal de São João del-Rei
// Engineer:       Isabella Vieira, Lucivania Ester, Monica Neli.
// 
// Create Date:    13:28:21 11/16/2011 
// Design Name:    Multiplexador 4x5
// Module Name:    mux_4x5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Multiplexador 4x5 que seleciona a saida de acordo com os controles 'sel1' e 'sel2'.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_4x5( input [3:0] num0, num1, num2, num3,
					 input [3:0] point, 
					 input Sel1, Sel2, 
					 output reg [3:0] S, 
					 output reg DP);
					 
	//Sequencial				 
	always @*
		
		//Testando os controles de selecao
		case ({Sel1,Sel2})
				
			2'b00:begin
				S = num0;
				DP = ~point[0];
			end
			
			2'b01: begin
				S = num1;
				DP = ~point[1];
			end
			
			2'b10:begin
				S = num2;
				DP = ~point[2];
			end
					
			default:begin
				S = num3;
				DP = ~point[3];
			end
			
		endcase

endmodule
