library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    
    
entity counter_top is
    port (btn, sw : in std_logic_vector(3 downto 0);
          clk     : in std_logic;
          led     : out std_logic_vector(3 downto 0));
end counter_top;

architecture counter_arch of counter_top is
    signal dbnc1, dbnc2, dbnc3, dbnc4, div_sig : std_logic;
    component debouncer
     port ( btn, clk : in std_logic;
           dbnc     : out std_logic);
    end component;
    
    component fancy_counter 
        port ( clk, clk_en, dir, en, ld, rst, updn : in std_logic;
                    val     : in std_logic_vector(3 downto 0);
                    cnt     : out std_logic_vector(3 downto 0));
    end component;
    
    component clock_div
    port(
        clk  : in std_logic;      
        div : out std_logic);
    end component;
    
begin
    u1 : debouncer
        port map (btn => btn(0),
                  clk => clk,
                  dbnc => dbnc1);
    
    u2 : debouncer
        port map (btn => btn(1),
                  clk => clk,
                  dbnc => dbnc2); 
                  
     u3 : debouncer
        port map (btn => btn(2),
                  clk => clk,
                  dbnc => dbnc3);
       
      u4 : debouncer
        port map (btn => btn(3),
                  clk => clk,
                  dbnc => dbnc4);
      
      u5 : clock_div
        port map( clk=> clk,
                  div=>div_sig);
      
      u6: fancy_counter
        port map (clk    => clk,
                  clk_en => div_sig,
                  dir    => sw(0),
                  en     => dbnc2,
                  ld     => dbnc4,
                  rst    => dbnc1,
                  updn   => dbnc3,
                  val    => sw,
                  cnt    => led);
    
end counter_arch;
                                                   