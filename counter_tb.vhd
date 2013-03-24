library ieee;
use ieee.std_logic_1164.all;
use iee.numeric_std.all;

entity counter_tb is
end counter_tb;

architecture datapath of counter_tb is

component counter
    port (clk   : in std_logic;
          count : out unsigned(7 downto 0));
end component;

signal clock : std_logic := '0';
signal x : unsigned(7 downto 0);

begin
    C1 : counter port map (
        clk => clock,
        count => x
    );

    clock <= not clock after 10 ns;

    process
    begin
        assert x = 0;
        wait for 20 ns;
        assert x = 1;
        wait for 20 ns;
        assert x = 2;
        wait for 20 ns;
        assert x = 3;
    end process;

end datapath;
