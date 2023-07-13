module figo_fsm_tb;

  reg clk;
  reg reset;
  reg binary_input;
  wire [2:0] current_location;

  figo_fsm dut (
    .clk(clk),
    .reset(reset),
    .binary_input(binary_input),
    .current_location(current_location)
  );

  initial begin
    clk = 0;
    reset = 1;
    binary_input = 0;

    #10 reset = 0;  
    #20 reset = 1;  

   
    #10 binary_input = 0;
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 1;

    
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 1;

    
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 0;

   
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 0;

  
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 1;

   
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 1;

   
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 0;
    #10 binary_input = 1;

   
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 1;
    #10 binary_input = 1;

   
    #10 binary_input = 0;
    #10 binary_input = 1;
    #10 binary_input = 0;
    #10 binary_input = 1;
    #10 binary_input = 1;

    $finish;
  end

  always #5 clk = ~clk;

endmodule