class driver;
 virtual add_if aif;
 virtual clk_if cif;
 mailbox drv_mbx;
 event drv_done;
  
  task run();
    $display("T=%0t, Driver starting ...", $time);
    forever 
      begin
        packet pkt;
        $display("T=%0t [Driver] waiting for item ...",$time);
        drv_mbx.get(pkt);
        @(posedge cif.tb_clk);
        pkt.print("Driver");
        aif.rst <= pkt.rst;
        aif.a <= pkt.a;
        aif.b <= pkt.b;
        ->drv_done;
      end
  endtask
endclass
    