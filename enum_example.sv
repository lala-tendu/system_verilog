// Enumeration  methods examples
module top;
  typedef enum{a=2,b,c,d=5}alphabet;
  alphabet h;
  initial begin
    h=b;
    $display("name=%s\th=%0d",h.name,h);
    $display("name=%s\th.first=%0d",h.first.name,h.first);
    $display("h.num=%0d",h.num);
    $display("name=%s\th.last=%0d",h.last.name,h.last);
    $display("name=%s\th.next=%0d",h.next.name,h.next);
    $display("name=%s\th.prev=%0d",h.prev.name,h.prev);
    
  end
endmodule
