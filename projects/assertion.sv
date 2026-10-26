
//// assertions////

module assertions_alu(
  
  ///signels does assertions need
  
  input logic clk,
  input logic [7:0] A,
  input logic [7:0]	B,
  input logic [2:0] OP,
  input logic [15:0] result );
  
//sequence  seq_ADD ;
 // @(posedge clk)
  //(OP== sequence_item ::ADD)-> ##0 (result== {8'h00,A}+{8'h00,B}); 
//endsequence
  
 property p_add_start;
    @(posedge clk)
    $rose(OP==sequence_item::ADD);
  endproperty
  
  a_add_start: cover property(p_add_start)
    $display("ADD OPERATION STARTED at time =%0t",$time);
    
    
  
  
property p_add;  // rule that 
  @(posedge clk)  //at every positive clock edeg
(OP== sequence_item
  ::ADD) |->  (result== ({8'h00,A} +{8'h00,B}));  //if op==add then result must to a+b
//codtn one a happen then condtn must be true
  
 // seq_ADD;
endproperty
  
  a_add: assert property(p_add) 
    
    
    $display("{time=%0t} ASSERT ADD PASS: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
    else
     
      $display("{time=%0t} ASSERT ADD FAIL: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
  
    
    
    
    
    property p_sub_start;
    @(posedge clk)
      $rose(OP==sequence_item::SUB);
  endproperty
  
    a_sub_start: cover property(p_sub_start)
      $display("SUB OPERATION STARTED at time =%0t",$time);
    
    
  
    property p_sub;  // assert for sub 
      @(posedge clk)
      (OP== sequence_item::SUB) |-> ##0 (result == {8'h00,A} - {8'h00,B});
    endproperty
    
    a_sub : assert property(p_sub)
    
      $display("{time=%0t} ASSERT SUB PASS: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
    else
     
      $display("{time=%0t} ASSERT SUB FAIL: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
  
      property p_mul; // assert for mul
        @(posedge clk)
        (OP==sequence_item::MUL) |-> (result == A*B);
      endproperty
      
      a_mul : assert property(p_mul)
        
         
        $display("{time=%0t} ASSERT MUL PASS: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
    else
     
      $display("{time=%0t} ASSERT MUL FAIL: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
        
        
        
        
          
    property p_inv_start;
    @(posedge clk)
      $rose(OP==sequence_item::INV);
  endproperty
  
        a_inv_start: cover property(p_inv_start)
          $display("INV OPERATION STARTED at time =%0t",$time);
    
  
      property p_inv;   // ASSERT FOR INV
        @(posedge clk)
        (OP==sequence_item::INV) |-> (result == {8'h00,~A});
      endproperty
      
        a_inv : assert property(p_inv)
        
         
          $display("{time=%0t} ASSERT INV PASS: A=%0d RESULT=%0d",$time, A,result);
    else
     
      $display("{time=%0t} ASSERT INV FAIL: A=%0d  RESULT=%0d",$time, A,result);
  
    
      property p_and;   // ASSERT FOR AND
        @(posedge clk)
        (OP==sequence_item::AND_OP) |-> (result == ({8'h00,A} & {8'h00,B}));
      endproperty
      
          a_and : assert property(p_and)
        
         
            $display("{time=%0t} ASSERT AND PASS: A=%0d B=%0d RESULT=%0b",$time, A,B,result);
    else
     
      $display("{time=%0t} ASSERT AND FAIL: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
  
    
        property p_or;   // ASSERT FOR OR
        @(posedge clk)
                (OP==sequence_item::OR_OP) |-> (result ==  {8'h00,A} | {8'h00,B});
      endproperty
      
            a_or_OP : assert property(p_or)
        
         
            $display("{time=%0t} ASSERT OR_OP PASS: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
    else
     
      $display("{time=%0t} ASSERT OR_OP FAIL: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
            
            
  

      property p_xor;   // ASSERT FOR xor
        @(posedge clk)
       (OP==sequence_item::XOR_OP) |-> (result == {8'h00,A} ^ {8'h00,B});
      endproperty
      
            a_Xor_OP : assert property(p_xor)
        
         
              $display("{time=%0t} ASSERT XOR_OP PASS: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
    else
     
      $display("{time=%0t} ASSERT XOR_OP FAIL: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
            
            
            
              
              
      property p_sll;   // ASSERT FOR SLL
        @(posedge clk)
        (OP==sequence_item::SLL) |-> (result == {8'h00,A} << B);
      endproperty
      
              a_sll : assert property(p_sll)
        
         
                $display("{time=%0t} ASSERT SLL PASS: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
    else
     
      $display("{time=%0t} ASSERT SLL FAIL: A=%0d B=%0d RESULT=%0d",$time, A,B,result);
            
            
            
            
    
    
    
  
endmodule