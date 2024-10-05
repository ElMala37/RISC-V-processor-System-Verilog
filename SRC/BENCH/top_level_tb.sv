`timescale 1ns/1ps

module top_level_tb();

logic[31:0] instruction_s;
logic clock_s;
logic resetb_s;
logic write_ena_s;

top_level DUT(
    .instruction_i(instruction_s),
    .clock_i(clock_s),
    .resetb_i(resetb_s),
    .write_ena_i(write_ena_s)
);

//clock generation 100MHz
initial
    begin
        clock_s=0;
        forever #5 clock_s=~clock_s;
    end

//stimuli
initial
    begin
        resetb_s=1'b0;//mettre tout les registres à 0
        #7; //décalage pour que la valeur se stabilise avant le front montant de l'horloge
        #50
        resetb_s=1'b1;
        #20
        write_ena_s=1'b1;//Ecrire dans les registres
        #50
        instruction_s=32'h00108093;
        #10;
        instruction_s=32'h00108133;
        #10;
        instruction_s=32'h001101b3;
        #10;
    end

endmodule : top_level_tb