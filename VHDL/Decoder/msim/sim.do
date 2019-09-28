vsim -t ns -lib work work.tb_decoder 
view *
do decoder_wave.do
run 1600 ns
