library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity synth_top is
    port(en : in std_logic;
         note : in unsigned(9 downto 0);
         mod_depth : in unsigned(3 downto 0);
         volume : in unsigned(3 downto 0);
         clk : in std_logic;
         audio_out : out signed(15 downto 0));
end synth_top;

architecture rtl of synth_top is
    signal note_div : unsigned(11 downto 0);
    signal mod_div : unsigned(11 downto 0);
    signal note_clk : std_logic;
    signal mod_clk : std_logic;
    signal sample_clk : std_logic;
    signal note_count_s1 : unsigned(7 downto 0);
    signal mod_count_s1 : unsigned(7 downto 0);
    signal note_count_s2 : unsigned(7 downto 0);
    signal mod_count_s2 : unsigned(7 downto 0);
    signal note_count_s3 : unsigned(7 downto 0);
    signal mod_level_raw : signed(15 downto 0);
    signal mod_level_shifted : signed(15 downto 0);
    signal mod_level_s1 : signed(7 downto 0);
    signal mod_level_s2 : signed(7 downto 0);
    signal audio_addr_raw : signed(9 downto 0);
    signal audio_addr_s1 : unsigned(7 downto 0);
    signal audio_addr_s2 : unsigned(7 downto 0);
    signal audio_level_raw : signed(15 downto 0);
    signal audio_level_shifted : signed(15 downto 0);
begin
    note_div <= "00" & note;
    -- modulation frequency should be 1/4th of the note frequency
    -- therefore divider must be shifted left by 2
    mod_div <= note & "00";

    NOTE_DIVIDER : entity work.frequency_divider port map (
        clk => clk,
        divider => note_div,
        clk_out => note_clk
    );

    MOD_DIVIDER : entity work.frequency_divider port map (
        clk => clk,
        divider => mod_div,
        clk_out => mod_clk
    );

    SAMPLE_DIVIDER : entity work.frequency_divider port map (
        clk => clk,
        divider => x"300",
        clk_out => sample_clk
    );

    NOTE_COUNTER : entity work.counter port map (
        clk => note_clk,
        count => note_count_s1
    );

    MOD_COUNTER : entity work.counter port map (
        clk => mod_clk,
        count => mod_count_s1
    );

    COUNT_TEMP : entity work.counter_reg port map (
        clk => clk,
        counter1in => note_count_s1,
        counter2in => mod_count_s1,
        counter1out => note_count_s2,
        counter2out => mod_count_s2
    );

    MOD_SHIFT : entity work.rshift port map (
        number => mod_level_raw,
        shiftby => mod_depth,
        shifted => mod_level_shifted
    );

    mod_level_s1 <= mod_level_shifted(15 downto 8);

    MIDDLE_TEMP : entity work.middle_reg port map (
        clk => clk,
        ain => note_count_s2,
        bin => mod_level_s1,
        aout => note_count_s3,
        bout => mod_level_s2
    );

    NOTE_ADD : entity work.adder port map (
        a => note_count_s3,
        b => mod_level_s2,
        sum => audio_addr_raw
    );

    NOTE_WRAP : entity work.wrapper port map (
        unwrapped => audio_addr_raw,
        wrapped => audio_addr_s1
    );

    SUM_TEMP : entity work.sum_reg port map (
        clk => clk,
        addrin => audio_addr_s1,
        addrout => audio_addr_s2
    );

    AUDIOROM : entity work.sinrom port map (
        addr1 => audio_addr_s2,
        addr2 => mod_count_s2,
        value1 => audio_level_raw,
        value2 => mod_level_raw
    );

    VOL_SHIFTER : entity work.rshift port map (
        number => audio_level_raw,
        shiftby => volume,
        shifted => audio_level_shifted
    );

    SAMPLE_TEMP : entity work.sampler port map (
        clk => sample_clk,
        active => en,
        stream => audio_level_shifted,
        sample => audio_out
    );

end rtl;
