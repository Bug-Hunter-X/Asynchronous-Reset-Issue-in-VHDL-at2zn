library ieee;
use ieee.std_logic_1164.all;

entity fixed_code is
    port (
        clk : in std_logic;
        rst : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );
end entity fixed_code;

architecture behavioral of fixed_code is
    signal sync_rst : std_logic := '0';
    signal internal_data : std_logic_vector(7 downto 0) := "00000000";
begin
    process (clk) 
    begin
        if rising_edge(clk) then
            if rst = '1' then
                sync_rst <= '1';
            else
                sync_rst <= '0';
            end if;
        end if;
    end process;

    process (clk, sync_rst)
    begin
        if sync_rst = '1' then
            internal_data <= "00000000";
        elsif rising_edge(clk) then
            internal_data <= data_in;
            data_out <= internal_data;
        end if;
    end process;
end architecture behavioral;