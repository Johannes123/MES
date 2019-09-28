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
use IEEE.std_logic_1164.all;

entity decoder is
  port (data_i : in std_logic_vector(2 downto 0);      
        data_o : out std_logic_vector(7 downto 0));
end decoder;

architecture struc of decoder is
	
begin
	logic_0 : process (data_i)
		begin
			if data_i = "000" then
				data_o <= "00000001";
				elsif data_i = "001" then
				data_o <= "00000010";
				elsif data_i = "010" then
				data_o <= "00000100";
				elsif data_i = "011" then
				data_o <= "00001000";
				elsif data_i = "100" then
				data_o <= "00010000";
				elsif data_i = "101" then
				data_o <= "00100000";
				elsif data_i = "110" then
				data_o <= "01000000";
				elsif data_i = "111" then
				data_o <= "10000000";
			end if;
		end process logic_0;
end struc;

