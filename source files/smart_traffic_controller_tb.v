`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 18:32:47
// Design Name: 
// Module Name: smart_traffic_controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module smart_traffic_controller_tb;
  wire [2:0] L1, L2, L3, L4, L5, L6, L7, L8;
  reg clk, reset, sw1, sw2, sw3, sw4, tl, ts;
  
  smart_traffic_controller DUT (
    clk, reset, sw1, sw2, sw3, sw4, tl, ts, 
    L1, L2, L3, L4, L5, L6, L7, L8
  );
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz
  end

  // Stimulus
  initial begin
    // Initial values
    sw1 = 0; sw2 = 0; sw3 = 0; sw4 = 0;
    ts = 0; tl = 0;

    // Apply reset
    reset = 1;
    #20 reset = 0; // Release reset after 20ns

    // Let FSM run normally
    #50 ts = 1;  // short time case
    #100 ts = 0; tl = 1; // long time case
    #200 tl = 0;

    // Emergency for L1
    #50 sw1 = 1;
    #50 sw1 = 0;

    // Emergency for L3
    #50 sw3 = 1;
    #50 sw3 = 0;

    // Finish
    #500 $stop;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, smart_traffic_controller_tb);
  end
endmodule

