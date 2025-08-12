`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 18:34:30
// Design Name: 
// Module Name: smart_traffic_controller
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


module smart_traffic_controller(clk,reset,sw1,sw2,sw3,sw4,tl,ts, L1, L2, L3, L4, L5, L6, L7,L8);
  input clk,reset,sw1,sw2,sw3,sw4,tl,ts ;
  output reg [2:0] L1, L2, L3, L4, L5, L6, L7,L8 ;  // green = 3'b001, yellow =3'b010 ,red = 3'b100 
  
  reg [3:0] state ;
  reg [3:0] count ;
  reg [3:0] state_reg ;
  
  parameter S0 = 4'b0000 ;
  parameter S1 = 4'b0001 ;
  parameter S2 = 4'b0010 ;
  parameter S3 = 4'b0011 ;
  parameter S4 = 4'b0100 ;
  parameter S5 = 4'b0101 ;
  parameter S6 = 4'b0110 ;
  parameter S7 = 4'b0111 ;
  parameter S8 = 4'b1000 ;
  parameter S_EMERGENCY_L1 = 4'b1001 ;
  parameter S_EMERGENCY_L5 = 4'b1010 ;
  parameter S_EMERGENCY_L3 = 4'b1011 ;
  parameter S_EMERGENCY_L7 = 4'b1100 ;
  
  
  always @(posedge clk , posedge reset )  //next state logic
    begin
      if(reset)
        begin
          state <= S0 ;
          count <= 4'b000 ;  
        end
      else
        begin
          if (sw1)
            state <= S_EMERGENCY_L1;  //north
          else if (sw2)
            state <= S_EMERGENCY_L5;  //south
          else if (sw3)
            state <= S_EMERGENCY_L3;  //west
          else if (sw4)
            state <= S_EMERGENCY_L7;  //east
          else
            begin
              case(state)
                
                S_EMERGENCY_L1 :
                  begin
                    if (sw1)
                      state <= S_EMERGENCY_L1 ;
                    else
                      state <= state_reg ;
                  end
                S_EMERGENCY_L5 :
                  begin
                    if (sw2)
                      state <= S_EMERGENCY_L5 ;
                    else
                      state <= state_reg ;
                  end 
                S_EMERGENCY_L3 :
                  begin
                    if (sw3)
                      state <= S_EMERGENCY_L3 ;
                    else
                      state <= state_reg ;
                  end 
                S_EMERGENCY_L7 :
                  begin
                    if (sw4)
                      state <= S_EMERGENCY_L7 ;
                    else
                      state <= state_reg ;
                  end                      
               S0 :
                  begin
                    state_reg = S0 ;
                    if (count==4'b0011)
                      begin
                        state <= S1 ;
                        count <= 4'b0000 ;
                      end
                    else
                      begin
                        state <= S0 ;
                        count <= count + 4'b0001 ;
                      end                  
                  end  
    
                S1 :
                  begin
                    state_reg = S1 ;
                    if(count==4'b0011)
                      begin
                        state <= S2 ;
                        count <= 4'b0000 ;
                      end
                    else
                      begin
                        count <= count + 4'b0001 ;
                        state <= S1 ;
                      end
                    
                  end
                S2 :
                  begin
                    if(ts)
                      begin
                        state_reg = S2 ;
                        if(count==4'b0011)
                          begin
                            state <= S3 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S2 ;                        
                          end
                      end
                    else if(tl)
                      begin
                        state_reg = S2 ;
                        if(count==4'b1111)
                          begin
                            state <= S3 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S2 ;                        
                          end
                      end
                    else
                      begin
                        state_reg = S2 ;
                        if(count==4'b0111)
                          begin
                            state <= S3 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S2 ;                        
                          end
                      end                    
                        
                  end
                
                S3 :
                  begin
                    state_reg = S3 ;
                    if(count==4'b0011)
                      begin
                        state <= S4 ;
                        count <= 4'b0000 ;
                      end
                    else
                      begin
                        count <= count + 4'b0001 ;
                        state <= S3 ;                        
                      end
                  end                     
                S4 :
                  begin
                    if(ts)
                      begin
                        state_reg = S4 ;
                        if(count==4'b0011)
                          begin
                            state <= S5 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S4 ;                        
                          end
                      end
                    else if(tl)
                      begin
                        state_reg = S4 ;
                        if(count==4'b1111)
                          begin
                            state <= S5 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S4 ;                        
                          end
                      end
                    else
                      begin
                        state_reg = S4 ;
                        if(count==4'b0111)
                          begin
                            state <= S5 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S4 ;                        
                          end
                      end                    
                        
                  end                  
                S5 :
                  begin
                    state_reg = S5 ;
                    if(count==4'b0011)
                      begin
                        state <= S6 ;
                        count <= 4'b0000 ;
                      end
                    else
                      begin
                        count <= count + 4'b0001 ;
                        state <= S5 ;                        
                      end
                  end                    
                S6 :
                  begin
                    if(ts)
                      begin
                        state_reg = S6 ;
                        if(count==4'b0011)
                          begin
                            state <= S7 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S6 ;                        
                          end
                      end
                    else if(tl)
                      begin
                        state_reg = S6 ;
                        if(count==4'b1111)
                          begin
                            state <= S7 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S6 ;                        
                          end
                      end
                    else
                      begin
                        state_reg = S6 ;
                        if(count==4'b0111)
                          begin
                            state <= S7 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S6 ;                        
                          end
                      end                    
                        
                  end                  
                S7 :
                  begin
                    state_reg = S7 ;
                    if(count==4'b0011)
                      begin
                        state <= S8 ;
                        count <= 4'b0000 ;
                      end
                    else
                      begin
                        count <= count + 4'b0001 ;
                        state <= S7 ;                        
                      end
                  end               
                S8 :
                  begin
                    if(ts)
                      begin
                        state_reg = S8 ;
                        if(count==4'b0011)
                          begin
                            state <= S1 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S8 ;                        
                          end
                      end
                    else if(tl)
                      begin
                        state_reg = S8 ;
                        if(count==4'b1111)
                          begin
                            state <= S1 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S8 ;                        
                          end
                      end
                    else
                      begin
                        state_reg = S8 ;
                        if(count==4'b0111)
                          begin
                            state <= S1 ;
                            count <= 4'b0000 ;
                          end
                        else
                          begin
                            count <= count + 4'b0001 ;
                            state <= S8 ;                        
                          end
                      end                    
                        
                  end              
 
              
              endcase
            end
        end
    end
    
  always @(posedge clk ,posedge reset)  //output logic
    begin
      case(state)
        
          
          S_EMERGENCY_L1 :
          begin  
            L1 <= 3'b001 ; //green
            L2 <= 3'b100 ; //red
            L3 <= 3'b100 ; //red
            L4 <= 3'b100 ; //red
            L5 <= 3'b100 ; //red
            L6 <= 3'b100 ; //red
            L7 <= 3'b100 ; //red
            L8 <= 3'b100 ; //red
          end
          
          S_EMERGENCY_L5 :
          begin
            L1 <= 3'b100 ; //red
            L2 <= 3'b100 ; //red
            L3 <= 3'b100 ; //red
            L4 <= 3'b100 ; //red
            L5 <= 3'b001 ; //green
            L6 <= 3'b100 ; //red
            L7 <= 3'b100 ; //red
            L8 <= 3'b100 ; //red
          end
          
          S_EMERGENCY_L3:
          begin
            L1 <= 3'b100 ; //red
            L2 <= 3'b100 ; //red
            L3 <= 3'b001 ; //green
            L4 <= 3'b100 ; //red
            L5 <= 3'b100 ; //red
            L6 <= 3'b100 ; //red
            L7 <= 3'b100 ; //red
            L8 <= 3'b100 ; //red
          end  
          
          S_EMERGENCY_L7:
          begin
            L1 <= 3'b100 ; //red
            L2 <= 3'b100 ; //red
            L3 <= 3'b100 ; //red
            L4 <= 3'b100 ; //red
            L5 <= 3'b100 ; //red
            L6 <= 3'b100 ; //red
            L7 <= 3'b001 ; //green
            L8 <= 3'b100 ; //red
          end
          
          S0 :
            begin
              L1 <= 3'b100 ; //red
              L2 <= 3'b100 ; //red
              L3 <= 3'b100 ; //red
              L4 <= 3'b100 ; //red
              L5 <= 3'b100 ; //red
              L6 <= 3'b100 ; //red
              L7 <= 3'b100 ; //red
              L8 <= 3'b100 ; //red
            end
        S1 :
          begin
            L1 <= 3'b010 ; //yellow
            L2 <= 3'b100 ; //red
            L3 <= 3'b100 ; //red
            L4 <= 3'b100 ; //red
            L5 <= 3'b010 ; //yellow
            L6 <= 3'b100 ; //red
            L7 <= 3'b100 ; //red
            L8 <= 3'b100 ; //red
          end
        
        S2 :
          begin
            L1 <= 3'b001 ; //green
            L2 <= 3'b100 ; //red
            L3 <= 3'b100 ; //red
            L4 <= 3'b100 ; //red
            L5 <= 3'b001 ; //green
            L6 <= 3'b100 ; //red
            L7 <= 3'b100 ; //red
            L8 <= 3'b100 ; //red
          end
        S3 :
          begin
            L1 <= 3'b010 ; //yellow
            L2 <= 3'b100 ; //red
            L3 <= 3'b100 ; //red
            L4 <= 3'b100 ; //red
            L5 <= 3'b010 ; //yellow
            L6 <= 3'b100 ; //red
            L7 <= 3'b100 ; //red
            L8 <= 3'b100 ; //red
          end
        S4 :
          begin
            L1 <= 3'b100 ; //red
            L2 <= 3'b001 ; //green
            L3 <= 3'b100 ; //red
            L4 <= 3'b100 ; //red
            L5 <= 3'b100 ; //red
            L6 <= 3'b001 ; //green
            L7 <= 3'b100 ; //red
            L8 <= 3'b100 ; //red
          end  
        S5 :
          begin
            L1 <= 3'b100 ; //red
            L2 <= 3'b100 ; //red
            L3 <= 3'b010 ; //yellow
            L4 <= 3'b100 ; //red
            L5 <= 3'b100 ; //red
            L6 <= 3'b100 ; //red
            L7 <= 3'b010 ; //yellow
            L8 <= 3'b100 ; //red
          end    
        S6 :
          begin
            L1 <= 3'b100 ; //red
            L2 <= 3'b100 ; //red
            L3 <= 3'b001 ; //green
            L4 <= 3'b100 ; //red
            L5 <= 3'b100 ; //red
            L6 <= 3'b100 ; //red
            L7 <= 3'b001 ; //green
            L8 <= 3'b100 ; //red
          end 
        S7 :
          begin
            L1 <= 3'b100 ; //red
            L2 <= 3'b100 ; //red
            L3 <= 3'b010 ; //yellow
            L4 <= 3'b100 ; //red
            L5 <= 3'b100 ; //red
            L6 <= 3'b100 ; //red
            L7 <= 3'b010 ; //yellow
            L8 <= 3'b100 ; //red
          end 
        S8 :
          begin
            L1 <= 3'b100 ; //red
            L2 <= 3'b100 ; //red
            L3 <= 3'b010 ; //red
            L4 <= 3'b100 ; //green
            L5 <= 3'b100 ; //red
            L6 <= 3'b100 ; //red
            L7 <= 3'b010 ; //red
            L8 <= 3'b100 ; //green
          end           
      endcase
    end
endmodule
