vsim -novopt -t ns -lib work work.tb_rw_fsm
view *
do wave.do
run 20 us
