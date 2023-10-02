module Adder16(in_A, in_B, in_C, out_S, out_C);
	input [15:0] in_A, in_B;
	input in_C;
	output [15:0] out_S;
	output out_C;
	
	wire mux_S, out_C1, out_C2;
	wire [7:0] out_RA2, out_RA3;
	
	CarrySelect8 Adder1 (.in_A(in_A[7:0]), .in_B(in_B[7:0]), .in_C(in_C), .out_S(out_S[7:0]), .out_C(mux_S) );
	CarrySelect8 Adder2 (.in_A(in_A[15:8]), .in_B(in_B[15:8]), .in_C(1'b0), .out_S(out_RA2), .out_C(out_C1) );
	CarrySelect8 Adder3 (.in_A(in_A[15:8]), .in_B(in_B[15:8]), .in_C(1'b1), .out_S(out_RA3), .out_C(out_C2) );
	mux MUX_S8 (.in_A(out_RA2[0]), .in_B(out_RA3[0]), .in_S(mux_S), .out_R(out_S[8]) ); 
	mux MUX_S9 (.in_A(out_RA2[1]), .in_B(out_RA3[1]), .in_S(mux_S), .out_R(out_S[9]) );
	mux MUX_S10 (.in_A(out_RA2[2]), .in_B(out_RA3[2]), .in_S(mux_S), .out_R(out_S[10]) );
	mux MUX_S11 (.in_A(out_RA2[3]), .in_B(out_RA3[3]), .in_S(mux_S), .out_R(out_S[11]) );   
	mux MUX_S12 (.in_A(out_RA2[4]), .in_B(out_RA3[4]), .in_S(mux_S), .out_R(out_S[12]) ); 
	mux MUX_S13 (.in_A(out_RA2[5]), .in_B(out_RA3[5]), .in_S(mux_S), .out_R(out_S[13]) );
	mux MUX_S14 (.in_A(out_RA2[6]), .in_B(out_RA3[6]), .in_S(mux_S), .out_R(out_S[14]) );
	mux MUX_S15 (.in_A(out_RA2[7]), .in_B(out_RA3[7]), .in_S(mux_S), .out_R(out_S[15]) );
	mux MUX_C (.in_A(out_C1), .in_B(out_C2), .in_S(mux_S), .out_R(out_C) );
endmodule