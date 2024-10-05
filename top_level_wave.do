onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_level_tb/instruction_s
add wave -noupdate /top_level_tb/clock_s
add wave -noupdate /top_level_tb/resetb_s
add wave -noupdate /top_level_tb/write_ena_s
add wave -noupdate -expand /top_level_tb/DUT/registres/regfile_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {79522 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {210 ns}
run 200ns