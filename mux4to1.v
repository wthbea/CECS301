`timescale 1ns / 1ps
//************************* CECS 301 ****************************************/
// File Name: mux4to1.v  
// Project: Shift Register LAB#1
// Create Date:  09/01/2018 
// Designer: Beatriz Juarez
// Email: beatrizmjuarez@gmail.com
// Revision Date: 9/14/2018
// Purpose: This is the decision logic behind the shift registor. This mux
// 		selects one input, depending on our 2-bit 'sel' input, drives it 
//			to the output and will be wired to our D-flop input in the shift
//			register.
//
// Notes:
//************************* CECS 301 ****************************************/
module mux4to1(d, sel, q);
	input [3:0] d; 		// the 4 different inputs
	input [1:0] sel;		// represents the mode
	output reg q;
	
	always @(*)
		case(sel)
			2'b00 : q = d[0];
			2'b01 : q = d[1];
			2'b10 : q = d[2];
			2'b11 : q = d[3];
			default : q = 1'bx; // dont care
		endcase

endmodule
