`timescale 1ns/1ps

module register (
    input logic clock_i,
    input logic resetb_i,
    input logic[7:0] d_i,
    output logic[7:0] q_o
);

always @(posedge clock_i or negedge resetb_i) begin : seq
    if (resetb_i==1'b0)
        q_o=8'b0;
    else
        q_o=d_i;
end

endmodule : register