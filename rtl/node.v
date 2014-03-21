// +----------------------------------------------------------------------------
// Universidade Federal da Bahia
//------------------------------------------------------------------------------
// PROJECT: FPGA Median Filter
//------------------------------------------------------------------------------
// FILE NAME            : node.v
// AUTHOR               : João Carlos Bittencourt
// AUTHOR'S E-MAIL      : joaocarlos@ieee.org
// -----------------------------------------------------------------------------
// RELEASE HISTORY
// VERSION  DATE        AUTHOR        DESCRIPTION
// 1.0      2013-08-13  joao.nunes    initial version
// -----------------------------------------------------------------------------
// KEYWORDS: comparator, low, hight, median
// -----------------------------------------------------------------------------
// PURPOSE: Compare two input values and return the low and high values.
// -----------------------------------------------------------------------------
module node
#(
    parameter DATA_WIDTH = 8,
    parameter LOW_MUX = 1, // disable low output
    parameter HI_MUX = 1 // disable hight output
)(
    input [DATA_WIDTH-1:0] data_a,
    input [DATA_WIDTH-1:0] data_b,

    output reg [DATA_WIDTH-1:0] data_hi,
    output reg [DATA_WIDTH-1:0] data_lo
);


    reg sel0;

    always @(*)
    begin : comparator
        if(data_a < data_b) begin
            sel0 = 1'b0; // data_a : lo / data_b : hi
        end else begin
            sel0 = 1'b1; // data_b : lo / data_a : hi
        end
    end


    always @(*)
    begin : mux_lo_hi
        case (sel0)
            1'b0 :
            begin
                if(LOW_MUX == 1)
                    data_lo = data_a;
                if(HI_MUX == 1)
                    data_hi = data_b;
            end
            1'b1 :
            begin
                if(LOW_MUX == 1)
                    data_lo = data_b;
                if(HI_MUX == 1)
                    data_hi = data_a;
            end
            default :
            begin
                data_lo = {DATA_WIDTH{1'b0}};
                data_hi = {DATA_WIDTH{1'b0}};
            end
        endcase
    end

endmodule