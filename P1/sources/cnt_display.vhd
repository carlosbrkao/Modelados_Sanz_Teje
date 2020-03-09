library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cnt_display is
  port (
    CLK    : in  std_logic;
    RST    : in  std_logic;
    BCD    : in  std_logic_vector(15 downto 0);
    BCD_OK : in  std_logic;
    AND_30 : out std_logic_vector(3 downto 0);
    DP     : out std_logic;
    SEG_AG : out std_logic_vector(6 downto 0));
end cnt_display;

architecture rtl of cnt_display is

begin  -- rtl
  
end rtl;

