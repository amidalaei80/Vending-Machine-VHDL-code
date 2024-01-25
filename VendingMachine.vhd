library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VendingMachine is
port(
a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2: out std_logic; --Two 7-segments for state number.
a3, b3, c3, d3, e3, f3, g3: out std_logic; -- One 7-segment for product number selection.
clk, rst: in std_logic; -- Clock and Reset.
sel: in std_logic_vector(1 downto 0); -- Product selector. Product 1 is 10 cents, product 2 is 15 cents, product 3 is 20 cents and product 4 is 25 cents.
nickel_in, dime_in, quarter_in: in boolean; --Nickel is 5 cents, dime is 10 cents, quarter is 25 cents.
candy1_out, candy2_out, candy3_out, candy4_out, nickel_out, dime_out: out std_logic -- candy out and money out.
	  );
end VendingMachine;

architecture Behavioral of VendingMachine is
	type state is (st0, st5, st10, st15, st20, st25, st30, st35, st40, st45);
	signal pr_state, nx_state: state;

begin

	process (rst, clk)
	begin
		if (rst = '1') then
			pr_state <= st0;
		elsif (clk'event AND clk = '1') then
			pr_state <= nx_state;
		end if;
	end process;
	
	process (sel, pr_state, nickel_in, dime_in, quarter_in)
	begin
		case pr_state is
			when st0 =>
---------------------7SEG AVAl-------------------------
							a1 <= '1';
							b1 <= '1';
							c1 <= '1';
							d1 <= '1';
							e1 <= '1';
							f1 <= '1';
							g1 <= '0';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '1';
							c2 <= '1';
							d2 <= '1';
							e2 <= '1';
							f2 <= '1';
							g2 <= '0';
--------------------Candy Out---------------------------
				 candy1_out <= '0';
				 candy2_out <= '0';
				 candy3_out <= '0';
				 candy4_out <= '0';
--------------------Money Out---------------------------
				 nickel_out <= '0';
				   dime_out <= '0';
				if (nickel_in) then
					nx_state <= st5;
				elsif (dime_in) then
					nx_state <= st10;
				elsif (quarter_in) then
					nx_state <= st25;
				else
					nx_state <= st0;
				end if;
					
			when st5 =>
---------------------7SEG AVAl-------------------------
						  a1 <= '1';
						  b1 <= '1';
						  c1 <= '1';
						  d1 <= '1';
						  e1 <= '1';
						  f1 <= '1';
						  g1 <= '0';
---------------------7SEG DOVOM-------------------------
						  a2 <= '1';
						  b2 <= '0';
						  c2 <= '1';
						  d2 <= '1';
						  e2 <= '0';
						  f2 <= '1';
						  g2 <= '1';
--------------------------------------------------------
--------------------Candy Out---------------------------
				candy1_out <= '0';
				candy2_out <= '0';
				candy3_out <= '0';
				candy4_out <= '0';
--------------------Money Out---------------------------
				nickel_out <= '0';
				  dime_out <= '0';
				if (nickel_in) then
					nx_state <= st10;
				elsif (dime_in) then
					nx_state <= st15;
				elsif (quarter_in) then
					nx_state <= st30;
				else
					nx_state <= st5;
				end if;
					
			when st10 =>
---------------------7SEG AVAl-------------------------
							a1 <= '0';
							b1 <= '1';
							c1 <= '1';
							d1 <= '0';
							e1 <= '0';
							f1 <= '0';
							g1 <= '0';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '1';
							c2 <= '1';
							d2 <= '1';
							e2 <= '1';
							f2 <= '1';
							g2 <= '0';
				if (sel = "00") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '0';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '1';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '0';
					  nx_state <= st0;
				else
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '0';
					if (nickel_in) then
						nx_state <= st15;
					elsif (dime_in) then
						nx_state <= st20;
					elsif (quarter_in) then
						nx_state <= st35;
					else
						nx_state <= st10;
					end if;
				end if;
				
			when st15 =>
---------------------7SEG AVAl-------------------------
							a1 <= '0';
							b1 <= '1';
							c1 <= '1';
							d1 <= '0';
							e1 <= '0';
							f1 <= '0';
							g1 <= '0';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '0';
							c2 <= '1';
							d2 <= '1';
							e2 <= '0';
							f2 <= '1';
							g2 <= '1';
				if (sel = "00") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '0';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '1';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '0';
					  nx_state <= st0;
				elsif (sel = "01") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '0';
							  d3 <= '1';
							  e3 <= '1';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '1';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '0';
					  nx_state <= st0;
				else
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '0';
					  nx_state <= st0;
					if (nickel_in) then
						nx_state <= st20;
					elsif (dime_in) then
						nx_state <= st25;
					elsif (quarter_in) then
						nx_state <= st40;
					else
						nx_state <= st15;
					end if;
				end if;
				
			when st20 =>
---------------------7SEG AVAl-------------------------
							a1 <= '1';
							b1 <= '1';
							c1 <= '0';
							d1 <= '1';
							e1 <= '1';
							f1 <= '0';
							g1 <= '1';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '1';
							c2 <= '1';
							d2 <= '1';
							e2 <= '1';
							f2 <= '1';
							g2 <= '0';
				if (sel = "00") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '0';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '1';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '1';
					  nx_state <= st0;
				elsif (sel = "01") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '0';
							  d3 <= '1';
							  e3 <= '1';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '1';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '0';
					  nx_state <= st0;
				elsif (sel = "10") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '1';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '1';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '0';
					  nx_state <= st0;
				else
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '0';
					  nx_state <= st0;
					if (nickel_in) then
						nx_state <= st25;
					elsif (dime_in) then
						nx_state <= st30;
					elsif (quarter_in) then
						nx_state <= st45;
					else
						nx_state <= st20;
					end if;
				end if;
			when st25 =>
---------------------7SEG AVAl-------------------------
							a1 <= '1';
							b1 <= '1';
							c1 <= '0';
							d1 <= '1';
							e1 <= '1';
							f1 <= '0';
							g1 <= '1';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '0';
							c2 <= '1';
							d2 <= '1';
							e2 <= '0';
							f2 <= '1';
							g2 <= '1';
				if (sel = "00") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '0';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '1';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st0;
				elsif (sel = "01") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '0';
							  d3 <= '1';
							  e3 <= '1';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '1';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '1';
					  nx_state <= st0;
				elsif (sel = "10") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '1';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '1';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '0';
					  nx_state <= st0;
				elsif (sel = "11") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '1';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '1';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '0';
					  nx_state <= st0;
				end if;
				
			when st30 =>
---------------------7SEG AVAl-------------------------
							a1 <= '1';
							b1 <= '1';
							c1 <= '1';
							d1 <= '1';
							e1 <= '0';
							f1 <= '0';
							g1 <= '1';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '1';
							c2 <= '1';
							d2 <= '1';
							e2 <= '1';
							f2 <= '1';
							g2 <= '0';
				if (sel = "00") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '0';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st15;
				elsif (sel = "01") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '0';
							  d3 <= '1';
							  e3 <= '1';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '1';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st0;
				elsif (sel = "10") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '1';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '1';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '1';
					  nx_state <= st0;
				elsif (sel = "11") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '1';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '1';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '0';
					  nx_state <= st0;
				end if;
				
			when st35 =>
---------------------7SEG AVAl-------------------------
							a1 <= '1';
							b1 <= '1';
							c1 <= '1';
							d1 <= '1';
							e1 <= '0';
							f1 <= '0';
							g1 <= '1';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '0';
							c2 <= '1';
							d2 <= '1';
							e2 <= '0';
							f2 <= '1';
							g2 <= '1';
				if (sel = "00") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '0';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st20;
				elsif (sel = "01") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '0';
							  d3 <= '1';
							  e3 <= '1';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st20;
				elsif (sel = "10") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '1';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '1';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st0;
				elsif (sel = "11") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '1';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '1';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '1';
					  nx_state <= st0;
				end if;
				
			when st40 =>
---------------------7SEG AVAl-------------------------
							a1 <= '0';
							b1 <= '1';
							c1 <= '1';
							d1 <= '0';
							e1 <= '0';
							f1 <= '1';
							g1 <= '1';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '1';
							c2 <= '1';
							d2 <= '1';
							e2 <= '1';
							f2 <= '1';
							g2 <= '0';
				if (sel = "00") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '0';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st25;
				elsif (sel = "01") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '0';
							  d3 <= '1';
							  e3 <= '1';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '0';
					  dime_out <= '1';
					  nx_state <= st25;
				elsif (sel = "10") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '1';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st25;
				elsif (sel = "11") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '1';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '1';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st0;
				end if;
			when st45 =>
---------------------7SEG AVAl-------------------------
							a1 <= '0';
							b1 <= '1';
							c1 <= '1';
							d1 <= '0';
							e1 <= '0';
							f1 <= '1';
							g1 <= '1';
---------------------7SEG DOVOM-------------------------
							a2 <= '1';
							b2 <= '0';
							c2 <= '1';
							d2 <= '1';
							e2 <= '0';
							f2 <= '1';
							g2 <= '1';
				if (sel = "00") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '0';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st30;
				elsif (sel = "01") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '0';
							  d3 <= '1';
							  e3 <= '1';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st30;
				elsif (sel = "10") then
-----------------------7SEG------------------------------
							  a3 <= '1';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '1';
							  e3 <= '0';
							  f3 <= '0';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st30;
				elsif (sel = "11") then
-----------------------7SEG------------------------------
							  a3 <= '0';
							  b3 <= '1';
							  c3 <= '1';
							  d3 <= '0';
							  e3 <= '0';
							  f3 <= '1';
							  g3 <= '1';
---------------------------------------------------------
--------------------Candy Out----------------------------
					candy1_out <= '0';
					candy2_out <= '0';
					candy3_out <= '0';
					candy4_out <= '0';
--------------------Money Out----------------------------
					nickel_out <= '1';
					  dime_out <= '1';
					  nx_state <= st30;
				end if;
		end case;
	end process;
						 
end Behavioral;
