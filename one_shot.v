`timescale 1ns / 1ps
//************************* CECS 301 ****************************************/
// File Name: one_shot.v  
// Project: Shift Register LAB#1
// Create Date:  09/04/2018  
// Designer: Beatriz Juarez
// Email: beatrizmjuarez@gmail.com
// Revision Date: 
// Purpose: Provides a one-shot pulse from a non-clock input , which is our 'd_in'.
//			Since the output of the switch will bounce for a period of time, we are waiting
//			for stabilization of the output. 
//			We do that by shifting in new samples at a predetermined time (20 ms). 
// 		
// Notes: Template taken from Lab Project 1 document. 
//
//************************* CECS 301 ****************************************/
module one_shot(clk_in, rst, d_in, d_out);
	input rst, clk_in, d_in;
	output wire d_out; 
	
	reg q9, q8, q7, q6, q5, q4, q3, q2, q1, q0;
	
	always @(posedge clk_in or posedge rst)
		if (rst == 1'b1) begin 
			{q9, q8, q7, q6, q5, q4, q3, q2, q1, q0} <= 10'b0;
		end // ends if 
		else begin
			// shift in the new sample that is on the D_in input
			q9<=q8; q8<=q7; q7<=q6; q6<=q5; q5<=q4;
			q4<=q3; q3<=q2; q2<=q1; q1<=q0; q0<=d_in;
		end // ends else
	
	// create the debounced, one-shot output pulse
	assign d_out = !q9 & q8 & q7 & q6 & q5 & q4 & q3 & q2 & q1 & q0;

endmodule
