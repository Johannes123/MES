library IEEE;
use IEEE.std_logic_1164.all;

entity tb_flipflop is
end tb_flipflop;

architecture sim of tb_flipflop is

  component flipflop
  port (j_i: in std_logic;
		k_i: in std_logic;
		clk_i: in std_logic;
		reset_i: in std_logic;
		qout_o: out std_logic);
  end component;
  
  -- Declare the signals used stimulating the design's inputs.
	signal s_j : std_logic := '0';
	signal s_k : std_logic := '0';
	signal s_clk : std_logic := '0';
	signal s_reset : std_logic := '1';
	signal s_qout : std_logic;

  
begin
	s_clk <= not s_clk after 20 ns;
  -- Instantiate the fulladder design for testing
  u1 : flipflop
  port map              
    (data_i => s_data,
	clk_i => s_clk,
	reset_i => s_reset,
	qout_o => s_qout);

  p_test : process
    begin
	  s_reset <= '0';
	  wait for 10 ns;
		
      s_data <= '1';
	  wait for 200 ns;
	  
	  s_data <= '0';
	  wait for 200 ns;
    end process;

end sim;
