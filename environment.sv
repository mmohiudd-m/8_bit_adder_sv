`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gr;
  driver drv;
  monitor mon;
  scoreboard sb;
  mailbox scb_mbx;
  virtual add_if aif;
  virtual clk_if cif;
  
  event drv_done;
  mailbox drv_mbx;
  
  function new();
    drv   = new;
    mon   = new;
    sb    = new;
    scb_mbx= new();
    gr    = new;
    drv_mbx=new;
  endfunction
  
  virtual task run();
    drv.aif = aif;
    mon.aif = aif;
    drv.cif = cif;
    mon.cif = cif;
    
    drv.drv_mbx = drv_mbx;
    mon.scb_mbx = scb_mbx;
    gr.drv_mbx  = drv_mbx;
    sb.scb_mbx  = scb_mbx;
    
    
    drv.drv_done = drv_done;
    gr.drv_done  = drv_done;
    
    fork 
      sb.run();
      mon.run();
      drv.run();
      gr.run();
    join_any
    
  endtask
endclass
      
    