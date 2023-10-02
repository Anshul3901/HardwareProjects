module CarrySelect8(in_A, in_B, in_C, out_S, out_C);
	input [7:0] in_A, in_B;
	input in_C;
	output [7:0] out_S;
	output out_C;
	
	wire mux_S, out_C1, out_C2;
	wire [3:0] out_RA2, out_RA3;
	
	RCA4 Adder1 (.in_A(in_A[3:0]), .in_B(in_B[3:0]), .in_C(in_C), .out_S(out_S[3:0]), .out_C(mux_S) );
	RCA4 Adder2 (.in_A(in_A[7:4]), .in_B(in_B[7:4]), .in_C(1'b0), .out_S(out_RA2), .out_C(out_C1) );
	RCA4 Adder3 (.in_A(in_A[7:4]), .in_B(in_B[7:4]), .in_C(1'b1), .out_S(out_RA3), .out_C(out_C2) );
	mux MUX_S4 (.in_A(out_RA2[0]), .in_B(out_RA3[0]), .in_S(mux_S), .out_R(out_S[4]) ); 
	mux MUX_S5 (.in_A(out_RA2[1]), .in_B(out_RA3[1]), .in_S(mux_S), .out_R(out_S[5]) );
	mux MUX_S6 (.in_A(out_RA2[2]), .in_B(out_RA3[2]), .in_S(mux_S), .out_R(out_S[6]) );
	mux MUX_S7 (.in_A(out_RA2[3]), .in_B(out_RA3[3]), .in_S(mux_S), .out_R(out_S[7]) );
	mux MUX_C (.in_A(out_C1), .in_B(out_C2), .in_S(mux_S), .out_R(out_C) );
endmodule