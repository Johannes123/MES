-------------------------------------------------------------------------------
--                                                                      
--                        Fulladder VHDL Class Example
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         fulladder
--
-- FILENAME:       fulladder_.vhd
-- 
-- ARCHITECTURE:   struc
-- 
-- ENGINEER:       Roland Höller
--
-- DATE:           30. June 2000
--
-- VERSION:        1.0
--                          
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This is the entity declaration of the fulladder
--                 VHDL class example.
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

entity rc_adder is
port 	(a , b : in std_logic_vector(7 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(7 downto 0);
		cout : out std_logic);
end rc_adder;

architecture structural of rc_adder is

component full_adder_con is
  port (a, b, c : in  std_logic;            -- inputs
		sum, ca : out std_logic);           -- sum & carry
end component;
signal carry : std_logic_vector(6 downto 0);

begin
	U1 : full_adder_con port map (a(0),b(0),cin,sum(0),carry(0));
	U2 : for i in 1 to 6 generate
	U3 : full_adder_con port map (a(i),b(i),carry(i-1),sum(i),carry(i));
end generate;
	U4 : full_adder_con port map (a(7),b(7),carry(6),sum(7),cout);

end structural;

