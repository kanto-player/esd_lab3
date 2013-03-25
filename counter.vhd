library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (clk   : in std_logic;
          count : out unsigned(7 downto 0));
end counter;

architecture rtl of counter is
    signal count_intern : unsigned(7 downto 0) := x"00";
begin
    count <= count_intern;
    process(clk)
    begin
        if rising_edge(clk) then
            if count_intern = x"f8" then
                count_intern <= x"00";
            else
                count_intern <= count_intern + x"01";
            end if;
        end if;
    end process;
end;
