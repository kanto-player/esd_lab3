library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sinrom is
    port(addr1  : in unsigned(7 downto 0);
         addr2  : in unsigned(7 downto 0);
         value1 : out signed(15 downto 0);
         value2 : out signed(15 downto 0));
end sinrom;

architecture rtl of sinrom is
    type rom_type is array(0 to 248) of signed(15 downto 0);
    signal ROM : rom_type := (x"0000", x"033b", x"0676", x"09b0", x"0ce8", x"101e", x"1351", x"1681", x"19ae", x"1cd6", x"1ffa", x"2318", x"2631", x"2944", x"2c4f", x"2f54", x"3251", x"3545", x"3831", x"3b14", x"3ded", x"40bc", x"4380", x"463a", x"48e7", x"4b89", x"4e1f", x"50a8", x"5324", x"5592", x"57f2", x"5a44", x"5c87", x"5ebc", x"60e0", x"62f5", x"64fa", x"66ee", x"68d1", x"6aa3", x"6c64", x"6e13", x"6fb1", x"713c", x"72b4", x"741a", x"756d", x"76ac", x"77d9", x"78f2", x"79f7", x"7ae8", x"7bc5", x"7c8e", x"7d42", x"7de2", x"7e6e", x"7ee5", x"7f47", x"7f94", x"7fcd", x"7ff1", x"8000", x"7ffa", x"7fdf", x"7faf", x"7f6a", x"7f11", x"7ea3", x"7e20", x"7d89", x"7cdd", x"7c1c", x"7b48", x"7a5f", x"7963", x"7852", x"772e", x"75f7", x"74ac", x"734e", x"71de", x"705b", x"6ec5", x"6d1e", x"6b64", x"6999", x"67bd", x"65d0", x"63d2", x"61c4", x"5fa6", x"5d79", x"5b3c", x"58f0", x"5696", x"542e", x"51b8", x"4f34", x"4ca4", x"4a07", x"475e", x"44aa", x"41ea", x"3f1f", x"3c4b", x"396c", x"3684", x"3393", x"309a", x"2d98", x"2a90", x"2780", x"246a", x"214e", x"1e2c", x"1b06", x"17db", x"14ac", x"117a", x"0e45", x"0b0e", x"07d5", x"049b", x"015f", x"fe24", x"fae9", x"f7af", x"f476", x"f13f", x"ee0a", x"ead9", x"e7ab", x"e480", x"e15b", x"de3a", x"db1f", x"d80a", x"d4fb", x"d1f3", x"cef3", x"cbfb", x"c90c", x"c625", x"c348", x"c074", x"bdab", x"baed", x"b83a", x"b593", x"b2f8", x"b06a", x"ade9", x"ab74", x"a90e", x"a6b6", x"a46d", x"a232", x"a007", x"9deb", x"9be0", x"99e5", x"97fa", x"9621", x"9458", x"92a2", x"90fd", x"8f6a", x"8dea", x"8c7c", x"8b21", x"89d9", x"88a4", x"8783", x"8676", x"857c", x"8497", x"83c5", x"8308", x"825f", x"81cb", x"814b", x"80e0", x"808a", x"8049", x"801c", x"8004", x"8001", x"8013", x"803a", x"8076", x"80c7", x"812c", x"81a6", x"8235", x"82d8", x"838f", x"845b", x"853b", x"862f", x"8737", x"8853", x"8982", x"8ac5", x"8c1b", x"8d83", x"8eff", x"908c", x"922c", x"93de", x"95a2", x"9777", x"995c", x"9b53", x"9d5a", x"9f71", x"a198", x"a3cf", x"a614", x"a868", x"aacb", x"ad3b", x"afb9", x"b244", x"b4db", x"b77f", x"ba2f", x"bcea", x"bfb0", x"c280", x"c55b", x"c83f", x"cb2c", x"ce22", x"d120", x"d426", x"d732", x"da46", x"dd5f", x"e07f", x"e3a3", x"e6cc", x"e9f9", x"ed2a", x"f05e", x"f394", x"f6cc", x"fa06", x"fd41");
begin
    value1 <= ROM(to_integer(addr1)) when addr1 < 249 else (others => '0');
    value2 <= ROM(to_integer(addr2)) when addr2 < 249 else (others => '0');
end rtl;
