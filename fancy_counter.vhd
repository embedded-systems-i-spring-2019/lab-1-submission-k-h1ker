library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    
entity fancy_counter is
    port ( clk, clk_en, dir, en, ld, rst, updn : in std_logic;
                    val     : in std_logic_vector(3 downto 0);
                    cnt     : out std_logic_vector(3 downto 0));
end fancy_counter;

architecture fancy_behavior of fancy_counter is
signal direction : std_logic;
signal value     : std_logic_vector(3 downto 0);
signal count     : std_logic_vector(3 downto 0);
begin
    process (clk)
    
        begin
            
                if clk='1'and clk'event then
                    if en = '1' then
                      if rst = '1' then 
                        cnt <= (others => '0');
                        value <= "0000";
                        count <= "0000";
                      elsif clk_en = '1' then
                      if updn ='1' then
                         direction <= dir;
                      end if;
                      if ld = '1' then
                         value <= val;
                      end if;
                      
                      if direction = '1' then
                        count <= std_logic_vector(unsigned(count) + 1);
                        if (count = value) then
                            count <= "0000";                            
                        end if;
                        
                      elsif direction = '0' then
                        count <= std_logic_vector(unsigned(count) - 1);
                        if count = "0000" then
                            count <= value;
                        end if;
                      end if;
                      cnt <= std_logic_vector(count);
                end if;
            end if;
          end if;
        end process;
 end fancy_behavior;                                    