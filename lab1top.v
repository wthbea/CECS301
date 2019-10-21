`timescale 1ns / 1ps
//************************* CECS 301 ****************************************/
// File Name: lab1top.v  
// Project: Shift Register LAB#1
// Create Date: 09/12/2018   
// Designer: Beatriz Juarez
// Email: beatrizmjuarez@gmail.com
// Revision Date: 9/14/2018
// Purpose: This is the top level module that connects all our other verilog modules together: 
//				clock divider, one shot pulse generator, and the shift register
// 		
// Notes: 
//
//************************* CECS 301 ****************************************/
 module lab1top(clk ,rst, d, m, step, si, q, anode);
	input clk, rst, step, si;
	input [3:0] d;
	input [1:0] m;
	output wire [3:0] q;
	output wire [7:0] anode;
	
	wire w0, w1;
	
	// instantiating the clock division 100MHz to 500Hz
	clk_div cd (.clk_in(clk), .rst(rst), .clk_out(w0));
	
	// instantiating the one-shot pulse 
	one_shot os (.clk_in(w0), .rst(rst), .d_in(step), .d_out(w1)); 
	
	// instantiating the shift register
	shiftreg sr (.clk(w1), .rst(rst), .si(si), .d(d), .m(m), .q(q));

	assign anode = 8'hFF; // anodes used to light up LEDs
	
endmodule
