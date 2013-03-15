library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity wrapper is
    port(unwrapped : in signed(9 downto 0);
         wrapped : out unsigned(7 downto 0));
end wrapper;

architecture rtl of wrapper is
    signal wraparound : signed(9 downto 0) := ("00" & x"f9");
    signal wrapped_large : signed(9 downto 0);
begin
    wrapped_large <= unwrapped - wraparound when unwrapped >= wraparound else
                     unwrapped + wraparound when unwrapped(9) = '1' else
                     unwrapped;
    wrapped <= unsigned(wrapped_large(7 downto 0));
end rtl;