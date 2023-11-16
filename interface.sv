interface add_if();
  logic rst;
  logic [7:0] a,b;
  logic [7:0] sum;
  logic carry;
endinterface


interface clk_if();
  logic tb_clk;
  initial
    tb_clk <= 0;
      always #10 tb_clk= ~ tb_clk;   
endinterface