// purpose of scoreboard (to compare the actual valve and expected valve which comes for dut)
//1) class () handles

class scoreboard;
  
  sequence_item  sq_item;       
  mailbox#(sequence_item)  mon_mb; //handle for msilbox 
  
  logic [15:0] exptd;
  int  total_checks;
  int  pass_counter;
  int  fail_counter;
  
  function new( mailbox#(sequence_item) mon_mb);      // constructer
    this.mon_mb=mon_mb;
  endfunction
  
  task run();
    
    forever begin
      
      sq_item =new();
      
      mon_mb.get(sq_item);
      
      $display("{time%0t {scb} transaction recieved",$time);
      
      case(sq_item.OP)
        
        
        sequence_item::ADD:
          exptd =sq_item.A + sq_item.B ;
     
        
        sequence_item::SUB:
          exptd = sq_item.A - sq_item.B;
        sequence_item::MUL:
          exptd = sq_item.A * sq_item.B;
      
        sequence_item::INV:
         // exptd = ~sq_item.A& 8'hff; // 8 ff ?
        exptd = {8'h00,~sq_item.A}; 
        
        sequence_item::AND_OP:
          exptd = sq_item.A & sq_item.B;
        sequence_item::OR_OP:
          exptd = sq_item.A | sq_item.B;
        sequence_item::XOR_OP:
          exptd = sq_item.A ^ sq_item.B;
        sequence_item::SLL:
          exptd = sq_item.A << sq_item.B;
        
           
        
        endcase  
      $display("{time%0t}{scb} exptd=%0d actual=%0d",$time,exptd,sq_item.result);
      
      //if(exptd == sq_item.result)
        
        //$display("{scb} pass");
        //else
        //$display("{scb} fail");
        

      if(exptd == sq_item.result)begin
        pass_counter++;
        $display("{scb} {check=pass} pass count =%0d",pass_counter);
      end
      else if(exptd !== sq_item.result)begin
        fail_counter++;
        $display("{scb} {check=fail} fail count =%0d",fail_counter);
      end    
      
      total_checks++;
     $display("========================\n{scoreboard final summery}\n========================  \n total_checks performed =%0d \n total pass checked =%0d \n total fails checked=%0d\n=========================",total_checks,pass_counter,fail_counter);
      
    end
      
     // total_checks++;
   //   $display("========================\n{scoreboard final summery}\n========================  \n total_checks performed =%0d \n total pass checked =%0d \n total fails checked=%0d",total_checks,pass_counter,fail_counter);
  endtask 
    endclass
      
      
      
      
      
      
      
      
      
      
      
      
      
  
  