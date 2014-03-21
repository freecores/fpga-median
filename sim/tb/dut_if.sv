// +----------------------------------------------------------------------------
// Universidade Federal da Bahia
//------------------------------------------------------------------------------
// PROJECT: FPGA Median Filter
//------------------------------------------------------------------------------
// FILE NAME            : dut_if.sv
// AUTHOR               : Laue Rami Souza Costa de Jesus
// -----------------------------------------------------------------------------

interface dut_if (input bit clk);

//input signals task 

logic rst_n;
logic start;

logic [7:0] pixel1;
logic [7:0] pixel2;
logic [7:0] pixel3;
logic [7:0] pixel4;

logic [31:0] word0;
logic [31:0] word1;
logic [31:0] word2;

logic [9:0] waddr;
logic [1:0] window_line_counter;

//output signals task

logic [31:0] ch_word0;
logic [31:0] ch_word1;
logic [31:0] ch_word2;

logic end_of_operation;

logic [7:0] result [0:51983];

endinterface
