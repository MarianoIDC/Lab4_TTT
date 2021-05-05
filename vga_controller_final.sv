module vga_controller_final(
	input  logic CLK_IN,           // 25 MHz
	output logic o_hsync,      // horizontal sync
   output logic o_vsync,       // vertical sync
   output logic CLK_OUT,
   output logic [7:0] red,
   output logic [7:0] blue,
   output logic [7:0] green );

	
	logic [9:0]  counterX = 0;
	logic [9:0]  counterY = 0;
	
	
	
	
	always@(posedge CLK_IN) begin
	
		if (counterX < 799) begin
			counterX <= counterX +1;	
		end
		else begin
			counterX <= 0; 
		end
	end


	always@(posedge CLK_IN) begin
		if (counterX == 799) begin
			if (counterY < 525) 
				counterY <= counterY +1;
			else counterY <= 0; 
		end
	end
	
	assign o_hsync = (counterX < 96) ? 1'b1:1'b0;
	assign o_vsync = (counterY < 2) ? 1'b1:1'b0;
	
	assign CLK_OUT = CLK_IN;
	
	assign Red = (counterX < 783 && counterX > 144 && counterY < 514 && counterY > 35) ? 8'hF:8'h0; 
	assign Green = (counterX < 783 && counterX > 144 && counterY < 514 && counterY > 35) ? 8'hF:8'h0; 
	assign Blue = (counterX < 783 && counterX > 144 && counterY < 514 && counterY > 35) ? 8'hF:8'h0; 

		

endmodule