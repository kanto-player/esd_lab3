library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sum_reg is
    port(clk : in std_logic;
         addrin : in unsigned(7 downto 0);
         addrout : out unsigned(7 downto 0));
end sum_reg;

architecture rtl of sum_reg is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            addrout <= addrin;
        end if;
    end process;
end rtl;