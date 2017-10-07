{
id:rz109291
LANG:PASCAL
PROG:msquare
}
{
USER: r z [rz109291]
TASK: msquare
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 13412 KB]
   Test 2: TEST OK [0.000 secs, 13412 KB]
   Test 3: TEST OK [0.000 secs, 13412 KB]
   Test 4: TEST OK [0.000 secs, 13412 KB]
   Test 5: TEST OK [0.027 secs, 13412 KB]
   Test 6: TEST OK [0.054 secs, 13412 KB]
   Test 7: TEST OK [0.081 secs, 13412 KB]
   Test 8: TEST OK [0.135 secs, 13412 KB]

All tests OK.
Your program ('msquare') produced all correct answers!  This is your
submission #3 for this problem.  Congratulations!
}
const
	rt='12345678';
	fact:array[0..9]of longint=(1,1,2,6,24,120,720,5040,40320,362880);
type
	node=record
		fa,dp:longint;
		da:string;
		fs:char;
	end;
var
	c:char;
	i,j,ha:longint;
	q:array[0..50000]of node;
	l,r:longint;
	b:array[0..50000]of boolean;
	s,k,t:string;
procedure print;
var
	i,j,ta:longint;
	ans:array[0..60]of char;
begin
	//writeln(q[r].dp);
	while q[r].fa<>0 do
		begin
			if q[r].fs in['A'..'C']then
				inc(ta);
			ans[ta]:=q[r].fs;
			r:=q[r].fa;
		end;
        j:=0;
	for i:=1 to ta do
		if ans[i] in['A'..'C']then
			inc(j);
	writeln(j);
	for i:=ta downto 1 do
		if ans[i]in['A'..'C']then
			write(ans[i]);
	writeln;
	close(input);close(output);
	halt;
end;
function change(key:string;ct:char):string;
var
	i,j:longint;
	t:char;
begin
	change:=key;
	if ct='A'then
		begin
			for i:=1 to 8 do
				change[i]:=key[8-i+1];
			exit(change);
		end;
	if ct='B' then
		begin
		//12345678
		//41236785
		change[1]:=key[4];
		change[2]:=key[1];
		change[3]:=key[2];
		change[4]:=key[3];
		change[5]:=key[6];
		change[6]:=key[7];
		change[7]:=key[8];
		change[8]:=key[5];
		exit(change);
		end;
	//12345678
	//17245368
	change[2]:=key[7];
	change[3]:=key[2];
	change[6]:=key[3];
	change[7]:=key[6];
	exit(change);
end;
function hash(key:string):longint;
var
	cnt:longint;
	i,j:longint;
begin
	hash:=0;
	for i:=1 to 7 do
		begin
		cnt:=0;
		for j:=i+1 to 8 do
			if key[j]<key[i] then
				inc(cnt);
		hash:=hash+cnt*fact[8-i];
		end;
	exit(hash);
end;
begin
	assign(input,'msquare.in');reset(input);assign(output,'msquare.out');rewrite(output);
	readln(s);
	while pos(' ',s)<>0 do
		delete(s,pos(' ',s),1);
	l:=0;r:=1;q[1].da:=rt;q[1].fa:=0;
	b[hash(rt)]:=true;
        if s=rt then
                begin
                writeln(0);
                writeln;
                close(input);close(output);halt;
                end;
	repeat
		inc(l);
		k:=q[l].da;
		for c:='A' to 'C' do
			begin
				t:=change(k,c);
				{if k=rt then
					writeln(c,' ',t); }
				ha:=hash(t);
				if not b[ha] then
					begin
						inc(r);
						q[r].da:=t;
						b[ha]:=true;
						q[r].dp:=q[l].dp+1;
						q[r].fa:=l;
						q[r].fs:=c;
					end;
				if t=s then print;
			end;
	until l>=r;
end.
