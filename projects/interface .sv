interface alu_interface (input logic clk); 
   
   logic [7:0]A;
   logic [7:0]B;
   logic [2:0]OP;
   logic [15:0]result;
  
  clocking drv_cb@(posedge clk);
    output A,B,OP;
    input result;
    
  endclocking
  
  clocking mon_cb @(posedge clk);
    input A,B,OP,result;
  endclocking
  
 
endinterface


  