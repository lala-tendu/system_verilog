// always@* and always_comb difference

//---------(1)-------
module check;
  int a,b,c,y,z;
  //logic a,b,c,y,z;

  always @(a)
    y= a^b^c;
  
  always_comb
    z=a^b^c;
  
  initial begin 
    a=0;b=1;c=0;
    #5 a=0;b=0;c=1;
    #5 a=0;b=1;c=0;
    #5 a=1;b=1;c=1;

  end
  
  initial $monitor("| t=%0t  a=%0d,b=%0d,c=%0d | y=%0d | z=%0d |",$time,a,b,c,y,z);
  
endmodule
//--------(2)--------

module check;
  logic a,b,c,y,z;
  
  function logic fun_call(logic c);
    return a|b|c;
  endfunction
  
  always @(*)
    y= fun_call(c);
  
  always_comb
    z=fun_call(c);
  
  initial begin 
       a=0;b=0;c=0;
    #5 a=1;
    #5 b=1;
    #5 c=1;

  end
  
  initial $monitor("| t=%0t  a=%0d,b=%0d,c=%0d | y=%0d | z=%0d |",$time,a,b,c,y,z);
  
endmodule

//------(3)---------

module check;
  logic a,b,c,y,z;
  
  always @(*)
    y= a|b|c;
  
  always_comb
    y=a&b;
  
  initial begin 
  a=0;b=0;c=0;
    #5 a=1;
    #5 b=1;
    #5 c=1;
  end
  
  initial $monitor("a=%0d,b=%0d,y=%0d z=%0d",a,b,y,z);
  
endmodule





