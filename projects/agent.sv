class agent;
  
     // classes with handles
  sequence_alu seq;
  driver_alu   dr_alu;
  monitor_alu  mon_alu;
  virtual alu_interface vinf;
  
  //  mailboxes 
   mailbox #(sequence_item) mbx;
  mailbox #(sequence_item) mon_mb;
  mailbox #(sequence_item) cov_mb;
  
  // constructer (object creation)
  function new( virtual alu_interface vinf);
    this.vinf=vinf;
    
    
    mbx=new();
    mon_mb= new();
  cov_mb =new();
    seq=new(mbx);
    dr_alu =new(mbx , vinf);
    mon_alu = new(mon_mb , vinf,cov_mb);
   endfunction
  
  ///  run task
  task run();
    
     fork
    seq.run();
    dr_alu.run();
    mon_alu.run();
    join_none
  
    endtask
  
  
  
  
endclass