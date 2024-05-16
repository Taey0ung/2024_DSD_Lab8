`timescale 1ns/1ps

module tb_tx_baud_rate();

reg clk, reset, baud_en;
wire en;


parameter clk_period = 20; // 50MHz 1/20ns = 50M

tx_baud_rate U0( 
            .clk(clk),
            .reset(reset),
            .baud_en(baud_en),
            .en(en)); 

initial begin
// Initialize inputs
    clk = 0;
    baud_en = 0;

    reset = 1;
    #13 reset = 0;
    #(clk_period) reset = 1;

    // Test Case 1: Enable baud rate generation
    baud_en = 1;
    #(2604*10);  // Wait for multiple cycles to see 'en' signal toggle

    // Test Case 2: Disable baud rate generation
    baud_en = 0;
    #(2604*10);

    // Test Case 3: Enable baud rate generation again
    baud_en = 1;
    #(2604*10);
end

always begin //clock signal generation
    clk = 0;
    forever #(clk_period/2) clk = ~clk;
end
endmodule