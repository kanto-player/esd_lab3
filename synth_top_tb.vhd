library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity synth_top_tb is
end synth_top_tb;

architecture sim of synth_top_tb is
    component synth_top is
        port(en : in std_logic;
             note : in unsigned(9 downto 0);
             mod_depth : in unsigned(3 downto 0);
             volume : in unsigned(3 downto 0);
             clk : in std_logic;
             audio_out : out signed(15 downto 0));
	end component;
    
    signal note : unsigned(9 downto 0);
    signal mod_depth : unsigned(3 downto 0);
    signal volume : unsigned(3 downto 0);
    signal clk : std_logic := '0';
    signal audio_out : signed(15 downto 0);
begin
    clk <= not clk after 10 ns;
    
    STOP : synth_top port map (
        en => '1',
        note => note,
        mod_depth => mod_depth,
        volume => volume,
        clk => clk,
        audio_out => audio_out
    );
    
    process
    begin
        note <= "11" & x"00";
        mod_depth <= x"4";
        volume <= x"1";
        wait;
    end process;
end sim;