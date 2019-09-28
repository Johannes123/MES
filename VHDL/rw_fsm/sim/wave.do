onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rw_fsm/s_clk_i
add wave -noupdate /tb_rw_fsm/s_write_i
add wave -noupdate /tb_rw_fsm/s_write_data_i
add wave -noupdate /tb_rw_fsm/s_data_o
add wave -noupdate /tb_rw_fsm/s_data_en_o
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_1_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_1_END
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_2_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_2_END
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_3_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_3_END
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_4_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_4_END
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_5_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_1_5_END
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_2_1_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_2_1_END
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_2_2_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_2_2_END
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_2_3_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_2_3_END
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_2_4_START
add wave -noupdate /tb_rw_fsm/WaveGen_Proc#MSG_TC_2_4_END
add wave -noupdate /tb_rw_fsm/DUT/clk_i
add wave -noupdate /tb_rw_fsm/DUT/reset_i
add wave -noupdate /tb_rw_fsm/DUT/write_i
add wave -noupdate /tb_rw_fsm/DUT/write_data_i
add wave -noupdate /tb_rw_fsm/DUT/read_data_o
add wave -noupdate /tb_rw_fsm/DUT/read_data_valid_o
add wave -noupdate /tb_rw_fsm/DUT/read_error_o
add wave -noupdate /tb_rw_fsm/DUT/data_o
add wave -noupdate /tb_rw_fsm/DUT/data_en_o
add wave -noupdate /tb_rw_fsm/DUT/data_i
add wave -noupdate /tb_rw_fsm/DUT/s_state
add wave -noupdate /tb_rw_fsm/DUT/s_bitcount
add wave -noupdate /tb_rw_fsm/DUT/s_data_en
add wave -noupdate /tb_rw_fsm/DUT/s_data_o
add wave -noupdate /tb_rw_fsm/DUT/s_read_error
add wave -noupdate /tb_rw_fsm/DUT/s_read_data_valid
add wave -noupdate /tb_rw_fsm/DUT/s_read_data
add wave -noupdate /tb_rw_fsm/DUT/s_internal_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9779 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 219
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {12981 ns} {13414 ns}
