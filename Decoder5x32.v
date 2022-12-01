`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2021 02:33:21 PM
// Design Name: 
// Module Name: GAURI_decoder_5b
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


module GAURI_decoder_5b(SEL, OUT);  
  input [4:0] SEL;  
  output reg [31:0] OUT;  
  
 
  always @(SEL or OUT)  
  begin 

    case (SEL)   
      5'b00000 :begin OUT = 32'h1; end  
      5'b00001 :begin OUT = 32'h2 ;end  
      5'b00010 :begin OUT = 32'h4 ;end  
      5'b00011 :begin OUT = 32'h8 ;end  
      5'b00100 :begin OUT = 32'h10; end  
      5'b00101 :begin OUT = 32'h20 ;end  
      5'b00110 :begin OUT = 32'h40 ;end  
      5'b00111 :begin OUT = 32'h80 ;end  
      5'b01000 :begin OUT = 32'h100; end  
      5'b01001 :begin OUT = 32'h200 ;end  
      5'b01010 :begin OUT = 32'h400 ;end  
      5'b01011 :begin OUT = 32'h800 ;end  
      5'b01100 :begin OUT = 32'h1000; end  
      5'b01101 :begin OUT = 32'h2000 ;end  
      5'b01110 :begin OUT = 32'h4000 ;end  
      5'b01111 :begin OUT = 32'h8000;end 
      5'b10000 :begin OUT = 32'h10000; end  
      5'b10001 :begin OUT = 32'h20000 ;end  
      5'b10010 :begin OUT = 32'h40000 ;end  
      5'b10011 :begin OUT = 32'h80000 ;end  
      5'b10100 :begin OUT = 32'h100000; end  
      5'b10101 :begin OUT = 32'h200000 ;end  
      5'b10110 :begin OUT = 32'h400000 ;end  
      5'b10111 :begin OUT = 32'h800000 ;end  
      5'b11000 :begin OUT = 32'h1000000; end  
      5'b11001 :begin OUT = 32'h2000000;end  
      5'b11010 :begin OUT = 32'h4000000 ;end  
      5'b11011 :begin OUT = 32'h8000000 ;end  
      5'b11100 :begin OUT = 32'h10000000; end  
      5'b11101 :begin OUT = 32'h20000000 ;end  
      5'b11110 :begin OUT = 32'h40000000 ;end  
      5'b11111 :begin OUT = 32'h80000000;end   
      
     endcase  
  end  
endmodule

