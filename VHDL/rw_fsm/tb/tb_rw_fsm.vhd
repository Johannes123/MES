-------------------------------------------------------------------------------
-- Title      : Testbench for design "rw_fsm"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tb_rw_fsm.vhd
-- Author     :   <puhm@PUHM-THINK>
-- Company    : 
-- Created    : 2018-09-19
-- Last update: 2018-09-19
-- Platform   :
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_rw_fsm is
end tb_rw_fsm;

architecture sim of tb_rw_fsm is

  constant C_INCLUDE_READ_FSM : boolean := false;
  
  -- component ports
  signal s_clk_i             : std_logic := '0';
  signal s_reset_i           : std_logic := '1';
  signal s_write_i           : std_logic;
  signal s_write_data_i      : std_logic_vector(7 downto 0);
  signal s_read_data_o       : std_logic_vector(7 downto 0);
  signal s_read_data_valid_o : std_logic;
  signal s_read_error_o      : std_logic;
  signal s_data_o            : std_logic;
  signal s_data_en_o         : std_logic;
  signal s_data_i            : std_logic;

  signal s_read_data_parallel : std_logic_vector(10 downto 0);

  component rw_fsm is
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
      data_i            : in  std_logic);
  end component rw_fsm;

begin  -- architecture sim

  -- component instantiation
  DUT: component rw_fsm
    port map (
      clk_i             => s_clk_i,
      reset_i           => s_reset_i,
      write_i           => s_write_i,
      write_data_i      => s_write_data_i,
      read_data_o       => s_read_data_o,
      read_data_valid_o => s_read_data_valid_o,
      read_error_o      => s_read_error_o,
      data_o            => s_data_o,
      data_en_o         => s_data_en_o,
      data_i            => s_data_i);

  -- clock generation
  s_clk_i <= not s_clk_i after 5 ns;

  s_reset_i <= '0' after 111 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    s_write_i <= '0';
    s_write_data_i <= (others => '0');
    s_data_i <= '1';
    wait for 200 ns;

    ---------------------------------------------------------------------
    -- WRITE TC
    -- TC 1.1:
    MSG_TC_1_1_START: assert false report "START TC 1-1" severity NOTE;
    s_write_i <= '1';
    s_write_data_i <= "00000000";
    wait for 10 ns;
    s_write_i <= '0';
    s_write_data_i <= (others => '0');
    MSG_TC_1_1_END: assert false report "end TC 1-1: serial output: ...111 0 + 00000000 + 0 111..." severity NOTE;
    wait for 1 us;
    
    -- TC 1.2:
    MSG_TC_1_2_START: assert false report "START TC 1-2" severity NOTE;
    s_write_i <= '1';
    s_write_data_i <= "10101010";
    wait for 10 ns;
    s_write_i <= '0';
    s_write_data_i <= (others => '0');
    MSG_TC_1_2_END: assert false report "end TC 1-2: serial output: ...111 0 + 01010101 + 0 111..." severity NOTE;
    wait for 1 us;
    
    -- TC 1.3:
    MSG_TC_1_3_START: assert false report "START TC 1-3" severity NOTE;
    s_write_i <= '1';
    s_write_data_i <= "01010101";
    wait for 10 ns;
    s_write_i <= '0';
    s_write_data_i <= (others => '0');
    MSG_TC_1_3_END: assert false report "end TC 1-3: serial output: ...111 0 + 10101010 + 0 111..." severity NOTE;
    wait for 1 us;
    
    -- TC 1.4:
    MSG_TC_1_4_START: assert false report "START TC 1-4" severity NOTE;
    s_write_i <= '1';
    s_write_data_i <= "11111111";
    wait for 10 ns;
    s_write_i <= '0';
    s_write_data_i <= (others => '0');
    MSG_TC_1_4_END: assert false report "end TC 1-4: serial output: ...111 0 + 11111111 + 0 111..." severity NOTE;
    wait for 1 us;

    -- TC 1.5:
    MSG_TC_1_5_START: assert false report "START TC 1-5: consecutive writes of 0x11, 0xEE, 0x22, 0xDD, 0x33" severity NOTE;
    s_write_i <= '1';
    s_write_data_i <= x"11";
    wait for 10 ns;
    s_write_data_i <= x"00";
    wait for 90 ns;
    s_write_data_i <= x"EE";
    wait for 10 ns;
    s_write_data_i <= x"00";
    wait for 90 ns;
    s_write_data_i <= x"22";
    wait for 10 ns;
    s_write_data_i <= x"00";
    wait for 90 ns;
    s_write_data_i <= x"DD";
    wait for 10 ns;
    s_write_data_i <= x"00";
    wait for 90 ns;
    s_write_data_i <= x"33";
    wait for 10 ns;
    s_write_data_i <= x"00";
    wait for 90 ns;
    s_write_i <= '0';
    MSG_TC_1_5_END: assert false report "end TC 1-5" severity NOTE;
    wait for 5 us;

    if C_INCLUDE_READ_FSM = true then
    ---------------------------------------------------------------------
    -- READ TC
    -- TC 2.1: read 0x00
    MSG_TC_2_1_START: assert false report "START TC 2-1" severity NOTE;
    s_read_data_parallel(10) <= '1'; -- back to idle
    s_read_data_parallel(9) <= '0'; -- STOPBIT
    s_read_data_parallel(8 downto 1) <= x"00";
    s_read_data_parallel(0) <= '0'; -- STARTBIT
    wait until s_clk_i = '1';
    for i in 0 to 10 loop
      s_data_i <= s_read_data_parallel(i);
      wait until s_clk_i = '1';
    end loop;
    MSG_TC_2_1_END: assert false report "end TC 2-1" severity NOTE;
    assert s_read_data_valid_o = '1' report "data invalid!" severity ERROR;
    assert s_read_data_o = x"00" report "data invalid!" severity ERROR;
    wait for 1 us;
    
    -- TC 2.2: read 0xFF
    MSG_TC_2_2_START: assert false report "START TC 2-2" severity NOTE;
    s_read_data_parallel(10) <= '1'; -- back to idle
    s_read_data_parallel(9) <= '0'; -- STOPBIT
    s_read_data_parallel(8 downto 1) <= x"FF";
    s_read_data_parallel(0) <= '0'; -- STARTBIT
    wait until s_clk_i = '1';
    for i in 0 to 10 loop
      s_data_i <= s_read_data_parallel(i);
      wait until s_clk_i = '1';
    end loop;
    MSG_TC_2_2_END: assert false report "end TC 2-2" severity NOTE;
    assert s_read_data_valid_o = '1' report "data invalid!" severity ERROR;
    assert s_read_data_o = x"FF" report "data invalid!" severity ERROR;
    wait for 1 us;
    
    -- TC 2.3: read 0xA5
    MSG_TC_2_3_START: assert false report "START TC 2-3" severity NOTE;
    s_read_data_parallel(10) <= '1'; -- back to idle
    s_read_data_parallel(9) <= '0'; -- STOPBIT
    s_read_data_parallel(8 downto 1) <= x"A5";
    s_read_data_parallel(0) <= '0'; -- STARTBIT
    wait until s_clk_i = '1';
    for i in 0 to 10 loop
      s_data_i <= s_read_data_parallel(i);
      wait until s_clk_i = '1';
    end loop;
    MSG_TC_2_3_END: assert false report "end TC 2-3" severity NOTE;
    assert s_read_data_valid_o = '1' report "data invalid!" severity ERROR;
    assert s_read_data_o = x"A5" report "data invalid!" severity ERROR;
    wait for 1 us;
    
    -- TC 2.4: read 0xEE wrong stop bit
    MSG_TC_2_4_START: assert false report "START TC 2-4" severity NOTE;
    s_read_data_parallel(10) <= '1'; -- back to idle
    s_read_data_parallel(9) <= '1'; -- STOPBIT <- error
    s_read_data_parallel(8 downto 1) <= x"EE";
    s_read_data_parallel(0) <= '0'; -- STARTBIT
    wait until s_clk_i = '1';
    for i in 0 to 10 loop
      s_data_i <= s_read_data_parallel(i);
      wait until s_clk_i = '1';
    end loop;
    MSG_TC_2_4_END: assert false report "end TC 2-4" severity NOTE;
    assert s_read_error_o = '1' report "data error not detected!" severity ERROR;
    assert s_read_data_valid_o = '0' report "data error not detected!" severity ERROR;
    wait for 1 us;

    end if; -- C_INCLUDE_READ_FSM
    
    wait;
    
  end process WaveGen_Proc;

end architecture sim;
