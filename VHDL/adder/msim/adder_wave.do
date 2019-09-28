onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /rc_adder_tst/a_s
add wave -noupdate -format Logic /rc_adder_tst/b_s
add wave -noupdate -format Logic /rc_adder_tst/cin_s
add wave -noupdate -format Logic /rc_adder_tst/sum_s
add wave -noupdate -format Logic /rc_adder_tst/cout_s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
