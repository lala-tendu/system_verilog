// queues
module top;
  int intQ[$:4];
  int intS[$:4];
  initial begin
    //for loop
    for(int i;i<5;i++)begin
      intQ.push_back($urandom_range(50,100));
    end
    intQ.sort();
    $display("intQ[$]=%p",intQ);
    
    //assign new queue
    for(int i;i<5;i++)begin
      intS.push_back($urandom_range(10,20));
    end
     intS.sort();
    $display("intS[$]=%p",intS);
    //foreach loop
    foreach(intQ[i])
      $display("intQ[%0d]=%0d",i,intQ[i]);
  	//compare using foreach loop intQ and intS
    if(intQ==intS)begin
      $display("Both arrays are matching");
    end
    else begin
      $display("Both arrays are not matching");
    end
    
    //compare uisng for loop intQ and intS
    for(int i=0;i<intQ[i];i++)begin
      if(intQ==intS)begin
      $display("Both array are matching");
    end
    else begin
      $display("Both array are not matching");
    end
      break;
    end
    
    //copy first elemnt to 2nd element
    for(int i=0;i<intQ[i];i++)begin
      intS[i]=intQ[i];
    end
    $display("intS[$]=%p",intS);
    
    //compare intA and intS using for loop
       //compare uisng for loop intQ and intS
    for(int i=0;i<intQ[i];i++)begin
      if(intQ==intS)begin
      $display("Both array are matching");
    end
    else begin
      $display("Both array are not matching");
    end
      break;
    end    
  end
endmodule
  

