`include "environment.sv"
class test;
  environment env;
  mailbox drv_mbx;
  
  function new();
    env = new;
    drv_mbx = new;
  endfunction
  
  virtual task run();
    env.drv.drv_mbx = drv_mbx;
    env.run();
  endtask
endclass

