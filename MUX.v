`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2021 11:20:15 AM
// Design Name: 
// Module Name: MUX
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


module MUX(input I0, input I1, input Select, output reg Out);
always @(I0,I1,Select,Out)
begin
  if(Select) begin
    Out<=I1;
  end else begin
    Out<=I0;
  end
end
endmodule
