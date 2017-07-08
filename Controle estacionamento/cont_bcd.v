`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:       Universidade Federal de São João del-Rei
// Engineer:      Isabella Vieira, Lucivania Ester, Monica Neli.
// 
// Create Date:   15:32:53 12/02/2011 
// Design Name:   Contador BCD
// Module Name:   cont_bcd 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:   Contador em unidade, dezena, centena e milhar
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cont_bcd(input somar, decrem, clk, reset, 					 
					 output reg [3:0] unid, cent, dez, milhar);

//Inicializando as variaveis
initial begin
	unid = 4'd0;
	cent = 4'd0;
	dez = 4'd0;	
	milhar = 4'd0;	
end

//Sequencial
always @ (posedge clk, posedge reset)
	
	if (reset) 
	begin
		unid <= 4'd0;
		cent <= 4'd0;
		dez <= 4'd0;	
		milhar <= 4'd0;	
   end		
	// Contar crescente
	else if (somar & ~decrem)
	begin
		//Se chegar em 2500, para de contar e recebe os valores anteriores.
		if ((unid == 4'd0)& (dez == 4'd0)& (cent == 4'd5)& (milhar == 4'd2))
		begin
			unid <= unid;
			cent <= cent;
			dez <= dez;	
			milhar <= milhar;
		end
		else
		begin 
			//Se a unidade for 9 ela recebe 0 e soma na dezena.
			if (unid == 4'd9)
			begin
					unid <= 4'd0;
					//Se a dezena for 9 ela recebe 0 e soma na centena.
					if (dez == 4'd9)
					begin		
						dez <= 4'd0;
						//Se a centena for 9 ela recebe 0 e soma no milhar.
						if (cent == 4'd9)
						begin
							cent <=  4'd0;
							milhar <= milhar + 4'd1;
						end
						else cent <= cent + 4'd1;
					end	
					 else dez <= dez + 4'd1;	
			end			
			else unid <= unid + 4'd1;
		end
	end //(somar & ~decrem)
	
	//Conta decrescente.
	else if (somar & decrem)	
		  begin
				//Se a unidade, dezena, centena e milhar forem zero continuam zero.
				if ((unid == 4'd0)& (dez == 4'd0)& (cent == 4'd0)& (milhar == 4'd0))
				begin
					unid <= 4'd0;
					cent <= 4'd0;
					dez <= 4'd0;	
					milhar <= 4'd0;					
				end
				//Se a unidade for 0 ela recebe 9 e decrementa na dezena.
				else if (unid == 4'd0)
					  begin		
							unid <= 4'd9;
							//Se a dezena for 0 ela recebe 9 e decrementa na centena.
							if (dez == 4'd0)
							begin	
								dez <= 4'd9;
								//Se a centena for 0 ela recebe 9 e decrementa no milhar.
								if (cent == 4'd0)
								begin
									cent <= 4'd9;
									milhar <= milhar - 4'd1;								
								end
								else cent <= cent - 4'd1;
							end
							else dez <= dez - 4'd1;	
					  end						  			
					  else unid <= unid - 4'd1;	
		  end//(somar & decrem)


endmodule
