`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2022 10:14:44
// Design Name: 
// Module Name: Clk_Div_By2
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


//Divides Input clock frequency by 2
module Clk_Div_By2( input CLK_IN,
                    input RST,
                    output reg CLK_OUT
                    );
always @(posedge CLK_IN or negedge RST)
begin
  if(!RST)
     CLK_OUT<=0;
  else    
     CLK_OUT<=~CLK_OUT;
  end
endmodule
