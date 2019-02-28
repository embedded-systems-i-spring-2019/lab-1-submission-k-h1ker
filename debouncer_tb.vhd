Library IEEE;
use IEEE.std_logic_1164.all,IEEE.numeric_std.all;

entity debouncer_tb is
end debouncer_tb;


architecture tst of debouncer_tb is
Component debouncer
port(clk :in std_logic;
    btn :in std_logic;
    dbnc :out std_logic);
end Component;

signal clk_t : std_logic := '0';
signal btn_t : std_logic;
signal dbnc_t : std_logic;

constant clk_period : time := 10 ns;

begin
uut: debouncer
 port map (clk => clk_t,
           btn => btn_t,
           dbnc => dbnc_t);
           
    clk_p :process
    begin
    clk_t <= '0';
        wait for clk_period/2;
        clk_t <= '1';
        wait for clk_period/2;


end process;


stim_p: process
begin
    wait for 100ns;
    btn_t<='1';
    --wait for 200ns;
    --btn_t<='0';
    --wait;
     
    end process;
end;
 
