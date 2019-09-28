-------------------------------------------------------------------------------
--                                                                      
--                        Counter Project Base
--  
-------------------------------------------------------------------------------
--                                                                      
-- ENTITY:         rw_fsm
--
-- FILENAME:       rw_fsm_.vhd
-- 
-- ARCHITECTURE:   
-- 
-- ENGINEER:       Andreas Puhm
--
-- DATE:           2018-09-19
--
-- VERSION:        1.0
--
-------------------------------------------------------------------------------
--                                                                      
-- DESCRIPTION:    This describes the entity of the
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

entity rw_fsm is
  port (
    clk_i             : in  std_logic;
    reset_i           : in  std_logic;
    write_i           : in  std_logic;
    write_data_i      : in  std_logic_vector(7 downto 0);
    read_data_o       : out std_logic_vector(7 downto 0);
    read_data_valid_o : out std_logic;
    read_error_o      : out std_logic;
    data_o            : out std_logic;
    data_en_o         : out std_logic;
    data_i            : in  std_logic
    );
end rw_fsm;
