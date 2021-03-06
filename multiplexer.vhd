library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplexer is
    port (input : in signed(15 downto 0);
          sel : in unsigned(3 downto 0);
          output : out std_logic);
end multiplexer;

architecture rtl of multiplexer is
begin
    output <= input(to_integer(sel));
end rtl;
