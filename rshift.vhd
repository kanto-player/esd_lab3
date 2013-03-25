library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rshift is
    port (number : in signed(15 downto 0);
          shiftby : in unsigned(3 downto 0);
          shifted : out signed(15 downto 0));
end rshift;

architecture rtl of rshift is
    type rss_type is array(0 to 15) of signed(15 downto 0);
    signal rss : rss_type;
    signal copy_bit : std_logic;
begin
    copy_bit <= number(15);
    rss(0) <= number;
    SEL_MUX0 : entity work.multiplexer port map (
        input => rss(0),
        sel => shiftby,
        output => shifted(0)
    );
    GEN_MUX : for i in 1 to 15 generate
        rss(i) <= ((i-1) downto 0 => copy_bit) & number(15 downto i);
        SEL_MUX : entity work.multiplexer port map (
                        input => rss(i),
                        sel => shiftby,
                        output => shifted(i));
    end generate GEN_MUX;
end rtl;
