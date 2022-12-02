`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2022 17:42:44
// Design Name: 
// Module Name: FPGA_SPI_TOP
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
 

module FPGA_SPI_TOP(input SCLK, input RST, output [31:0] S_SCLK, output SOUT, output [31:0] MOUT, input [31:0] MIN, output SIN, output GRST, output REGSEL,output clk);

FPGA_toSPI a1(.SCLK(SCLK), .RST(RST), .GRST(GRST), .SIN(SIN), .REGSEL(REGSEL), .clk(clk)); 
   
SPI a2( .RESET(~GRST), .REGSEL(REGSEL), .SIN(SIN), .SCLK(clk),.MIN(MIN), .S_SCLK(S_SCLK), .MOUT(MOUT), .SOUT(SOUT) );                   
endmodule
