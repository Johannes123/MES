-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         tb_fulladder
--
-- FILENAME:       tb_fulladder_.vhd
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
-- DESCRIPTION:    This is the entity declaration of the fulladder testbench
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
use IEEE.STD_LOGIC_1164.ALL;

entity rc_adder_tst is

end rc_adder_tst;

architecture beh of rc_adder_tst is
component rc_adder is
port ( a , b : in std_logic_vector(7 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(7 downto 0);
		cout : out std_logic);
end component;
signal a_s,b_s,sum_s : std_logic_vector (7 downto 0);
signal cin_s,cout_s : std_logic;
begin

DUT : rc_adder port map (a_s, b_s, cin_s, sum_s, cout_s);
process
 begin
  a_s <= "10101010";
  b_s <= "01010101";
  cin_s <= '0';
  wait for 10 ns;
  
  a_s <= "11001100";
  b_s <= "11110000";
  cin_s <= '1';
  wait for 10 ns;
  
  a_s <= "11010111";
  b_s <= "01011010";
  cin_s <= '0';
  wait for 10 ns;
  
  a_s <= "10110011";
  b_s <= "11111111";
  cin_s <= '1';
  wait for 10 ns;
 end process;
 
end beh;