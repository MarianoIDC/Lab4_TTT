module clock_testbench;

logic clk = 0;
logic divided_clk;


//wrapper
clock_divider testClock (
.clk(clk),
.divided_clk(divided_clk));

always #5 clk = ~clk;


endmodule
