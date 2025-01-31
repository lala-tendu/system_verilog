// normal copy example
class transaction;
  int a=50;
endclass

module top;
  transaction tr1,tr2;
  initial begin
  tr1=new();
  tr2=tr1;
    tr2.a=10;
    $display("value in tr2.a=%0d",tr2.a);
    $display("value in tr1.a=%0d",tr1.a);
  end
endmodule

//shallow copy
class transaction;
  int a=50;
endclass

module top;
  transaction tr1,tr2;
  initial begin
  tr1=new();
    tr2= new tr1;
    tr2.a=56;
    
    
    $display("value in tr2.a=%0d",tr2.a);
    $display("value in tr1.a=%0d",tr1.a);
  end
endmodule
