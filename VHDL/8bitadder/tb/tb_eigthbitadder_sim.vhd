-------------------------------------------------------------------------------
--                                                                      
--                        eigthbitadder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_eigthbitadder
--
-- FILENAME:       tb_eigthbitadder_sim.vhd
-- 
-- ARCHITECTURE:   sim
-- 
-- ENGINEER:       Roland H�ller
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture of the eigthbitadder testbench
--                 for the eigthbitadder VHDL class example.
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

architecture sim of tb_eigthbitadder is

  component eigthbitadder
  port (data0_i, data1_i  :   in std_logic_vector(7 downto 0);      -- operands
        sum_o             :   out std_logic_vector(7 downto 0);      -- sum output
        cy_o              :   out std_logic);                       -- carry output
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
  signal data0_i : std_logic_vector(7 downto 0);
  signal data1_i : std_logic_vector(7 downto 0);
  signal sum_o : std_logic_vector(7 downto 0);
  signal cy_o : std_logic;
  
begin

  -- Instantiate the eigthbitadder design for testing
  i_eigthbitadder : eigthbitadder
  port map              
    ( data0_i   => data0_i,
      data1_i   => data1_i,
      sum_o     => sum_o,
      cy_o      => cy_o);

  p_test : process
    begin
      -- 
      data0_i <= x"00";
      data1_i <= x"00";
      wait for 200 ns;
      -- 
      data0_i <= x"FF";
      data1_i <= x"00";
      wait for 200 ns;
      -- 
      data0_i <= x"00";
      data1_i <= x"FF";
      wait for 200 ns;
      -- 
      data0_i <= x"FF";
      data1_i <= x"FF";
      wait for 200 ns;

    end process;

end sim;

