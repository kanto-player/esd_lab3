library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity middle_reg is
    port(clk : in std_logic;
         ain : in unsigned(7 downto 0);
         bin : in signed(7 downto 0);
         aout : out unsigned(7 downto 0);
         bout : out signed(7 downto 0));
end middle_reg;

architecture rtl of middle_reg is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            aout <= ain;
            bout <= bin;
        end if;
    end process;
end rtl;