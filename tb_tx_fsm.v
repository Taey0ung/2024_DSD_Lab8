`timescale 1ns/1ps

module tb_tx_fsm();

reg clk, reset, z, en;
reg [7:0] d;

wire baud_en, txd;

parameter s0=4'b0000;
parameter s1=4'b0001;
parameter s2=4'b0010;
parameter s3=4'b0011;
parameter s4=4'b0100;
parameter s5=4'b0101;
parameter s6=4'b0110;
parameter s7=4'b0111;
parameter s8=4'b1000;
parameter s9=4'b1001;
parameter s10=4'b1010;

tx_fsm U0(
    .clk(clk), .reset(reset),
    .z(z), .d(d), .en(en), .baud_en(baud_en), .txd(txd)
    );
    
parameter clk_period = 20;

initial begin
    clk = 0;
    forever #(clk_period/2) clk = ~clk;
end

initial begin
     reset = 0; #10 //리셋을 통한 S0 상태
     reset = 1;
end

initial begin
    d = 8'b10101010;
end

initial begin //z와 en만 넣으면 됨
  z = 1; en = 0;   #100 //S0 상태
  z = 0; en = 1; #1000; //S1 상태


end

endmodule

//1us = 1000ns

