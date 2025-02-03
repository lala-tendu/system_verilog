// Factorial
class factorial;
  function automatic int factor(input int n);
    int result;
    result = 1;//assign result as 1
    for(int i=1;i<=n;i=i+1)begin
      result = result*i;
    end
    return result;
  endfunction
endclass

module tb;
  factorial t;
  initial begin
    int num=7;
    int fact;
    t=new();
    fact=t.factor(num);
    $display("Factorial of %0d is %0d",num,fact);
  end
endmodule
    
    
