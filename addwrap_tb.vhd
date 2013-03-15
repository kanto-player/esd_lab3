library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addwrap_tb is
end addwrap_tb;

architecture sim of addwrap_tb is
    signal a : unsigned(7 downto 0);
    signal b : signed(7 downto 0);
    signal sum : signed(9 downto 0);
    signal wrapped : unsigned(7 downto 0);
    
    component adder is
        port(a : in unsigned(7 downto 0);
             b : in signed(7 downto 0);
             sum : out signed(9 downto 0));
    end component;

    component wrapper is
        port(unwrapped : in signed(9 downto 0);
             wrapped : out unsigned(7 downto 0));
    end component;
begin
    ADD : adder port map (
        a => a,
        b => b,
        sum => sum
    );

    WRAP : wrapper port map (
        unwrapped => sum,
        wrapped => wrapped
    );

    process
    begin
        a <= x"e9";
        b <= x"18";
        wait for 5 ns;
        assert wrapped = x"8";
        wait for 5 ns;

        a <= x"7b";
        b <= x"7d";
        wait for 5 ns;
        assert wrapped = x"f8";
        wait for 5 ns;

        a <= x"0f";
        b <= x"e8";
        wait for 5 ns;
        assert wrapped = x"f0";
        wait for 5 ns;
        
        wait;
    end process;
end sim;
