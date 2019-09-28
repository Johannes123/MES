onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_flipflop/s_clk
add wave -noupdate -format Logic /tb_flipflop/s_data
add wave -noupdate -format Logic /tb_flipflop/s_reset
add wave -noupdate -format Logic /tb_flipflop/s_qout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
