library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (clk   : in std_logic;
          count : out unsigned(9 downto 0));
end counter;

architecture rtl of counter is
    signal count_intern : unsigned(9 downto 0);
begin
    count <= count_intern;
    process(clk)
    begin
        if rising_edge(clk) then
            count_intern <= count_intern + 1;
        end if;
    end process;
end;