`timescale 1ns/1ns

module test16_top ()	;
	reg [15:0] in_A, in_B;
	reg in_C;
	
	wire [15:0] w_S;
	wire w_C;
	
	Adder16 U0 ( .in_A(in_A), .in_B(in_B), .in_C(in_C), .out_S(w_S), .out_C(w_C) );
	
	initial begin
		in_A <= 16'b0000000000000000;
		in_B <= 16'b0000000000000000;
		in_C <= 1'b0;		 
		
		#10
		in_A <= 16'b0000000000000000;
		in_B <= 16'b0000000000000000;
		in_C <= 1'b1;
		
		#10
		in_A <= 16'b0000000000000001;
		in_B <= 16'b0000000000000001;
		in_C <= 1'b0	  ;
		
		#10
		in_A <= 16'b1111111111111111;
		in_B <= 16'b0000000000000000;
		in_C <= 1'b1	   ;
		
		#10
		in_A <= 16'b1111111111111111;
		in_B <= 16'b1111111111111111;
		in_C <= 1'b0	 ;
		
		#10
		in_A <= 16'b1111111111111111;
		in_B <= 16'b1111111111111111;
		in_C <= 1'b1   	;
	end
endmodule		