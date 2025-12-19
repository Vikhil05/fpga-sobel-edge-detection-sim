module test_pattern #(
    parameter WIDTH  = 8,
    parameter HEIGHT = 8
)(
    input wire clk,
    input wire rst,
    output reg [7:0] pixel_out,
    output reg valid_out
);

    reg [3:0] row = 0;
    reg [3:0] col = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            row <= 0;
            col <= 0;
            valid_out <= 0;
        end else begin
            valid_out <= 1;
            pixel_out <= ((row[1] ^ col[1]) ? 8'hFF : 8'h00);

            if (col == WIDTH-1) begin
                col <= 0;
                row <= (row == HEIGHT-1) ? 0 : row + 1;
            end else begin
                col <= col + 1;
            end
        end
    end
endmodule
