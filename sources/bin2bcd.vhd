library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bin2bcd is
  port( clk     : in  std_logic;
        rst     : in  std_logic;
        DATA_OK : in  std_logic;
        DATA    : in  std_logic_vector( 11 downto 0);
        BCD_OK  : out std_logic;
        BCD     : out std_logic_vector( 15 downto 0));
end bin2bcd;
architecture rtl of bin2bcd is

begin

end rtl;

