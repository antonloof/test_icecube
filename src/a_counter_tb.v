module a_counter_tb;
    reg rstn = 0;
    reg is_up = 1;

    initial begin
        # 10 rstn = 1;
        # 30 is_up = 0;
        # 30 is_up = 1;
        # 100 $finish;
    end
    
    // gtkwave stuffs
    initial
    begin
        $dumpfile("tb.vcd");
        $dumpvars(0,a_counter_tb); // give name of top module to include all signals
    end


    reg clk = 0;
    always #5 clk = !clk;

    wire [7:0] count;
    a_counter c1(clk, rstn, is_up, count);

    initial begin
        $monitor("At time %t, value = %h (%0d)", $time, count, count);
    end
endmodule