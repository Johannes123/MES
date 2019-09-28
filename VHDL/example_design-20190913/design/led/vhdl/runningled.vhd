-------------------------------------------------------------------------------
--                                                                           --
--                                                                           --
--                        X        XXXXXXXX  XXXXXXX                         --
--                        X        X         X      X                        --
--                        X        X         X      X                        --
--                        X        X         X      X                        --
--                        X        XXXXXXX   X      X                        --
--                        X        X         X      X                        --
--                        X        X         X      X                        --
--                        X        X         X      X                        --
--                        XXXXXXXX XXXXXXXX  XXXXXXX                         --
--                                                                           --
--                                                                           --
--       F A C H H O C H S C H U L E   -   T E C H N I K U M   W I E N       --
--                                                                           --
--                         Embedded Systems Division                         --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--         Web:           http://www.technikum-wien.at/                      --
--                                                                           --
--         Contact:                                                          --
--                                                                           --
-------------------------------------------------------------------------------
--
--
--         Author:                 
--
--         Filename:               led.vhd
--
--         Date of Creation:       
--
--         Version:                $Revision$
--
--         Date of Latest Version: $Date$
--
--
--         Description: Describe a simple running LED
--
--
--
-------------------------------------------------------------------------------
--
--  CVS Change Log:
--
--  $Log$
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity led is
  port ( leds  : out std_logic_vector (15 downto 0);
         reset : in  std_logic;
         clk   : in  std_logic);
end led;

architecture rtl of led is
  signal s_ckd : std_logic_vector(28 downto 0);  -- used for prescaler
begin
  -----------------------------------------------------------------------------
  -- Divide the 100MHz input clock, generate slow enable signal.
  -----------------------------------------------------------------------------
  p_prescaler : process (clk, reset)
  begin
    if (reset = '1') then
      s_ckd <= (others => '0');
    elsif (clk = '1' and clk'event) then
      s_ckd <= std_logic_vector(unsigned(s_ckd) + to_unsigned(1, 1));
    end if;
  end process p_prescaler;
  -----------------------------------------------------------------------------
  -- Let LED run.
  -----------------------------------------------------------------------------
  p_leds : process (clk, reset)
  begin
    if (reset = '1') then
      leds <= (others => '0');
    elsif (clk = '1' and clk'event) then
      if (s_ckd(28 downto 25) = "0000") then
        leds <= "0000000000000001";
      elsif (s_ckd(28 downto 25) = "0001") then
        leds <= "0000000000000010";
      elsif (s_ckd(28 downto 25) = "0010") then
        leds <= "0000000000000100";
      elsif (s_ckd(28 downto 25) = "0011") then
        leds <= "0000000000001000";
      elsif (s_ckd(28 downto 25) = "0100") then
        leds <= "0000000000010000";
      elsif (s_ckd(28 downto 25) = "0101") then
        leds <= "0000000000100000";
      elsif (s_ckd(28 downto 25) = "0110") then
        leds <= "0000000001000000";
      elsif (s_ckd(28 downto 25) = "0111") then
        leds <= "0000000010000000";
      elsif (s_ckd(28 downto 25) = "1000") then
        leds <= "0000000100000000";
      elsif (s_ckd(28 downto 25) = "1001") then
        leds <= "0000001000000000";
      elsif (s_ckd(28 downto 25) = "1010") then
        leds <= "0000010000000000";
      elsif (s_ckd(28 downto 25) = "1011") then
        leds <= "0000100000000000";
      elsif (s_ckd(28 downto 25) = "1100") then
        leds <= "0001000000000000";
      elsif (s_ckd(28 downto 25) = "1101") then
        leds <= "0010000000000000";
      elsif (s_ckd(28 downto 25) = "1110") then
        leds <= "0100000000000000";
      elsif (s_ckd(28 downto 25) = "1111") then
        leds <= "1000000000000000";
      end if;
    end if;
  end process p_leds;
end rtl;
