-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         andgate
--
-- FILENAME:       andgate_rtl.vhd
-- 
-- ARCHITECTURE:   rtl
-- 
-- ENGINEER:       Roland H�ller
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the architecture rtl of the andgate submodule
--                 of the fulladder VHDL class example.
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
use ieee.numeric_std.all;

entity eigthbitadder is
  port (data0_i, data1_i  :   in std_logic_vector(7 downto 0);      -- operands
        sum_o             :   out std_logic_vector(7 downto 0);      -- sum output
        cy_o              :   out std_logic);                       -- carry output
end eigthbitadder;

architecture rtl of eigthbitadder is
begin
  p_add : process (data0_i, data1_i) 
  variable sum : std_logic_vector(8 downto 0);

  begin
    sum := std_logic_vector(unsigned('0' & data0_i) + unsigned('0' & data1_i));
    cy_o <= sum(8);
    sum_o <= sum(7 downto 0);

  end process p_add;
end rtl;
