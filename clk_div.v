`timescale 1ns / 1ps
//************************* CECS 301 ****************************************/
// File Name: clk_div.v  
// Project: Shift Register LAB#1
// Create Date:  09/04/2018  
// Designer: Beatriz Juarez
// Email: beatrizmjuarez@gmail.com
// Revision Date: 9/14/2018
// Purpose: Divides an incoming clock by the 32-bit decimal value specified
// 	in the 'if condition'.
// 
// 	The value of the counter that counts the incoming clock ticks is equal
// 	to [(incoming frequency / outgoing frequency) / 2] 
//						100MHz		/			500Hz			/ 2 = 100K 
//
// Notes: Template take from Lab Project 1 document.
//
//************************* CECS 301 ****************************************/
module clk_div(clk_in, rst, clk_out);
	input clk_in, rst;
	output reg clk_out;
	integer i;
	
	always @(posedge clk_in or posedge rst) begin
		if (rst == 1'b1) begin
			i = 0; 
			clk_out = 0;
		end //ends if 
		else begin
			i = i + 1;
			if (i >= 100000) begin 
				clk_out = ~clk_out;
				i = 0; 
			end // ends if 
		end // ends else 
	end // ends always
			
endmodule
