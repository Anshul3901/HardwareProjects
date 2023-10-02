`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 02:09:34 AM
// Design Name: 
// Module Name: vga_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_sim;
    reg clk;
	reg rst;
	wire HDMI_CLK_N;
	wire HDMI_CLK_P;
	wire  [2:0]HDMI_D_N;
	wire  [2:0]HDMI_D_P;
	
	vga_wrapper wrap(
	   .clk(clk),
	   .rst(rst),
	   .HDMI_CLK_P(HDMI_CLK_P),
	   .HDMI_CLK_N(HDMI_CLK_N),
	   .HDMI_D_N(HDMI_D_N),
	   .HDMI_D_P(HDMI_D_P)
	);
	
	initial
 begin 
     rst = 1'b1;
     clk = 1'b1;
     #20
     clk = 1'b0;
     rst = 1'b0;
 end
 always
  #20 clk = !clk;
 
endmodule
