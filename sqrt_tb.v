`timescale 1ns/1ps
`define D 10
`include "sqrt.v"
module sqrt_tb();
    parameter finishtime = 600;
    
    reg start, clk, clear;
    reg [6:0] num;
    wire ready;
    wire [3:0] result;
    
    sqrt_Top s1 (
	.start(start), .clk(clk), .clear(clear), .num(num), .ready(ready), .result(result)
	);
    
    initial begin
    #0 
    start=1; 
    clear=1; 
    clk=0; 
    num=7'b0000010; 
	#`D clear=0;
	#100 
    start=0; 
    clear=1;
    num=7'b0011001;//Decimal=25
	#`D clear=0;
	#`D start=1;
    end
    
    always
	#`D clk=~clk;

    initial begin
	#finishtime $finish;    
    end

endmodule
