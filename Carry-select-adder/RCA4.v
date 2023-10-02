// Full Adder
module FA (in_A, in_B, in_C, out_S, out_C);
	input in_A, in_B, in_C;
	output out_S, out_C;
	
	assign out_S = in_A ^ in_B ^  in_C;
	assign out_C = (in_A & in_B) | (in_B & in_C) | (in_C & in_A);
endmodule

//2:1 MUX
module mux(in_A, in_B, in_S, out_R);
	input in_A, in_B, in_S;
	output out_R;
	
	assign out_R = (in_S == 1'b0) ? in_A : in_B;
endmodule

//4-bit Ripple-Carry Adder
module RCA4 (in_A, in_B, in_C, out_S, out_C);
	input [3:0] in_A, in_B;
	input in_C;
	output [3:0] out_S;
	output out_C;
	
	wire w_c1, w_c2, w_c3;
	
	FA U0 (.in_A(in_A[0]), .in_B(in_B[0]), .in_C(in_C), .out_S(out_S[0]), .out_C(w_c1) );							 
	FA U1 (.in_A(in_A[1]), .in_B(in_B[1]), .in_C(w_c1), .out_S(out_S[1]), .out_C(w_c2));
	FA U2 (.in_A(in_A[2]), .in_B(in_B[2]), .in_C(w_c2), .out_S(out_S[2]), .out_C(w_c3));
	FA U3 (.in_A(in_A[3]), .in_B(in_B[3]), .in_C(w_c3), .out_S(out_S[3]), .out_C(out_C));					  
endmodule