`timescale 1ns / 1ps
//************************* CECS 301 ****************************************/
// File Name: dflop.v  
// Project: Shift Register LAB#1
// Create Date:  09/04/2018  
// Designer: Beatriz Juarez
// Email: beatrizmjuarez@gmail.com
// Revision Date: 9/14/2018
// Purpose: This D-flop will take in an input (coming from the output of the 
//			4 to 1 mux) drive it to the output (unless reset is active) and will 
// 		be assigned to a new input bit on the mux.
//
// Notes:
//
//************************* CECS 301 ****************************************/
module dflop(clk, rst, d, q);
	input clk, rst, d;
	output reg q;

// when rst is at 1, Q will be set to 0. when rst is at 0, Q will get the same value as D.
	always @(posedge clk, posedge rst)
		if (rst)
			q<=1'b0;
		else 
			q<=d;

endmodule
