module vga_controller(
	
	input logic clk,
	output logic Hsynq,
	output logic Vsynq,
	output logic [7:0] Red,
	output logic [7:0] Green,
	output logic [7:0] Blue, 
	output logic clk_vga
	);
	
logic clk_25M;	
clock_divider VGA_Clock_gen (clk, clk_25M);

vga_controller_final vcg (clk_25M, Hsynq, Vsynq, clk_vga, Red, Green, Blue); 

endmodule
