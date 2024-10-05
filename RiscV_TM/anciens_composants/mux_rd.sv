`timescale 1ns/1ps

module mux_rd #(parameter register=0)(
    input logic[4:0] rd_i,
    input logic[7:0] alu_output_i,
    input logic[7:0] val_reg_i,
    output logic[7:0] s_o
);

always_comb begin : select_input
    if (rd_i==register)
        register:s_o=alu_output_i;
    else
        s_0=val_reg_i;
end

endmodule : mux_rd