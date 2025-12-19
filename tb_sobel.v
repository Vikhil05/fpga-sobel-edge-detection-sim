module tb_sobel;

    reg clk = 0;
    reg rst = 1;

    wire [7:0] pixel_in;
    wire [7:0] edge_out;
    wire       edge_valid;

    // 100 MHz clock
    always #5 clk = ~clk;

    sobel_top_sim dut (
        .clk(clk),
        .rst(rst),
        .pixel_in_dbg(pixel_in),
        .edge_out_dbg(edge_out),
        .edge_valid_dbg(edge_valid)
    );

    initial begin
        rst = 1;
        #20;
        rst = 0;

        #2000;
        $finish;
    end

    initial begin
        $monitor("Time=%0t Pixel=%h Edge=%h Valid=%b",
                  $time, pixel_in, edge_out, edge_valid);
    end

endmodule
