
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_ap1_tb is
end test_ap1_tb;

architecture sim of test_ap1_tb is
    --COMPONENTES
    component test_ap1
        port (
            CLK    : in  std_logic;
            RST    : in  std_logic;
            SW_OK  : in  std_logic;
            SW     : in  std_logic_vector(15 downto 0);
            AND_30 : out std_logic_vector(3 downto 0);
            DP     : out std_logic;
            SEG_AG : out std_logic_vector(6 downto 0));
    end component;
    --SEÑALES
    signal RELOJ : std_logic := '0';
    signal RESET : std_logic := '1';
    signal SW_NUMERO : std_logic_vector(15 downto 0);
    signal SW_OK_NUMERO :  std_logic := '0';
    signal AND_30_SALIDA_DISPLAY :  std_logic_vector(3 downto 0);
    signal DP_PUNTO     :  std_logic;
    signal SEG_AG_DISPLAY_SELEC :  std_logic_vector(6 downto 0);
begin

    DUT: test_ap1
        port map(
            CLK => RELOJ,
            RST => RESET,
            SW => SW_NUMERO,
            SW_OK => SW_OK_NUMERO,
            AND_30 => AND_30_SALIDA_DISPLAY,
            DP => DP_PUNTO,
            SEG_AG => SEG_AG_DISPLAY_SELEC);
            
    RESET <= '0' after 123 ns;
    RELOJ <= NOT RELOJ after 5 ns;
    
    --NUEVOS DATOS BCD
    process
    begin
        wait for 200ns;
        SW_NUMERO <= "0001100110011001";
        wait until RELOJ = '0';
        SW_OK_NUMERO <= '1';
        wait for 10ns;
        wait until RELOJ = '0';
        SW_OK_NUMERO <= '0';
        wait for 4 ms;
        SW_NUMERO <= "0000000000000000";
        wait until RELOJ = '0';
        SW_OK_NUMERO <= '1';
        wait for 10ns;
        wait until RELOJ = '0';
        SW_OK_NUMERO <= '0';
        wait for 4 ms;
        report "fin controlado d ela simulación" severity failure;
    end process;
end sim;
