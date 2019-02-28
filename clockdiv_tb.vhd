library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity clkdiv_tb is
end clkdiv_tb;

architecture testbench of clkdiv_tb is

    signal tb_clk : std_logic := '0';
   
    signal tb_led0 : std_logic;
    
    component clock_div is
        port(
        
            clk  : in std_logic; 
            div : out std_logic        
        
        );
    end component;

begin


    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
    
 
    dut : clock_div
    port map (
    
        clk  => tb_clk,
     ,
        div => tb_led0
    
    );

    
end testbench; 