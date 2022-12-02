`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2022 18:05:15
// Design Name: 
// Module Name: tb_FPGA_SPI_TOP
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


module tb_FPGA_SPI_TOP();
reg SCLK;
reg RST;
reg [31:0] MIN;
wire [31:0] S_SCLK;
wire SOUT;
wire [31:0] MOUT;
wire SIN,GRST,REGSEL;
wire clk;
reg [31:0] MIN;
FPGA_SPI_TOP s(SCLK,RST,S_SCLK,SOUT,MOUT,MIN, SIN, GRST, REGSEL,clk);
initial begin
  SCLK=0;
  MIN=31'b11111111111111111111111111111111;
  RST=0;
  #2000 RST=1;
   #300000 $finish;
end
always #5 SCLK=~SCLK;

endmodule
