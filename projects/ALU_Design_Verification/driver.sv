/// functionlty/ tasks of the driver should do 
//1) take packets form the mailbox
//2)drive randomized data to dut via interface
//3)

class driver_alu;
  // class properties
  mailbox#(sequence_item) dr_mb;  
  sequence_item      dr_sq_item;  
  virtual alu_interface vinf;
  // class methods
  function new(mailbox #(sequence_item) dr_mb , virtual alu_interface vinf);
    this.dr_mb = dr_mb;
    this.vinf  = vinf;
  endfunction
  
  task run();
    
    forever begin
      
      dr_mb.get(dr_sq_item);
      $display("{time::%0t} [driver] transaction received ",$time);
      dr_sq_item.display();
      
      @(posedge vinf.clk); 
      vinf.drv_cb.A <= dr_sq_item.A;  // driving to interace
      vinf.drv_cb.B <= dr_sq_item.B;
      vinf.drv_cb.OP<= dr_sq_item.OP;
      $display("{time::%0t} [driver] transaction recieved to interface ",$time);
     
      
    end
  endtask
  endclass