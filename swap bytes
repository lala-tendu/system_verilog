//RTL Code
module byte_swapper;
    bit [31:0] data;

    initial begin
        data = 32'hA1B2C3D4; // Original data
        $display("Before Swap: %h", data);
        data = {data[7:0], data[15:8], data[23:16], data[31:24]}; // Swap bytes
        $display("After Swap:  %h", data);
    end
endmodule


//Output

Before Swap: A1B2C3D4
After Swap:  D4C3B2A1
