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

architecture sim of tb_and2databusses is

  component and2databusses
  port (a_i :   in std_logic_vector(31 downto 0);      
        b_i :   in std_logic_vector(31 downto 0);
		d_o : 	out std_logic_vector(31 downto 0));
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal a_i : std_logic_vector(31 downto 0);
  signal b_i : std_logic_vector(31 downto 0);
  signal d_o : std_logic_vector(31 downto 0);
  
begin

  -- Instantiate the fulladder design for testing
  i_and2databusses : and2databusses
  port map              
    (a_i   => a_i,
     b_i   => b_i,
     d_o  => d_o);

  p_test : process
    begin
      -- both 0
      a_i <= x"00000000";
      b_i <= x"00000000";
      wait for 200 ns;
      -- a=0 b=1
      a_i <= x"00000000";
      b_i <= x"FFFFFFFF";
      wait for 200 ns;
      -- a=1 b=0
      a_i <= x"FFFFFFFF";
      b_i <= x"00000000";
      wait for 200 ns;
      -- both 1
      a_i <= x"FFFFFFFF";
      b_i <= x"FFFFFFFF";
      wait for 200 ns;

    end process;

end sim;

