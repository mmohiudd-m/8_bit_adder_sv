class monitor;
  virtual add_if aif;
  virtual clk_if cif;
  mailbox scb_mbx;
  
  task run();
    $display("T=$0t, Monitor starting ....", $time);
    forever begin
      packet pkt=new();
      @(posedge cif.tb_clk);
      #2;
      pkt.rst = aif.rst;
      pkt.a = aif.a;
      pkt.b = aif.b;
      pkt.sum = aif.sum;
      pkt.carry = aif.carry;
      pkt.print("Monitor");
      scb_mbx.put(pkt);
    end
  endtask
endclass
      