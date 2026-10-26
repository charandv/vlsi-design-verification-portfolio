// need r operation of coverge (to measure all the operation of alu was excercised)
// skeliton of coverage
//  coverage (mainbody)
//    ||
//  covergroups(container of coverage)
//    ||
//  coverpoint(which excuition to focus)
//    ||
//   bins (to know acutually does it happend)

class coverage;  // class coverage main body
  
  sequence_item  sq_item; // sq_item for the operation which is actually present
  
  mailbox#(sequence_item) cov_mb;
  
  int ADD_count;
  int SUB_count;  // local variables for counter
   int MUL_count;  //
  int INV_count;  //
  int AND_count;
  int OR_count;
   int XOR_count;
  int SLL_count;
   
  covergroup alu_dut;
    
    coverpoint sq_item.OP { // coverpoint for op
     
      bins ADD = {sequence_item::ADD};  // BIN NAME AND VALVE
      bins SUB = {sequence_item::SUB};
      bins MUL = {sequence_item::MUL};
      bins INV = {sequence_item::INV};
      bins AND = {sequence_item::AND_OP};
      bins OR  = {sequence_item::OR_OP};
      bins XOR = {sequence_item::XOR_OP};
      bins SLL = {sequence_item::SLL};}
   
     endgroup
   
  
  function new( mailbox#(sequence_item) cov_mb);  // constructer for mailbox
    this.cov_mb =cov_mb;
    
      sq_item = new();
     alu_dut =new();
    
  endfunction
  
 // function bulid();      
 // alu_dut =new();
 // endfunction
  
    task run();
    
    forever begin
      
  //    sq_item = new();
      //alu_dut = new();
      cov_mb.get(sq_item);
      
        $display("{cov} op=%0s sampled",sq_item.OP.name());
      
      case(sq_item.OP)
        
        sequence_item::ADD:
          ADD_count++;
        
        
         sequence_item::SUB:
          SUB_count++;
        
       sequence_item::MUL:
          MUL_count++;
        
       sequence_item::INV:
          INV_count++;
        
          sequence_item::AND_OP:
          AND_count++;
        
          sequence_item::OR_OP:
          OR_count++;
        
          sequence_item::XOR_OP:
          XOR_count++;
        
          sequence_item::SLL:
          SLL_count++;
      endcase
      
      alu_dut.sample();
      
   //   $display("{cov} op=%0s sampled",sq_item.OP.name());
    
    end
    
      endtask
  
  task report();
    
    $display("================\n COVERAGE REPORT\n================= ");
       
    
    //  OPERATION DISPLAYS FOR OCCURIED NOTICATION
/* $display("ADD = %0d",ADD_count);
    $display("SUB = %0d",SUB_count);
    $display("MUL = %0d",MUL_count);
   $display("INV = %0d",INV_count);
   $display("AND = %0d",AND_count);
   $display("OR = %0d",OR_count);
    $display("XOR = %0d",XOR_count);
    $display("SLL = %0d",SLL_count);*/

    
    
    /// HIT COUNTERS TO  NOTIFY HIT R MISS
    if(ADD_count>0)
      $display("ADD: HIT (%0d hits)",ADD_count );
    else
      $display("ADD: MISS  (%0d hits)",ADD_count );  // for ADD
    
    if(SUB_count>0)
      $display("SUB: HIT  (%0d hits) ",SUB_count);  // FOR SUB
    else
      $display("SUB: MISS  (%0d hits) ",SUB_count);
      
      if(MUL_count>0)
        $display("MUL: HIT  (%0d hits) ",MUL_count);
    else
      $display("MUL: MISS  (%0d hits) ",MUL_count);
      
      if(INV_count>0)
        $display("INV: HIT  (%0d hits)",INV_count);
    else
      $display("INV: MISS  (%0d hits)",INV_count);
      
      if(AND_count>0)
        $display("AND: HIT  (%0d hits) ",AND_count);
    else
      $display("AND: MISS  (%0d hits) ",AND_count);
      
      if(OR_count>0)
        $display("OR: HIT  (%0d hits) ",OR_count);
    else
      $display("OR: MISS  (%0d hits) ",OR_count);
      
      if(XOR_count>0)
        $display("XOR: HIT  (%0d hits) ",XOR_count);
    else
      $display("XOR: MISS  (%0d hits) ",XOR_count);
      
      if(SLL_count>0)
        $display("SLL: HIT  (%0d hits) ",SLL_count);
    else
      $display("SLL: MISS  (%0d hits) ",SLL_count);
      
      
      alu_dut.get_coverage();
      $display("coverage = %0.2f%%",alu_dut.get_coverage());
      
    
  endtask
     
endclass