module line_buffer #(
    parameter DATA_WIDTH = 8,
    parameter IMG_WIDTH  = 8
)(
    input  wire clk,
    input  wire rst,
    input  wire [DATA_WIDTH-1:0] pixel_in,
    input  wire valid_in,

    output reg [DATA_WIDTH-1:0] row0_0, row0_1, row0_2,
    output reg [DATA_WIDTH-1:0] row1_0, row1_1, row1_2,
    output reg [DATA_WIDTH-1:0] row2_0, row2_1, row2_2,
    output reg valid_out
);

    reg [DATA_WIDTH-1:0] line1 [0:IMG_WIDTH-1];
    reg [DATA_WIDTH-1:0] line2 [0:IMG_WIDTH-1];

    integer i;
    reg [$clog2(IMG_WIDTH)-1:0] col;
    reg [3:0] row;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            col <= 0;
            row <= 0;
            valid_out <= 0;
        end else if (valid_in) begin

            // shift line buffers
            for (i = IMG_WIDTH-1; i > 0; i = i - 1) begin
                line1[i] <= line1[i-1];
                line2[i] <= line2[i-1];
            end
            line1[0] <= pixel_in;
            line2[0] <= line1[IMG_WIDTH-1];

            // 3x3 window
            row0_0 <= line2[2]; row0_1 <= line2[1]; row0_2 <= line2[0];
            row1_0 <= line1[2]; row1_1 <= line1[1]; row1_2 <= line1[0];
            row2_0 <= pixel_in; row2_1 <= line1[0]; row2_2 <= line1[1];

            // counters
            if (col == IMG_WIDTH-1) begin
                col <= 0;
                row <= row + 1;
            end else begin
                col <= col + 1;
            end

            valid_out <= (row >= 2 && col >= 2);
        end
    end
endmodule
