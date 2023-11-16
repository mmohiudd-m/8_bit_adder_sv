class generator;
int loop=10;
  event drv_done;
  mailbox drv_mbx;
  
  task run();
    for(int i=0; i<loop; i=i+1) begin
      packet pkt=new;
      pkt.randomize();
      $display("T=%0t, [Generator] Loop=%0d, create next item=%0d", $time,i+1,loop);
      drv_mbx.put(pkt);
    $display("T=%0t, [Generator] Wait for driver to be done", $time);
    @(drv_done);
    end
  endtask:run
endclass
  