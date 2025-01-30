// mailbox
 module top;
   mailbox #(int) mbox;

	initial begin
	  mbox=new();
	  mbox.put(10);
	  mbox.put(05);
	  mbox.put(20);
	  mbox.put(15);
	  mbox.put(21);
	
	  repeat(5)begin
        int value;
        mbox.get(value);
        $display("Received: %d", value);
      end
	  end
	  endmodule
