`timescale 1ns/1ns

module test16_top ()	;
	reg [7:0] in_A, in_B;
	reg in_C;
	
	wire [7:0] out_S;
	wire out_C; 
	
	KGA U0 (.A(in_A), .B(in_B), .in_C(in_C), .S(out_S), .out_C(out_C))   	  ;
	
	initial begin
		in_A <= 8'b00000000;
		in_B <= 8'b00000000;
		in_C <= 1'b0;		 
		
		#10
		in_A <= 8'b00000000;
		in_B <= 8'b00000000;
		in_C <= 1'b1;
		
		#10
		in_A <= 8'b00000001;
		in_B <= 8'b00000001;
		in_C <= 1'b0;	  
		
		#10
		in_A <= 8'b11111111;
		in_B <= 8'b00000000;
		in_C <= 1'b1;	   
		
		#10
		in_A <= 8'b11111111;
		in_B <= 8'b11111111;
		in_C <= 1'b0	 ;
		
		#10
		in_A <= 8'b11111111;
		in_B <= 8'b11111111;
		in_C <= 1'b1   	;
	end
endmodule		
	