`timescale 1ns/1ps

module register_file(
    input logic[4:0] R_adress1_i,
    input logic[4:0] R_adress2_i,
    input logic[4:0] W_adress_i,
    input logic clock_i,
    input logic resetb_i,
    input logic write_ena_i,
    input logic[31:0] d_i,
    output logic[31:0] q1_o,
    output logic[31:0] q2_o
);

logic[31:0] regfile_s[32];

always @(posedge clock_i or negedge resetb_i) begin
    if (resetb_i==1'b0)
        // Réinitialiser tous les registres à 0
        for (int i = 0; i < 32; i++) begin
            regfile_s[i] <= 32'b0;
        end
    else if (write_ena_i && W_adress_i != 5'b0)
        regfile_s[W_adress_i] <= d_i;
end

assign q1_o=regfile_s[R_adress1_i];
assign q2_o=regfile_s[R_adress2_i];

endmodule : register_file