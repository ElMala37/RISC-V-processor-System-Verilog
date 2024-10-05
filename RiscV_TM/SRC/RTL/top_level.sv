`timescale 1ns/1ps

module top_level (
    input logic[31:0] instruction_i,
    input logic clock_i,
    input logic resetb_i,
    input logic write_ena_i
);

logic[4:0] rd_s;
logic[4:0] rs1_s;
logic[4:0] rs2_s;
logic[11:0] imm_s;
logic alu_ope_s;
logic alu_src_s;

logic[31:0] outmux_s;
logic[31:0] outimg_s;
logic[31:0] outalu_s;

logic[31:0] outreg_1_s;
logic[31:0] outreg_2_s;

ControlUnit cu(
    .instruction_i(instruction_i),
    .rs1_o(rs1_s),
    .rs2_o(rs2_s),
    .rd_o(rd_s),
    .imm_o(imm_s),
    .alu_src_o(alu_src_s),
    .alu_ope_o(alu_ope_s)
);

imm_gen ig(
    .imm_11_i(imm_s),
    .imm_32_o(outimg_s)
);

mux mux_alu_src(
    .sel_i(alu_src_s),
    .a_i(outreg_2_s),
    .b_i(outimg_s),
    .s_o(outmux_s)
);

ALU alu(
    .sel_i(alu_ope_s),
    .a_i(outreg_1_s),
    .b_i(outmux_s),
    .s_o(outalu_s)
);

register_file registres(
    .clock_i(clock_i),
    .resetb_i(resetb_i),
    .write_ena_i(write_ena_i),
    .R_adress1_i(rs1_s),
    .R_adress2_i(rs2_s),
    .W_adress_i(rd_s),
    .d_i(outalu_s),
    .q1_o(outreg_1_s),
    .q2_o(outreg_2_s)
);

endmodule : top_level