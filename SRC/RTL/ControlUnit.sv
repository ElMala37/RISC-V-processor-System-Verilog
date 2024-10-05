`timescale 1ns/1ps

module ControlUnit (
    input logic[31:0] instruction_i,
    output logic[4:0] rd_o,
    output logic[4:0] rs1_o,
    output logic[4:0] rs2_o,
    output logic[11:0] imm_o,
    output logic alu_ope_o,
    output logic alu_src_o
);

assign rd_o=instruction_i[11:7];
assign rs1_o=instruction_i[19:15];
assign rs2_o=instruction_i[24:20];
assign imm_o=instruction_i[31:20];

always_comb begin : alu_ordres
    if (instruction_i[6:0]==7'b0110011)
        assign alu_src_o=1'b0;
    else
        assign alu_src_o=1'b1;
    assign alu_ope_o=1'b1;
end

endmodule : ControlUnit