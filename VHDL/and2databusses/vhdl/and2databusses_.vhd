library IEEE;
use IEEE.std_logic_1164.all;

entity and2databusses is
  port (a_i :   in std_logic_vector(31 downto 0); --operand a
        b_i :   in std_logic_vector(31 downto 0); --operand b
        d_o :  out std_logic_vector(31 downto 0)); --ouput
end and2databusses;

architecture struc of and2databusses is
begin
	d_o <= a_i and b_i;
end struc;