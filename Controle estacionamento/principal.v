`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Universidade Federal de Sao Joao del-Rei
// Engineer:       Isabella Vieira, Lucivania Ester, Monica Neli.
// 
// Create Date:    13:52:56 11/29/2011 
// Design Name:    Module Principal
// Module Name:    principal 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Instanciacao dos modules.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module principal(input A, B, CLK, RESET,
					  input [3:0] point,
					  input H,
					  //input decre,       //teste
					  output decre,
					  output somar, 
					  output [6:0] SBCD,
					  output [3:0] AN,
					  output DP,
					  output max_tick);
	
	//Fios internos.
	wire [3:0] Smux_sai;
	wire w0;
	wire w1;
	wire [3:0] unidade, dezena, centena, milhar;
	
	//Instanciacao dos modules
	Maquina_de_estados maquina(.A(A),.B(B),.CLK(CLK),.reset(RESET),.contar(somar),.up_down(decre));
	
	cont_bcd BCD (.somar(somar),.decrem(decre),.clk(CLK),.reset(RESET),.unid(unidade),.dez(dezena),.cent(centena),.milhar(milhar));	
	
	mux_4x5 MUX(.Sel1(w0),.Sel2(w1),.num0(unidade),.num1(dezena),.num2(centena),.num3(milhar),.point(point),.DP(DP),.S(Smux_sai));
	
	Decoder_basic_2x4 DECODER_BASIC(.H(H),.Sel1(w0),.Sel2 (w1),.AN(AN));
	
	Decoder_BCD_7seg DECODER_BCD(.E(Smux_sai),.S(SBCD));
	
	contador2bits CONTADOR_2_BITS(.c(max_tick),.clck(CLK),.Qa(w0),.Qb(w1));
	
	contador17bits CONDICIONADOR_CLCK(.clk(CLK),.max_tick(max_tick));
	
	//contador17bits CONDICIONADOR(.clk(CLK),.max_tick(somar));	//teste
	
endmodule

