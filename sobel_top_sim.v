module sobel_top_sim (
    input  wire clk,
    input  wire rst,
    output wire [7:0] pixel_in_dbg,
    output wire [7:0] edge_out_dbg,
    output wire edge_valid_dbg
);

    wire [7:0] pixel;
    wire valid_pixel;

    wire [7:0] r00,r01,r02,r10,r11,r12,r20,r21,r22;
    wire win_valid;

    test_pattern tp (
        .clk(clk),
        .rst(rst),
        .pixel_out(pixel),
        .valid_out(valid_pixel)
    );

    line_buffer lb (
        .clk(clk),
        .rst(rst),
        .pixel_in(pixel),
        .valid_in(valid_pixel),
        .row0_0(r00), .row0_1(r01), .row0_2(r02),
        .row1_0(r10), .row1_1(r11), .row1_2(r12),
        .row2_0(r20), .row2_1(r21), .row2_2(r22),
        .valid_out(win_valid)
    );

    sobel_filter sf (
        .clk(clk),
        .rst(rst),
        .row0_0(r00), .row0_1(r01), .row0_2(r02),
        .row1_0(r10), .row1_1(r11), .row1_2(r12),
        .row2_0(r20), .row2_1(r21), .row2_2(r22),
        .valid_in(win_valid),
        .edge_out(edge_out_dbg),
        .valid_out(edge_valid_dbg)
    );

    assign pixel_in_dbg = pixel;

endmodule
