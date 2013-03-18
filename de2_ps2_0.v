// de2_ps2_0.v

// Generated using ACDS version 12.1 177 at 2013.03.18.14:34:57

`timescale 1 ps / 1 ps
module de2_ps2_0 (
		input  wire       avs_s1_chipselect, // avalon_slave_0.chipselect
		output wire [7:0] avs_s1_readdata,   //               .readdata
		input  wire       avs_s1_read,       //               .read
		input  wire       avs_s1_reset,      //     clock_sink.reset
		input  wire       avs_s1_clk,        //               .clk
		input  wire       PS2_Clk,           //    conduit_end.export
		input  wire       PS2_Data           //               .export
	);

	de2_ps2 de2_ps2_0_inst (
		.avs_s1_chipselect (avs_s1_chipselect), // avalon_slave_0.chipselect
		.avs_s1_readdata   (avs_s1_readdata),   //               .readdata
		.avs_s1_read       (avs_s1_read),       //               .read
		.avs_s1_reset      (avs_s1_reset),      //     clock_sink.reset
		.avs_s1_clk        (avs_s1_clk),        //               .clk
		.PS2_Clk           (PS2_Clk),           //    conduit_end.export
		.PS2_Data          (PS2_Data)           //               .export
	);

endmodule
