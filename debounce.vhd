library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity debouncer is
    port ( btn, clk : in std_logic;
           dbnc     : out std_logic);
end debouncer;
architecture debounce of debouncer is
signal count : std_logic_vector(24 downto 0);
signal shift_reg : std_logic_vector(1 downto 0);
begin

process (clk)

begin
   if clk='1' and clk'event then
    shift_reg(0) <= btn;
    shift_reg(1) <= shift_reg(0);
    if shift_reg(1) = '1' then
        count <= std_logic_vector(unsigned(count) +1);
        if unsigned(count) < 2500000 then
            dbnc <= '0';
        else 
            dbnc <= '1';
        end if;
    else
        count<=(others =>'0');
        dbnc <='0';
     -- if btn= not '1' then
       --  count := 0;          --old code
     -- elsif btn='1' then
       --  count := count + 1;
      end if;
  -- end if;
   
    
    end if;
    --end if;
end process;
end debounce;