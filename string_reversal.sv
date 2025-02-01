module top;
  string name1,name2;
  initial begin
    name1="verilog";
    name2=name1;
    $display("name1=%s",name1);
    for(int i=0;i<name1.len();i++)begin
      name2.putc(i,name1[name1.len()-1-i]);
  end
    $display("name2=%s",name2);
  end
endmodule
