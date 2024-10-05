`timescale 1ns/1ps

module mux(
    input logic sel_i,
    input logic[31:0] a_i,
    input logic[31:0] b_i,
    output logic[31:0] s_o
);

always_comb begin : select_input
    case (sel_i)
        0:s_o=a_i;
        1:s_o=b_i;
        default:s_o=b_i;
    endcase
end

endmodule : mux