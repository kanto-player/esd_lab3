library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rshift_tb is
end rshift_tb;

architecture sim of rshift_tb is
    signal number : signed(15 downto 0);
    signal shiftby : std_logic_vector(3 downto 0);
    signal shifted : signed(15 downto 0);
    component rshift
        port (number : in signed(15 downto 0);
              shiftby : in std_logic_vector(3 downto 0);
              shifted : out signed(15 downto 0));
    end component;
begin
    RS : rshift port map (
        number => number,
        shiftby => shiftby,
        shifted => shifted
    );
    process
    begin
        number <= x"fffc";
        shiftby <= x"2";
        wait for 5 ns;
        assert shifted = x"ffff";
        number <= x"000f";
        shiftby <= x"3";
        wait for 5 ns;
        assert shifted = x"0007";
        number <= x"001b";
        shiftby <= x"0";
        wait for 5 ns;
        assert shifted = x"001b";
        wait;
    end process;
end sim;
