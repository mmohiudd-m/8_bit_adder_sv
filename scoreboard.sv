class scoreboard;
  mailbox scb_mbx;
  
  task run();
    forever begin
      packet pkt,ref_pkt;
      scb_mbx.get(pkt);
      pkt.print("Scoreboard");
      
      ref_pkt = new();
      ref_pkt.copy(pkt);
      
      if(ref_pkt.rst)
      {ref_pkt.carry, ref_pkt.sum} = 0;
      else 
      {ref_pkt.carry, ref_pkt.sum} = ref_pkt.a + ref_pkt.b;
 
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////          
      if(ref_pkt.carry != pkt.carry) begin
        $display ("T=%0t, SB Error: Carry Mismatch ref_pkt.carry=%0d, pkt.carry=%0d", $time,ref_pkt.carry, pkt.carry); 
      end
      else begin
        $display ("T=%0t, SB Pass: Carry Match ref_pkt.carry=%0d, pkt.carry=%0d", $time,ref_pkt.carry, pkt.carry); 
    end
    
      if(ref_pkt.sum != pkt.sum) begin
        $display ("T=%0t, SB Error: SUM Mismatch ref_pkt.sum=%0d, pkt.sum=%0d", $time,ref_pkt.sum, pkt.sum); 
      end
      else begin
        $display ("T=%0t, SB Pass: SUM Match ref_pkt.sum=%0d, pkt.sum=%0d", $time,ref_pkt.sum, pkt.sum); 
    end
  end
endtask
endclass
                  
                  
    