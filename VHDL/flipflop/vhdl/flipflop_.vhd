library IEEE;
use IEEE.std_logic_1164.all;
entity flipflop is
	port(data_i: in std_logic;
		clk_i: in std_logic;
		reset_i: in std_logic;
		qout_o: out std_logic);
end flipflop;


-- VHDL description of a D-Flip Flop
-- with asynchronous reset
architecture rtl of flipflop is
	begin
		p_ff: process(clk_i, reset_i)
		begin
			if reset_i = '1' then
				qout_o <= '0';
			elsif (clk_i'event and clk_i = '1') then
				qout_o <= data_i;
			end if;
		end process p_ff;
	end rtl;