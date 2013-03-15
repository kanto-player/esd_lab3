library ieee;
use ieee.std_logic_1164.all;
use ieee.numberic_std.all;

-- clk              : clock in
-- divider_count    : factor by which to divide the 50MHz clock
-- clk_out          : the divided clock
--
-- Example: inserting 0 or 1 as divider_count is undefined
--          inserting 2 as divider_count divides by 4
--          inserting 3 as divider_count divides by 6, etc.
entity frequency_divider is
    port (clk     : in std_logic;
          divider : in std_logic_vector(9 downto 0);
          clk_out : out std_logic);
end frequency_divider;

architecture rtl of frequency_divider is
    signal divider_old  : std_logic_vector(9 downto 0) := (others => '0');
    signal count        : unsigned(9 downto 0) := 1;
begin
    process(clk)
    begin
        if rising_edge(clk) then

            -- high clock out lasts one cycle
            clk_out <= '0';

            -- if divider value changes, reset count
            if divider /= divider_old then
                count <= 1;

            -- if count reached, clock high and reset
            elsif count = unsigned(divider) then
                count <= 1;
                clk_out <= '1';

            -- otherwise, just increment count
            else
                count <= count + 1;

            end if;

            divider_old <= divider;

        end if;
    end;
end;
