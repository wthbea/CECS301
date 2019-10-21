`timescale 1ns / 1ps
//************************* CECS 301 ****************************************/
// File Name: shiftreg_tf.v  
// Project: Shift Register LAB#1
// Create Date:  09/05/2018 
// Designer: Beatriz Juarez
// Email: beatrizmjuarez@gmail.com
// Revision Date: 9/14/2017
// Purpose: Implementing the shift register. 
//
// Notes:
// 
//************************* CECS 301 ****************************************/
module shiftreg_tf;

	// Inputs
	reg clk;
	reg rst;
	reg si;
	reg [1:0] m;
	reg [3:0] d;


	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	shiftreg uut (.clk(clk), .rst(rst), .m(m), .si(si), .d(d), .q(q));
		
	// Generate Clock with a 10 ns period
	always 
		#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		$timeformat(-9, 1, "ns", 6);
		clk = 0;
		rst = 0;
		si = 0;
		m = 0;
		d = 0;
		
		// these two clocks take car of our rst. 
		@(negedge clk)
			rst = 1;
		@(negedge clk)
			rst = 0;
			
		// "load" function with D = 0xB (1011). *SI is don't care.
		@(negedge clk)
			{rst, m, d, si} = 8'b0_01_1011_x;
		// "no change" function. *D and SI are don't care.
		@(negedge clk)
			{rst, m, d, si} = 8'b0_00_xxxx_x;
		// "shift left" function with SI = 0. *D is don't care.
		@(negedge clk)
			{rst, m, d, si} = 8'b0_11_xxxx_0;
		// "shift left" function with SI = 1. *D is don't care.
		@(negedge clk)	
			{rst, m, d, si} = 8'b0_11_xxxx_1;
		// "no change" function. *D and SI are don't care.
		@(negedge clk)
			{rst, m, d, si} = 8'b0_00_xxxx_x;
		// "rotate right" function. *D and SI are don't care.
		@(negedge clk)
			{rst, m, d, si} = 8'b0_10_xxxx_x;
		// "rotate right" function. *D and SI are don't care.
		@(negedge clk)
			{rst, m, d, si} = 8'b0_10_xxxx_x;
		// "no change" function. *D and SI are don't care.
			{rst, m, d, si} = 8'b0_00_xxxx_x;
			
		$finish;	
	end  
endmodule

