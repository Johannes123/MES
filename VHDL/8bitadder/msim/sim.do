vsim -t ns -lib work work.tb_eigthbitadder
view *
#do eigthbitadder_wave.do replaced with my own wave config
do wave.do
run 3000 ns
