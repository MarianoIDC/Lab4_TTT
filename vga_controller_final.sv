module vga_controller_final(
	input logic CLK_IN,	// 25 MHz
	input logic RST, 
	output logic o_hsync,      // horizontal sync
   output logic o_vsync,       // vertical sync
   output logic CLK_OUT,
	output logic BLANK, 
	output logic SYNC,
   output logic [7:0] R,
   output logic [7:0] G,
   output logic [7:0] B );

	
	parameter int HD = 640;
	parameter int HFP = 16;
	parameter int HSP = 96;
	parameter int HBP = 48;
	
	parameter int VD = 480;
	parameter int VFP = 10;
	parameter int VSP = 2;
	parameter int VBP = 33;
	
	
	logic de = 0;
	
		
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
	
	//assign Red = (counterX < 784 && counterX > 143 && counterY < 515 && counterY > 34) ? 8'b11111111:8'b00000000; 
	//assign Green = (counterX < 784 && counterX > 143 && counterY < 515 && counterY > 34) ? 8'b11111111:8'b00000000; 
	//assign Blue = (counterX < 784 && counterX > 143 && counterY < 515 && counterY > 34) ? 8'b11111111:8'b00000000; 
	// video_on
  always_ff @(posedge CLK_IN, negedge RST)
    if (~RST)
      begin
        de    <= 0;
        BLANK <= 0;
      end
    else if (CLK_IN)
      begin
        if(counterX < HD && counterY < VD)
          de <= 1;
        else
          de <= 0;
        BLANK <= de; // delay one clock to align with pixel data
      end
    
  // draw
  always_ff @(posedge CLK_IN, negedge RST)
    if (~RST)
      begin
        R <= 8'b00000000;
        G <= 8'b00000000;
        B <= 8'b00000000;
      end
    else if (CLK_IN)  
      begin 
        
        // Si [0][0] y 0
        // Entonces dibujar en el primer cuadro una
		  // Lineas l en la primer fila
        if (counterX>105 && counterX<110 && counterY>30 && counterY<130)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
        else if(counterX>320 && counterX<325 && counterY>30 && counterY<130)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
        else if(counterX>535 && counterX<540 && counterY>30 && counterY<130)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
        
        // Lineas l en la segunda fila
        else if(counterX>105 && counterX<110 && counterY>192 && counterY<292)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
        else if(counterX>320 && counterX<325 && counterY>192 && counterY<292)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
        else if(counterX>535 && counterX<540 && counterY>192 && counterY<292)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
         
        // Lineas l en la tercer fila
        else if(counterX>105 && counterX<110 && counterY>349 && counterY<449)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
        else if(counterX>320 && counterX<325 && counterY>349 && counterY<449)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
        else if(counterX>535 && counterX<540 && counterY>349 && counterY<449)
            begin
              R <= 8'b11111111;
              G <= 8'b00000000;
              B <= 8'b00000000;
            end
        
        // Linea - en la primer fila    
        else if (counterX>30 && counterX<180 && counterY>78 && counterY<83)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
        else if (counterX>245 && counterX<395 && counterY>78 && counterY<83)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
        else if (counterX>460 && counterX<610 && counterY>78 && counterY<83)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
        
        // Linea - en la segunda fila    
        else if (counterX>30 && counterX<180 && counterY>240 && counterY<245)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
        else if (counterX>245 && counterX<395 && counterY>240 && counterY<245)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
        else if (counterX>460 && counterX<610 && counterY>240 && counterY<245)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
        
        // Linea - en la tercer fila    
        else if (counterX>30 && counterX<180 && counterY>402 && counterY<407)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
        else if (counterX>245 && counterX<395 && counterY>402 && counterY<407)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
        else if (counterX>460 && counterX<610 && counterY>402 && counterY<407)
              begin
                R <= 8'b00000000;
                G <= 8'b00000000;
                B <= 8'b11111111;
              end
		end
		

endmodule 		