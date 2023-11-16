class packet;
  rand bit rst;
  rand bit [7:0] a,b;
  bit [7:0] sum;
  bit carry;
  
  function void print (string tag="");
    $display("Packet data --:> T=%0t a=%0d, b=%0d,sum=%0d,carry=%0d,tag=%0s", $time,a,b,sum,carry,tag);
  endfunction
  
  function void copy(packet pkt);
    this.rst=pkt.rst;
    this.a=pkt.a;
    this.b=pkt.b;
    this.sum=pkt.sum; 
    this.carry=pkt.carry;
  endfunction
endclass