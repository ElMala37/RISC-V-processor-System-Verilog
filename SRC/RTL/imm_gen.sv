`timescale 1ns/1ps

module imm_gen(
    input logic[11:0] imm_11_i,
    output logic[31:0] imm_32_o
);

always_comb begin : ext_signe
    if (imm_11_i[11]==1'b1) begin : g_ext_signe_pos
        imm_32_o[31:12]=20'b11111111111111111111;
        imm_32_o[11:0]=imm_11_i;
        end
    else begin : g_ext_signe_neg
        imm_32_o[31:12]=20'b0;
        imm_32_o[11:0]=imm_11_i;
    end
end

endmodule : imm_gen