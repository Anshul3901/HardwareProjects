//-----------------------------------------------------------------------------
//
// Title       : KGA
// Design      : KSA8
// Author      : Anshul391
// Company     : Washington State University
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\anshu\OneDrive\Desktop\School\EE466\Hw2\KSA8\src\KGA.v
// Generated   : Thu Sep 28 13:59:06 2023
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {KGA}}
module KGA (
    input [7:0] A,
    input [7:0] B,
	input in_C,
    output [7:0] S ,
	output out_C
);

wire [7:0] G;
wire [7:0] P;
wire [7:0] C;	 

assign G[0] = A[0] & B[0];
assign G[1] = A[1] & B[1];	
assign G[2] = A[2] & B[2];
assign G[3] = A[3] & B[3];
assign G[4] = A[4] & B[4];
assign G[5] = A[5] & B[5];
assign G[6] = A[6] & B[6];
assign G[7] = A[7] & B[7];	  

assign P[0] = A[0] ^ B[0];	
assign P[1] = A[1] ^ B[1];
assign P[2] = A[2] ^ B[2];
assign P[3] = A[3] ^ B[3];
assign P[4] = A[4] ^ B[4];
assign P[5] = A[5] ^ B[5];
assign P[6] = A[6] ^ B[6];
assign P[7] = A[7] ^ B[7];	

assign C[1] = G[0] | P[0] & in_C;
assign C[2] = G[1] | P[1] & G[0] | P[1] & P[0] & in_C;
assign C[3] = G[2] | P[2] & G[1] | P[2] & P[1] & G[0] | P[2] & P[1] & P[0] & in_C;
assign C[4] = G[3] | P[3] & G[2] | P[3] & P[2]	& G[1] | P[3] & P[2] & P[1] & G[0] | P[3] & P[2] & P[1] & P[0] & in_C;
assign C[5] = G[4] | P[4] & G[3] | P[4] & P[3] & G[2] | P[4] & P[3] & P[2] & G[1] | P[4] & P[3] & P[2] & P[1] & G[0] | P[4] & P[3] & P[2] & P[1] & P[0] & in_C;
assign C[6] = G[5] | P[5] & G[4] | P[5] & P[4] & G[3] | P[5] & P[4] & P[3] & G[2] | P[5] & P[4] & P[3] & P[2] & G[1] | P[5] & P[4] & P[3] & P[2] & P[1] & G[0] | P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & in_C;
assign C[7] = G[6] | P[6] & G[5] | P[6] & P[5] & G[4] | P[6] & P[5] & P[4] & G[3] | P[6] & P[5] & P[4] & P[3] & G[2] | P[6] & P[5] & P[4] & P[3] & P[2] & G[1] | P[5] & P[4] & P[3] & P[2] & P[1] & G[0] | P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & P[0] & in_C;

assign S[0] = P[0] ^ in_C;     
assign S[1] = P[1] ^ C[1];	
assign S[2] = P[2] ^ C[2];
assign S[3] = P[3] ^ C[3];
assign S[4] = P[4] ^ C[4];
assign S[5] = P[5] ^ C[5];
assign S[6] = P[6] ^ C[6];
assign S[7] = P[7] ^ C[7]; 

assign out_C = G[7] | P[7] & C[7];

endmodule

//}} End of automatically maintained section

// -- Enter your statements here -- // 
	   
