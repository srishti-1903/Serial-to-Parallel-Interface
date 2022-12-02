`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2022 16:06:31
// Design Name: 
// Module Name: FPGA_toSPI2
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


//Verilog HDL for "TEST", "spi_data_gen" "functional"


module FPGA_toSPI2(input SCLK, 
                     input RST,
                     output reg GRST,
                     output reg SIN, 
                     output reg REGSEL,
                     output clk                  
                      );

wire clk;
reg [4:0] SLAVE_SEL[22:0];
reg [5:0] slave_count;
reg [5:0] Count1;
reg [5:0] Count2;

reg [33:0] data [22:0];
reg DONE1,DONE2;
reg sin_done;
reg CLK_OFF,CLK_OFF2;
wire clkby2, clkby4, clkby8, clkby16, clkby32, clkby64, clkby128, clkby256, clkby512, clkby1024;
wire clkby2048, clkby4096, clkby8192, clkby16384, clkby32768, clkby65536, clkby131072;
reg [4:0] Slave[2:0];
reg [29:0] Data[2:0];
reg [2:0] cntr_slave;
reg [4:0] cntr_data;

assign clk_REGSEL=clkby64;

Clk_Div_By2      b1(.CLK_IN(SCLK), .RST(RST), .CLK_OUT(clkby2)); //50MHz
Clk_Div_By2      b2(.CLK_IN(clkby2), .RST(RST), .CLK_OUT(clkby4)); //25MHz
Clk_Div_By2      b3(.CLK_IN(clkby4), .RST(RST), .CLK_OUT(clkby8));//12.5MHz
Clk_Div_By2      b4(.CLK_IN(clkby8), .RST(RST), .CLK_OUT(clkby16));//6.25MHz
Clk_Div_By2      b5(.CLK_IN(clkby16), .RST(RST), .CLK_OUT(clkby32));
Clk_Div_By2      b6(.CLK_IN(clkby32), .RST(RST), .CLK_OUT(clkby64));
Clk_Div_By2      b7(.CLK_IN(clkby64), .RST(RST), .CLK_OUT(clkby128));
Clk_Div_By2      b8(.CLK_IN(clkby128), .RST(RST), .CLK_OUT(clkby256));
Clk_Div_By2      b9(.CLK_IN(clkby256), .RST(RST), .CLK_OUT(clkby512));
Clk_Div_By2      b10(.CLK_IN(clkby512), .RST(RST), .CLK_OUT(clkby1024));
Clk_Div_By2      b12(.CLK_IN(clkby1024), .RST(RST), .CLK_OUT(clkby2048));
Clk_Div_By2      b13(.CLK_IN(clkby2048), .RST(RST), .CLK_OUT(clkby4096));
Clk_Div_By2      b14(.CLK_IN(clkby4096), .RST(RST), .CLK_OUT(clkby8192));
Clk_Div_By2      b15(.CLK_IN(clkby8192), .RST(RST), .CLK_OUT(clkby16384)); //6kHz
Clk_Div_By2      b16(.CLK_IN(clkby16384), .RST(RST), .CLK_OUT(clkby32768)); //3kHz
Clk_Div_By2      b17(.CLK_IN(clkby32768), .RST(RST), .CLK_OUT(clkby65536)); //1.5kHz
Clk_Div_By2      b18(.CLK_IN(clkby65536), .RST(RST), .CLK_OUT(clkby131072));//763Hz

always @(negedge clk_REGSEL  or negedge RST)
begin
  if(!RST)
  begin
    Count1=6'b0;
    DONE1=0;
  end else begin
    if(Count1==6'd63)
    begin
      Count1=6'd63;
      DONE1=1;
    end else begin
      Count1=Count1+1'b1;
      DONE1=0;
    end
  end
end

always @(negedge clk_REGSEL  or negedge RST)
begin
  if(!DONE1 && !sin_done)
  begin
    Count2=6'b0;
   
  end else begin
    if(Count2==6'd63)
    begin
      if(sin_done)
        Count2=Count2+1'b1;
      else
        Count2=6'd63;
     
    end else begin
      
      Count2=Count2+1'b1;
     
    end
  end
end
always @(negedge clkby256 or negedge RST)
begin
   if(!RST) begin
     sin_done=0;
   
   end else begin
     if( cntr_data>=6'd30) 
     begin        
       sin_done=1;
       
     end else begin
       sin_done=0;
      
     end
   end
end

always @(posedge clk_REGSEL or negedge RST)
begin
  if(!RST)
  begin
    GRST=1;
  end else begin   
     if(Count1>=6'd40)
     begin
       GRST=0; //For normal operation
     end else begin
       GRST=1; //For resetting entire chip
     end
  end
end

always @(posedge clk_REGSEL or negedge RST)
begin
  if(!RST)
  begin
    REGSEL=0;
  end else begin
    if(Count2>=6'd8&&Count2<=6'd27)
    begin
      REGSEL=1; //For selecting slave
    end else begin
      REGSEL=0; //For writing data into slave or no-op
    end 
  end
end

always @(posedge sin_done or negedge RST)
begin
  if(!RST) begin
      slave_count  = 6'd0;
  end else begin
    slave_count  = slave_count+1'b1;
  end
end

wire RESET = GRST|(~RST);
assign clk=(~CLK_OFF)&clkby256;

always @(negedge clkby256 or negedge RESET)
begin
  if(RESET) begin
    SIN=0;
    cntr_slave=3'd0;
    cntr_data=4'd0;
    CLK_OFF=0;
    Slave[0]=5'd10;
    Data[0]=30'd35;
    Slave[1]=5'd22;
    Data[1]=30'd2;
    Slave[2]=5'd16;
    Data[2]=30'd100;
  end else begin
    if(Count2>=6'd7 && Count2<=6'd24) begin
      SIN=Slave[slave_count][4-cntr_slave];
      cntr_slave=cntr_slave+1'b1;
      cntr_data=4'd0;
      CLK_OFF=0;
    end else begin
      if(cntr_data<5'd30)
      begin
        SIN=Data[slave_count][cntr_data];
        cntr_slave=3'd0;
        cntr_data=cntr_data+1'b1;
        CLK_OFF=0;
      end else begin
        SIN=0;
        cntr_slave=3'd0;
        cntr_data=5'd30;
        CLK_OFF=1;
      end
    end
  end
end

endmodule

