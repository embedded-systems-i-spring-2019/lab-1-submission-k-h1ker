library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    
entity RTL_REG is
    port (C, CE, D : in std_logic;
            Q      : out std_logic);
end RTL_REG;

architecture dff of RTL_REG is
begin
process(C)
begin
   if C'event and C='1' then
      if CE ='1' then
         Q <= D;
      end if;
   end if;
end process;
end dff;

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    

entity RTL_INV is
    port(inv_in  : in std_logic;
         inv_out : out std_logic);
end RTL_INV;

architecture inverter of RTL_INV is
begin
    inv_out <= not inv_in;
end inverter;

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity divider_top is
    port (clk : in std_logic;
           led0 : out std_logic);
end divider_top;


architecture divider_arch of divider_top is
 component clock_div
    port(clk : in std_logic;
         div : out std_logic);
  end component;
         
 component RTL_INV
    port (inv_in  : in std_logic;
          inv_out : out std_logic);
 end component;         
 component RTL_REG
    port (C, CE, D : in std_logic;
            Q      : out std_logic);
end component;

signal inv_res, led0_out, div_sig : std_logic;

begin
    led_reg : RTL_REG
        port map ( C  => clk,
                   CE => div_sig,
                   D  => inv_res,
                   Q  => led0_out);
    led0_i : RTL_INV
        port map(inv_in  => led0_out,
                 inv_out => inv_res);
                 
                 
    U1 : clock_div
        port map(clk => clk,
                 div => div_sig);
    
    led0 <= led0_out;
end divider_arch;