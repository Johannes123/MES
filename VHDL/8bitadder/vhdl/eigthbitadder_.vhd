-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         eigthbitadder
--
-- FILENAME:       eigthbitadder_.vhd
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
-- DESCRIPTION:    This is the entity declaration of the eigthbitadder submodule
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

entity eigthbitadder is
  port (data0_i, data1_i  :   in std_logic_vector(7 downto 0);      -- operands
        sum_o             :   out std_logic_vector(7 downto 0);      -- sum output
        cy_o              :   out std_logic);                       -- carry output
end eigthbitadder;

