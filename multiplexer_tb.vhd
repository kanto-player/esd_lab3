library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplexer_tb is
end multiplexer_tb;

architecture sim of multiplexer_tb is
    signal input : signed(15 downto 0);
    signal sel : std_logic_vector(3 downto 0);
    signal output: std_logic;
    component multiplexer
        port (input : in signed(15 downto 0);
              sel : in std_logic_vector(3 downto 0);
              output : out std_logic);
    end component;
begin
    MUX : multiplexer port map (
        input => input,
        sel => sel,
        output => output
    );
    process
    begin
        input <= "0000000000100000";
        sel <= x"5";
        wait for 5 ns;
        assert output = '1';
        wait;
    end process;
end sim;
