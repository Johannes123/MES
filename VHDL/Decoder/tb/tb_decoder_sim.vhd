-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_fulladder
--
-- FILENAME:       tb_fulladder_sim.vhd
-- 
-- ARCHITECTURE:   sim
-- 
-- ENGINEER:       Roland Höller
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture of the fulladder testbench
--                 for the fulladder VHDL class example.
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
-- CHANGES:        Version 2.0 - RH - 30 June 2000
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture sim of tb_decoder is

  component decoder
  port (data_i : in std_logic_vector(2 downto 0);      
		data_o : out std_logic_vector(7 downto 0));
  end component;
  
	signal data_i : std_logic_vector(2 downto 0);
	signal data_o : std_logic_vector(7 downto 0);
  
begin

  i_decoder : decoder
  port map             
    (data_i => data_i,
    data_o => data_o);

  p_test : process
    begin
		data_i <= "000";
		wait for 200 ns;
		data_i <= "001";
		wait for 200 ns;
		data_i <= "010";
		wait for 200 ns;
		data_i <= "011";
		wait for 200 ns;
		data_i <= "100";
		wait for 200 ns;
		data_i <= "101";
		wait for 200 ns;
		data_i <= "110";
		wait for 200 ns;
		data_i <= "111";
		wait;
    end process;

end sim;

