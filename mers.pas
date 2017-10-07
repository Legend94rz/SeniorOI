{const
	mm:array[}
var
	i,j,n,m:longint;
	s:ansistring;
	mm:array['A'..'^']of string=(('.-'),('-...'),('-.-.'),('-..'),('.'),
								 ('..-.'),('--.'),('....'),('..'),('.---'),
								 ('-.-'),('.-..'),('--'),('-.'),('---'),
								 ('.--.'),('--.-'),('.-.'),('...'),('-'),
								 ('..-'),('...-'),('.--'),('-..-'),('-.--'),
								 ('--..'),('..--'),('---.'),('.-.-'),('----'));
	ch:char;
	ans,t,ym,sz:ansistring;
begin
	assign(input,'mers.in');reset(input);assign(output,'mers.out');rewrite(output);
	//[:_
	//\:.
	//]:,
	//^:?
	{for i:=1 to 4 do
		writeln(chr(rd(z)+i));}
	readln(s);t:='';
	for i:=1 to length(s) do
			case s[i] of
				'_':s[i]:='[';
				'.':s[i]:='\';
				',':s[i]:=']';
				'?':s[i]:='^';
				end;
	for i:=1 to length(s) do
		begin
			t:=t+chr(length(mm[s[i]])+48);
			ym:=ym+mm[s[i]];
		end;
	//writeln(ym,t);
	sz:=t;
	for i:=1 to length(t)do
		sz[lengtH(t)-i+1]:=t[i];
	//writeln(sz);
	ans:='';
	for i:=1 to length(sz) do
		begin
			t:=copy(ym,1,ord(sz[i])-48);
			for ch:='A' to '^' do
				if mm[ch]=t then
					begin
						ans:=ans+ch;
						delete(ym,1,ord(sz[i])-48);
						break;
					end;
		end;
	for i:=1 to length(ans) do
		case ans[i] of
			'[':ans[i]:='_';
			'\':ans[i]:='.';
			']':ans[i]:=',';
			'^':ans[i]:='?';
			end;
	writeln(ans);
	close(output);
end.

