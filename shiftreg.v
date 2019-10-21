`timescale 1ns / 1ps
//************************* CECS 301 ****************************************/
// File Name: shiftreg.v  
// Project: Shift Register LAB#1
// Create Date:  09/04/2018 
// Designer: Beatriz Juarez
// Email: beatrizmjuarez@gmail.com
// Revision Date: 9/14/2018
// Purpose: Shift register consists of 2-bit input 'm' which decides what 
//			function we will be performing one of the following: 
//			00 NO CHANGE;   01 PARALLEL LOAD;   10 ROTATE RIGHT;   11 SHIFT LEFT (with SI)
//			It also consits of four 4 to 1 muxes and 4 d flip flops. 
//
// 		*** The SI is the serial input which can be either a 0 or 1 and is only used 
//			when shifting left. *** 
// Notes:
// 
//************************* CECS 301 ****************************************/
module shiftreg(clk, rst, si, m, d, q);
	input clk, rst;
	input si; 		// serial input whenever we shift left - not used in rotate 
	input [1:0] m; // determines mode - what function we will preform
	input [3:0] d;
	
	output wire [3:0] q; 
	
	wire w3, w2, w1, w0;	// wires that connect mux to flop
	
	// instantiating 4 instances of the 4 to 1 mux 
	// 					i3, 	i2, 	i1,	i0, 		m, 		q
	mux4to1 m0 (.d({	si, q[1], d[0], q[0]}), .sel(m), .q(w0)),
			  m1 (.d({q[0], q[2], d[1], q[1]}), .sel(m), .q(w1)),
			  m2 (.d({q[1], q[3], d[2], q[2]}), .sel(m), .q(w2)),
			  m3 (.d({q[2], q[0], d[3], q[3]}), .sel(m), .q(w3)); 
	
	// instantiating 4 instances of the dflop
	//				clk, 			rst, 		 d, 		q
	dflop d0 (.clk(clk), .rst(rst), .d(w0), .q(q[0])),
			d1 (.clk(clk), .rst(rst), .d(w1), .q(q[1])),
			d2 (.clk(clk), .rst(rst), .d(w2), .q(q[2])),
			d3 (.clk(clk), .rst(rst), .d(w3), .q(q[3]));

endmodule
