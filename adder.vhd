library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder is
    port(a : in unsigned(7 downto 0);
         b : in signed(7 downto 0);
         sum : out signed(9 downto 0));
end adder;

architecture rtl of adder is
begin
    sum <= signed("00" & a) + (b(7) & b(7) & b);
end rtl;
