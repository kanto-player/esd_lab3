library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sampler is
    port(clk : in std_logic;
         active : in std_logic;
         stream : in signed(15 downto 0);
         sample : out signed(15 downto 0));
end sampler;

architecture rtl of sampler is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if active = '1' then
                sample <= stream;
            else
                sample <= (others => '0');
            end if;
        end if;
    end process;
end rtl;
