//class examples
class transaction;
  bit[31:0]data;
  int id;
  
//   static function assign_va1(bit[31:0]data,int id);// static function
//     this.data=data;
//     this.id=id;
//   endfunction
// endclass
  
  function static assign_va1(bit[31:0]data,int id);//  non-static function
    this.data=data;
    this.id=id;
  endfunction
endclass

module class_example;
  initial begin
  transaction tr=new();
    tr.assign_va1(5,1);
    $display("value of data=%0h, id=%0h",tr.data,tr.id);
  end
  
endmodule
