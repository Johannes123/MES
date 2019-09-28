vsim -t ns -lib work work.rc_adder_tst
view *
do adder_wave.do
run 3000 ns
