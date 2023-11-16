// Code your design here
module adder(add_if aif);
  always_comb begin
    if(aif.rst)
      begin
        aif.sum<=0;
        aif.carry<=0;
      end
    else 
    {aif.carry,aif.sum} <= aif.a + aif.b;
  end
endmodule