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
signal APTO     : std_logic;
signal A     : std_logic;
signal BCD_BUENO : std_logic_vector(15 downto 0);
signal DISP   : unsigned(2 downto 0);
signal BCD_SEG : std_logic_vector(3 downto 0);
signal BCD_TROZO : unsigned(3 downto 0);

begin  -- rtl
  process(CLK,RST,BCD_OK)
    begin
    if RST = '1' then
      BCD_BUENO <= (others => '0');
    elsif CLK'event and CLK = '1' then
      APTO <= A and BCD_OK;
      A <= BCD_OK;
      if(APTO='1')then
        BCD_BUENO <= BCD;
      end if;
    end if;
  end process;
    
  process
    begin
        DISP <= DISP + 1;
        wait for 10 ms;  
  end process;
  
  process(DISP,BCD_BUENO,BCD_TROZO,BCD_SEG)
       
    begin
    AND_30 <= (others => '1');
    AND_30(to_integer(DISP))<= '0';
    for j in BCD_SEG'range loop
        BCD_SEG(j)<=BCD_BUENO(to_integer(BCD_TROZO));
        BCD_TROZO <=    BCD_TROZO + 1;
    end loop;
    case BCD_SEG is
     when "0000" =>
        SEG_AG <= "1000000";--0
     when "0001" =>
        SEG_AG <= "1111001";--1
     when "0010" =>
        SEG_AG <= "0100100";--2
     when "0011" =>
        SEG_AG <= "0110000";--3
     when "0100" =>
        SEG_AG <= "0011001";--4
     when "0101" =>
        SEG_AG <= "0010010";--5
     when "0110" =>
        SEG_AG <= "0000010";--6
     when "0111" =>
        SEG_AG <= "1111000";--7
     when "1000" =>
        SEG_AG <= "0000000";--8
     when "1001" =>
        SEG_AG <= "0011000";--9
     when others =>
        SEG_AG <= "0111111";--central
     end case;
    if(to_integer(DISP)=3) then 
        DP<='0';
    else
        DP<='1';
    end if;  
  end process;
  
  
end rtl;

