class environment;
  
  agent  agent_alu;
  scoreboard  scb_alu;
  coverage  cov_alu;
  
  virtual alu_interface vinf;
  
  function new( virtual alu_interface vinf );
    this.vinf = vinf;
    agent_alu = new(vinf);
    scb_alu = new(agent_alu.mon_mb);  
    cov_alu = new(agent_alu.cov_mb);
    
  endfunction
  
  
  task run();
    
  //  agent_alu = new(agen_alu.)
    //scb_alu=new()
    fork
    agent_alu.run();
    scb_alu.run();
    cov_alu.run();
    join_none
    
  endtask
  
  
  
endclass
   