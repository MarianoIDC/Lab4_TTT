module tb_VGA_controller;

logic clk = 0;
logic Hsynq;
logic Vsynq;
logic [3:0] Red;
logic [3:0] Green;
logic [3:0] Blue;

vga_controller test (clk, Hsynq, Vsynq, Red, Green, Blue);

always #5 clk = ~clk;

endmodule
