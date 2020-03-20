
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity cnt_display_tb is
end cnt_display_tb;

architecture sim of cnt_display_tb is
    --COMPONENTES
    component cnt_display
        port (
            CLK : in std_logic;
            RST : in std_logic;
            BCD    : in  std_logic_vector(15 downto 0);
            BCD_OK : in  std_logic;
            AND_30 : out std_logic_vector(3 downto 0);
            DP     : out std_logic;
            SEG_AG : out std_logic_vector(6 downto 0));
    end component;
    --SEÑALES
    signal RELOJ : std_logic := '0';
    signal RESET : std_logic := '1';
    signal BCD_NUMERO : std_logic_vector(15 downto 0);
    signal BCD_OK_NUMERO :  std_logic := '0';
    signal AND_30_SALIDA_DISPLAY :  std_logic_vector(3 downto 0);
    signal DP_PUNTO     :  std_logic;
    signal SEG_AG_DISPLAY_SELEC :  std_logic_vector(6 downto 0);
    signal NUM_BINARIO : std_logic_vector(3 downto 0);
begin

    DUT: cnt_display
        port map(
            CLK => RELOJ,
            RST => RESET,
            BCD => BCD_NUMERO,
            BCD_OK => BCD_OK_NUMERO,
            AND_30 => AND_30_SALIDA_DISPLAY,
            DP => DP_PUNTO,
            SEG_AG => SEG_AG_DISPLAY_SELEC);
            
    RESET <= '0' after 123 ns;
    RELOJ <= NOT RELOJ after 5 ns;
    
    --NUEVOS DATOS BCD
    process
    begin
        BCD_NUMERO <= "0001100110011001";
        wait until RELOJ = '0';
        BCD_OK_NUMERO <= '1';
        wait until RELOJ = '0';
        BCD_OK_NUMERO <= '0';
        wait for 5000 ns;
        BCD_NUMERO <= "0000000000000000";
        wait until RELOJ = '0';
        BCD_OK_NUMERO <= '1';
        wait until RELOJ = '0';
        BCD_OK_NUMERO <= '0';
    end process;
    
    --SALIDA DISPLAY
    --process
    --begin
    --end process;
    
end sim;
