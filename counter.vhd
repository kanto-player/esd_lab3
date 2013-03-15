library ieee;
use ieee.std_logic_1164.all;
use ieee.numberic_std.all;

entity counter is
    port (
        clk     : in std_logic;
        count   : out unsigned(9 downto 0);
    );
end counter;

architecture rtl of counter is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            count <= count + 1;
        end if;
    end;
end;
