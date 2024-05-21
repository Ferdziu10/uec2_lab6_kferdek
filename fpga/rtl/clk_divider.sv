module clk_divider(
    input logic clk,
    output logic clk50MHz
);

logic counter;

always_ff @(posedge clk) begin
    counter <= counter + 1;
    if (counter == 1) begin
        clk50MHz <= ~clk50MHz;
        counter <= '0;
    end
end
endmodule