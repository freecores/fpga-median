//*******************************************************************//
//-------------------------------------------------------------------//
// File name            : dual_port_ram.v
// File contents        : Parameterized memory for syncronous fifo     
//
// Design Engineer      : Igor Dantas
// Last Changed         : 10/27/2008 09:00
//-------------------------------------------------------------------//
//*******************************************************************//

`timescale 1ns/10ps

module dual_port_ram 
#(
   parameter MEMFILE = "",
   parameter DATA_WIDTH = 'd32,
   parameter ADDR_WIDTH = 14
)
(
   input clk, 
   input r_ena,
   input w_ena, 
   input [DATA_WIDTH-1:0] w_data, 
   input [ADDR_WIDTH-1:0] w_addr, 
   input [ADDR_WIDTH-1:0] r_addr,
   output reg [DATA_WIDTH-1:0] r_data 
);

//The Register memory
reg [DATA_WIDTH-1:0] mem[0:2**ADDR_WIDTH-1];
// synchronous read and write when enabled
always @ (posedge clk) begin
   if (w_ena)  mem[w_addr] <=  w_data;
   if (r_ena) r_data <= mem[r_addr];
end

initial $readmemh(MEMFILE, mem);


endmodule

