`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Declare the wires and regs:
  reg en;
  reg [15:0] In;     // Input to the priority encoder
  wire [7:0] C;      // Output of the priority encoder

`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

  // Instantiate the priority_encoder module
  priority_encoder user_project (
      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(VPWR),
      .VGND(VGND),
`endif
      .In (In),
      .C (C),
      .en (en)        // Enable signal
  );

  // Testbench stimulus
  initial begin
    // Initialize the inputs:
    en = 0;
    In = 16'b0000000000000000;

    // Apply test vectors
    #10 en = 1; In = 16'b1000000000000000;  // Test input for 8'd15
    #10 In = 16'b0100000000000000;  // Test input for 8'd14
    #10 In = 16'b0000000000000010;  // Test input for 8'd1
    #10 In = 16'b0000000000000000;  // Test input for all zeros
    
    // Finish the simulation
    #10 $finish;
  end

endmodule
