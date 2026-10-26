// sequence class  (what a sequence class should contain)
//1) handles fpr the object 
//2) mailbox implimentation
//3) constructors
//4) actuall operation(randomization)

class sequence_alu;
  
  sequence_item  sq_item;     /// handle assignment
  mailbox #(sequence_item) mbox_sq;     // mailbox with nested item
  int count =0;
  
  function  new(mailbox #(sequence_item) mbox); // mailbox constructer
    mbox_sq=mbox;
  endfunction
  
  function void build();
  endfunction
  
  task run();
    repeat (20) begin
      
       count++;
      $display("transaction=%d",count);
    sq_item = new();
      
    if(!sq_item.randomize())
    $error("RANDOMIZATION FAILED");
      
      
      $display("{time=%0t} ::sequnece mailbox before put size = %0d",$time,mbox_sq.num());
      mbox_sq.put(sq_item);
      $display("{time=%0t} ::sequnece mailbox after put size = %0d",$time,mbox_sq.num());
    //  count++;
     // $display("transaction=%d",count);
      
      $display("{time::%0t} [SEQ] randomization done ",$time);
      sq_item.display();
      #10;
    
  //endtask
      
      //function void display();
  //      $display("time=%0d  randomized trnx=%d mailbox content a=%0d b=%0d op%0d",$time,mbox_sq.num(),a.sq_item,b.sq_item,op.sq_item);
    //  endfunction
    end
    endtask
    
    endclass
    
    