library IEEE;
use IEEE.std_logic_1164.all;
entity flipflop is
	port(j_i: in std_logic;
		k_i: in std_logic;
		clk_i: in std_logic;
		reset_i: in std_logic;
		qout_o: out std_logic);
end flipflop;


-- VHDL description of a D-Flip Flop
-- with asynchronous reset
architecture rtl of flipflop is
	signal s_qout : std_logic;
	begin
	s_qout <= qout_o;
		p_ff: process(clk_i, reset_i)
		begin
			if reset_i = '1' then
				s_qout <= '0';
			elsif (clk_i'event and clk_i = '1') then
				if j_i = '0' and k_i = '1' then
					s_qout <= '0';
				elsif j_i = '1' and k_i = '0' then
					s_qout <= '1'
				elsif j_i = '1' and k_i = '1' then
					s_qout <= not qout_o;
				end if;
			end if;
			qout_o <= s_qout;
		end process p_ff;
	end rtl;