`timescale 1ns/1ps

module tb_delay_load();

reg clk, load, reset;
wire z;

delay_load U0(
    .clk(clk), .reset(reset), .load(load), .z(z)
);

parameter clk_period = 20;

always begin
    clk = 0;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
  // Reset sequence
  reset = 1; 
  #10;
  reset = 0; 
  #30;
  reset = 1; 
  
  // Load sequence
  load = 1; #(30);
  load = 0;

  // Run 1ms
end

endmodule
