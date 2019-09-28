-------------------------------------------------------------------------------
--                                                                      
--                        Read-Write FSM example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         rw_fsm
--
-- FILENAME:       rw_fsm_rtl.vhd
-- 
-- ARCHITECTURE:   RTL
-- 
-- ENGINEER:       Andreas Puhm
--
-- DATE:           2018-09-19
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This describes the architecture of the
--                 Read/Write example FSM.
--
--
-------------------------------------------------------------------------------
--
-- REFERENCES:     (none)
--
-------------------------------------------------------------------------------
--                                                                      
-- PACKAGES:       std_logic_1164 (IEEE library)
--
-------------------------------------------------------------------------------
--                                                                      
-- CHANGES:
--                 1.0 - initial version
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

architecture rtl of rw_fsm is

type t_state is (state_idle, 
				state_bit_start,
				state_bit_0,
				state_bit_1,
				state_bit_2,
				state_bit_3,
				state_bit_4,
				state_bit_5,
				state_bit_6,
				state_bit_7,
				state_bit_stop);
	
	signal s_state : t_state := state_idle;
	
begin
  -- default values for unused signals (used only for read FSM)
  read_data_o <= (others => '0');
  read_data_valid_o <= '0';
  read_error_o <= '0';
  
	p_state : process(clk_i, write_i, reset_i)
	
	begin
		if reset_i = '0' then
			s_state <= state_idle;
			elsif write_i = '1' and s_state = state_idle and clk_i'event and clk_i = '1' then
				s_state <= state_bit_start;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_start then
				s_state <= state_bit_0;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_0 then
				s_state <= state_bit_1;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_1 then
				s_state <= state_bit_2;	
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_2 then
				s_state <= state_bit_3;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_3 then
				s_state <= state_bit_4;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_4 then
				s_state <= state_bit_5;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_5 then
				s_state <= state_bit_6;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_6 then
				s_state <= state_bit_7;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_7 then
				s_state <= state_bit_stop;
			elsif clk_i'event and clk_i = '1' and s_state = state_bit_stop then
				s_state <= state_idle;
		end if;
		
		case s_state is
			when state_idle =>
				data_o <= '1';
				data_en_o <= '0';
			when state_bit_start =>
				data_o <= '0';
				data_en_o <= '1';
			when state_bit_0 =>
				data_o <= write_data_i(3);
			when state_bit_1 =>
				data_o <= write_data_i(2);
			when state_bit_2 =>
				data_o <= write_data_i(1);
			when state_bit_3 =>
				data_o <= write_data_i(0);
			when state_bit_4 =>
				data_o <= write_data_i(7);
			when state_bit_5 =>
				data_o <= write_data_i(6);
			when state_bit_6 =>
				data_o <= write_data_i(5);
			when state_bit_7 =>
				data_o <= write_data_i(4);
			when state_bit_stop =>
				data_o <= '0';
		end case;
	end process p_state;
	
end rtl;
