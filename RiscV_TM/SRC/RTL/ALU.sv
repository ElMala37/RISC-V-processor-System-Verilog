`timescale 1ns/1ps

module ALU (
    input logic sel_i,
    input logic[31:0] a_i,
    input logic[31:0] b_i,
    output logic[31:0] s_o
);

always_comb begin : calcul
    if (sel_i==1)
        s_o=a_i+b_i;
    else
        s_o=32'b0;
end

endmodule : ALU