// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"

module tb;
  bit tb_clk ;
  clk_if cif();
  add_if aif();
  adder dut (aif);
  
  initial
    begin
      test t;
      
      t = new;
      t.env.aif = aif;
      t.env.cif = cif;
      t.run();
      #100 $finish;     
    end
    //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
