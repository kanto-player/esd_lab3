library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rshift is
    port (number : in signed(15 downto 0);
          shiftby : in std_logic_vector(3 downto 0);
          shifted : out signed(15 downto 0));
end rshift;

architecture rtl of rshift is
    type rss_type is array(0 to 15) of signed(15 downto 0);
    signal rss : rss_type;
    signal copy_bit : std_logic;
begin
    copy_bit <= number(15);
    GEN_MUX : for i in 0 to 15 generate
        rss(i) <= (i downto 0 => copy_bit) & number((15 - i) downto 0);
        SEL_MUX : entity work.multiplexer port map (
                        input => rss(i),
                        sel => unsigned(shiftby),
                        output => shifted(i));
    end generate GEN_MUX;
end rtl;
