vsim -t ns -lib work work.tb_flipflop
view *
do flipflop_wave.do
run 3000 ns
