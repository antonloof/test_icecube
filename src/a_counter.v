module a_counter (clk, rstn, is_up, count);
    parameter WIDTH = 8;

    input clk, rstn, is_up;
    
    output reg [WIDTH - 1 : 0] count;

    always @(posedge clk ) begin
        if (!rstn) begin
            count <= 0;
        end else begin
            if (is_up) begin
                count <= count + 1;
            end else begin
                count <= count - 1;
            end
        end
    end
endmodule