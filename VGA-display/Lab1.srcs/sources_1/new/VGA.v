`timescale 1ns / 1ps

module vga_wrapper(
	input clk,
	input rst,
	output HDMI_CLK_N,
	output HDMI_CLK_P,
	output  [2:0]HDMI_D_N,
	output  [2:0]HDMI_D_P
);

	wire clk_25MHz, clk_125MHz;
	wire locked;
	wire hsync, vsync, vde;
	wire [7:0] red, green, blue;
	wire [9:0] x_pix, y_pix;
    
    assign red = 255;
    assign green = 255;
    assign blue = 255;
    
	//clock wizard configured with a 1x and 5x clock
	clk_wiz_0 clk_wiz (
		.clk_out1(clk_25MHz),
		.clk_out2(clk_125MHz),
		.reset(rst),
		.locked(locked),
		.clk_in1(clk)
	);


	//VGA Sync signal generator
	vga_sync vga (
		.clk(clk_25MHz),
		.rst(rst),
		.hsync(hsync),
		.vsync(vsync),
		.video_active(vde),
		.px(x_pix),
		.py(y_pix)
	);


	//Real Digital VGA to HDMI converter
	hdmi_tx_0 vga_to_hdmi (
		//Clocking and Reset
		.pix_clk(clk_25MHz),
		.pix_clkx5(clk_125MHz),
		.pix_clk_locked(locked),
		//Reset is active HIGH
		.rst(rst),

		//Color and Sync Signals
		.red(red),
		.green(green),
		.blue(blue),
		.hsync(hsync),
		.vsync(vsync),
		.vde(vde),

		//aux Data (unused)
		.aux0_din(4'b0),
		.aux1_din(4'b0),
		.aux2_din(4'b0),
		.ade(1'b0),

		//Differential outputs
		.TMDS_CLK_P(HDMI_CLK_P),          
		.TMDS_CLK_N(HDMI_CLK_N),          
		.TMDS_DATA_P(HDMI_D_P),         
		.TMDS_DATA_N(HDMI_D_N)          
	);
	
endmodule

module vga_sync(
    input clk, rst,
    input [9:0] px,py,
    output video_active, hsync, vsync
);
  wire b_en;
bin_count #(
		.MAX_COUNT(799),
		.WIDTH(10) 
	)
	cntrA(
		.rst(rst),
		.clk(clk),
		.cen(1),
		.out(px)
	);

bin_count #(
		.MAX_COUNT(524),
		.WIDTH(10) 
	)
	cntrB(
		.rst(rst),
		.clk(clk),
		.cen(b_en),
		.out(py)
	);

assign b_en = (px == 799);
assign hsync = px < 96;
assign vsync = py < 2;
assign video_activate =( (px > 143) & (px < 784) && (py > 34) & (py < 515));
       
endmodule



