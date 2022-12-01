`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2022 11:51:39
// Design Name: 
// Module Name: SPI_2909
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


module SPI_2909( input RESET,
                 input REGSEL,
                 input SIN,
                 input SCLK,
                 input [31:0] MIN,
                 output [31:0] S_SCLK,
                 output [31:0] MOUT,
                 output SOUT );
reg [4:0] scansel;
wire [31:0] decoder_out;
reg [31:0] decoder_out_sync;

assign Master_clk = REGSEL & SCLK;
assign Slave_clk  = (~REGSEL) & SCLK;
assign SIN_master = REGSEL & SIN;
assign SIN_slave = (~REGSEL) & SIN;

assign SOUT_master = REGSEL & scansel[4];
assign SOUT_slave = (~REGSEL) & MIN[scansel];
assign SOUT=SOUT_master | SOUT_slave;
always @(posedge Master_clk or negedge RESET)
begin
  if(!RESET) begin
    scansel=5'b0;
  end else begin
    scansel[4:1]=scansel[3:0];
    scansel[0]  =SIN_master;
  end
end

Decoder5x32 d1(.SEL(scansel), .OUT(decoder_out));

always @(negedge Master_clk or negedge RESET) 
begin
if(!RESET) begin
     decoder_out_sync=32'b0;
  end else begin
    decoder_out_sync=decoder_out;
  end
  
end

MUX s_m0(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[0]),.Out(S_SCLK[0]));
MUX s_m1(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[1]),.Out(S_SCLK[1]));
MUX s_m2(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[2]),.Out(S_SCLK[2]));
MUX s_m3(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[3]),.Out(S_SCLK[3]));
MUX s_m4(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[4]),.Out(S_SCLK[4]));
MUX s_m5(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[5]),.Out(S_SCLK[5]));
MUX s_m6(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[6]),.Out(S_SCLK[6]));
MUX s_m7(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[7]),.Out(S_SCLK[7]));
MUX s_m8(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[8]),.Out(S_SCLK[8]));
MUX s_m9(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[9]),.Out(S_SCLK[9]));
MUX s_m10(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[10]),.Out(S_SCLK[10]));
MUX s_m11(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[11]),.Out(S_SCLK[11]));
MUX s_m12(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[12]),.Out(S_SCLK[12]));
MUX s_m13(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[13]),.Out(S_SCLK[13]));
MUX s_m14(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[14]),.Out(S_SCLK[14]));
MUX s_m15(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[15]),.Out(S_SCLK[15]));
MUX s_m16(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[16]),.Out(S_SCLK[16]));
MUX s_m17(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[17]),.Out(S_SCLK[17]));
MUX s_m18(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[18]),.Out(S_SCLK[18]));
MUX s_m19(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[19]),.Out(S_SCLK[19]));
MUX s_m20(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[20]),.Out(S_SCLK[20]));
MUX s_m21(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[21]),.Out(S_SCLK[21]));
MUX s_m22(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[22]),.Out(S_SCLK[22]));
MUX s_m23(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[23]),.Out(S_SCLK[23]));
MUX s_m24(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[24]),.Out(S_SCLK[24]));
MUX s_m25(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[25]),.Out(S_SCLK[25]));
MUX s_m26(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[26]),.Out(S_SCLK[26]));
MUX s_m27(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[27]),.Out(S_SCLK[27]));
MUX s_m28(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[28]),.Out(S_SCLK[28]));
MUX s_m29(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[29]),.Out(S_SCLK[29]));
MUX s_m30(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[30]),.Out(S_SCLK[30]));
MUX s_m31(.I0(1'b0),.I1(Slave_clk),.Select(decoder_out_sync[31]),.Out(S_SCLK[31]));

MUX m_m0(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[0]),.Out(MOUT[0]));
MUX m_m1(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[1]),.Out(MOUT[1]));
MUX m_m2(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[2]),.Out(MOUT[2]));
MUX m_m3(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[3]),.Out(MOUT[3]));
MUX m_m4(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[4]),.Out(MOUT[4]));
MUX m_m5(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[5]),.Out(MOUT[5]));
MUX m_m6(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[6]),.Out(MOUT[6]));
MUX m_m7(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[7]),.Out(MOUT[7]));
MUX m_m8(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[8]),.Out(MOUT[8]));
MUX m_m9(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[9]),.Out(MOUT[9]));
MUX m_m10(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[10]),.Out(MOUT[10]));
MUX m_m11(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[11]),.Out(MOUT[11]));
MUX m_m12(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[12]),.Out(MOUT[12]));
MUX m_m13(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[13]),.Out(MOUT[13]));
MUX m_m14(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[14]),.Out(MOUT[14]));
MUX m_m15(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[15]),.Out(MOUT[15]));
MUX m_m16(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[16]),.Out(MOUT[16]));
MUX m_m17(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[17]),.Out(MOUT[17]));
MUX m_m18(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[18]),.Out(MOUT[18]));
MUX m_m19(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[19]),.Out(MOUT[19]));
MUX m_m20(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[20]),.Out(MOUT[20]));
MUX m_m21(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[21]),.Out(MOUT[21]));
MUX m_m22(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[22]),.Out(MOUT[22]));
MUX m_m23(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[23]),.Out(MOUT[23]));
MUX m_m24(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[24]),.Out(MOUT[24]));
MUX m_m25(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[25]),.Out(MOUT[25]));
MUX m_m26(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[26]),.Out(MOUT[26]));
MUX m_m27(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[27]),.Out(MOUT[27]));
MUX m_m28(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[28]),.Out(MOUT[28]));
MUX m_m29(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[29]),.Out(MOUT[29]));
MUX m_m30(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[30]),.Out(MOUT[30]));
MUX m_m31(.I0(1'b0),.I1(SIN_slave),.Select(decoder_out_sync[31]),.Out(MOUT[31]));
endmodule
