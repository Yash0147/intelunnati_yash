module figo_fsm (
  input wire clk,
  input wire reset,
  input wire binary_input,
  output reg [2:0] current_location
);

  parameter Room0 = 3'b000;
  parameter Room1 = 3'b001;
  parameter Room2 = 3'b010;
  parameter Room3 = 3'b011;
  parameter Room4 = 3'b100;
  parameter Room5 = 3'b101;
  parameter Room6 = 3'b110;
  parameter Room7 = 3'b111;

  reg [2:0] current_state;
  reg [2:0] next_state;

  always @(posedge clk or posedge reset) begin
    if (reset)
      current_state <= Room0;
    else
      current_state <= next_state;
  end

  always @(current_state or binary_input) begin
    case (current_state)
      Room0: begin
        if (binary_input)
          next_state <= Room1;
        else
          next_state <= Room0;
      end
      Room1: begin
        if (binary_input)
          next_state <= Room4;
        else
          next_state <= Room2;
      end
      Room2: begin
        if (binary_input)
          next_state <= Room4;
        else
          next_state <= Room3;
      end
      Room3: begin
        if (binary_input)
          next_state <= Room0;
        else
          next_state <= Room3;
      end
      Room4: begin
        if (binary_input)
          next_state <= Room5;
        else
          next_state <= Room7;
      end
      Room5: begin
        if (binary_input)
          next_state <= Room6;
        else
          next_state <= Room3;
      end
      Room6: begin
        if (binary_input)
          next_state <= Room6;
        else
          next_state <= Room7;
      end
      Room7: begin
        if (binary_input)
          next_state <= Room5;
        else
          next_state <= Room1;
      end
    endcase
  end

  always @(current_state) begin
    case (current_state)
      Room0: current_location <= Room0;
      Room1: current_location <= Room1;
      Room2: current_location <= Room2;
      Room3: current_location <= Room3;
      Room4: current_location <= Room4;
      Room5: current_location <= Room5;
      Room6: current_location <= Room6;
      Room7: current_location <= Room7;
    endcase
  end

endmodule
