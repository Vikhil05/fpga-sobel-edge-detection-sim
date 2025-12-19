module sobel_filter (
    input wire clk,
    input wire rst,
    input wire [7:0] row0_0, row0_1, row0_2,
    input wire [7:0] row1_0, row1_1, row1_2,
    input wire [7:0] row2_0, row2_1, row2_2,
    input wire valid_in,

    output reg [7:0] edge_out,
    output reg valid_out
);

    wire signed [10:0] gx = 
        -row0_0 + row0_2
        - (row1_0 << 1) + (row1_2 << 1)
        - row2_0 + row2_2;

    wire signed [10:0] gy =
        -row0_0 - (row0_1 << 1) - row0_2 +
         row2_0 + (row2_1 << 1) + row2_2;

    wire [10:0] mag = (gx < 0 ? -gx : gx) + (gy < 0 ? -gy : gy);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            edge_out <= 0;
            valid_out <= 0;
        end else if (valid_in) begin
            edge_out <= (mag > 255) ? 8'hFF : mag[7:0];
            valid_out <= 1;
        end else begin
            valid_out <= 0;
        end
    end

endmodule
