module function_ex1;
  int s;

  function int sum;
    input int a,b;
    sum = a+b;   //return==sum
  endfunction
  
  initial begin
    s=sum(10,5);
    $display("Value of s = %0d",s);
  end
endmodule
//-----------------------------void-----------------------

module function_ex2;
 
  function void display;
    $display("at t=%0t: Welcome to We_LSI",$time);    
  endfunction
 
  initial begin
    #10;
    display();
    #20;
    display();
  end
endmodule

//--------------Discarding function return value-------------------
//-----------------function call as an expression------------------

module function_ex3;
int s=5;
  function int sum;
    input int a,b;
    return a+b;    
  endfunction
 
  initial begin
    // $display(sum(10,5));
    //$display("Calling function with void");
    // void'(sum(10,5));//Discarding function return value
    s = s * sum(10,5);
    $display(s);

  end
 endmodule
//---------------------------static automatic------------------------
module static_automatic;
  
  function static increment_static();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Static: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endfunction
  
  function automatic increment_automatic();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Automatic: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endfunction
  
  function increment();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Normal: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endfunction
  
  initial begin
    repeat(3)increment_static();
    repeat(3)increment_automatic();
    repeat(3)increment();

    //Accessing variables using function
    $display("\nStatic: count_A = %0d", increment_static.count_A);
    $display("Automatic: count_B = %0d", increment_static.count_B);    // Hierarchical reference to automatic variable is not legal.
    $display("Normal: count_C = %0d", increment_static.count_C);
    
  end
endmodule

//----------------------argument pass by value------------
if any changes to arguments within the subroutine, those changes will not be visible outside the subroutine.
module pass_by_value;
  int x,y,z;
  function int sum(int x,y);
    x = x+y;//x=50
    y = x+y;//y=80
    return x+y; //((x+y)+y) =130
  endfunction

  initial begin
    x = 20;
    y = 30;
    $display("x = %0d\ny = %0d\n",x,y);
    z = sum(x,y);
    $display("x = %0d\ny = %0d\nz = %0d\n",x,y,z);
   
  end
endmodule---
---------------------------------------
//----------------------argument pass by reference------------
As the argument within a subroutine is pointing to an original argument, any changes to the argument within subroutine will be visible outside.

module pass_by_reference;
  int x,y,z;
  function int sum(ref int x,y);//const
    x = x+y;//x=50
    y = x+y;//y=80
    return x+y; //((x+y)+y) =130
  endfunction

  initial begin
    x = 20;
    y = 30;
    $display("x = %0d\ny = %0d\n",x,y);
    z = sum(x,y);
    $display("x = %0d\ny = %0d\nz = %0d\n",x,y,z);
   
  end
endmodule
//---------------default value--------------------------
module default_value;
  int x,y,z;
  function int sum(int x=5,y=10,z=15);//const(use automatic function when u r using const)
    x = x+y+z;
    return x+y; //((x+y)+y) 
  endfunction

  initial begin
    $display(sum());  //sum(,,5))
  end
endmodule
---------------------------------------
module pass_by_name;

  function void display(real x,string y);
    $display("x = %0f, y = %0s",x,y);   
  endfunction

  initial begin
    display(.y("Welcome to We_LSI"),.x(20.23));
  end
endmodule
