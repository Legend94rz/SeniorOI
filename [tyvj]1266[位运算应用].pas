type
	node=record
		d:longint;
		dep:byte;
		end;
var
	i,j,n,u:longint;
	app:array[0..33554440]of byte;
	s,t:string;
	q:array[0..1000001]of node;
	l,r:longint;
function conver(s:string):longint;
var
	i,t:longint;
begin
	t:=0;
	for i:=1 to length(s) do
		t:=t+(ord(s[i])-48)*1 shl (length(s)-i);
	//writeln(s,'=',t);
	exit(app[t]);
end;
function init:longint;
var
	i,j:longint;
	k,t:node;
begin
	l:=0;r:=1;q[1].d:=1 shl 25-1;q[1].dep:=1;
	repeat
		inc(l);
		if l>=1000000 then l:=1;
		k:=q[l];
		if k.dep>6 then continue;
		for i:=1 to 25 do
			begin
				t:=k;
				t.d:=t.d xor (1 shl (i-1));
				if (i+5<=25) then t.d:=t.d xor (1 shl(i+4));
				if (i+1<=25)and(not(i in[5,10,15,20,25])) then t.d:=t.d xor (1 shl i);
				if (i-1>=1)and(not(i in[1,6,11,16,21]))  then t.d:=t.d xor (1 shl (i-2));
				if (i-5>=1)  then t.d:=t.d xor (1 shl (i-6));
				//writeln(t.d,' ',t.dep);
				if app[t.d]=0 then
					begin
						inc(r);if r>=1000000 then r:=1;
						t.dep:=k.dep+1;
						q[r]:=t;app[t.d]:=t.dep;
					end;
			end;
	until l=r;
	exit(0);
end;
begin
	//assign(output,'test.txt');rewrite(output);
	readln(n);
	init;
	for u:=1 to n do
		begin
			s:='';
			for i:=1 to 5 do
				begin
					readln(t);
					s:=s+t;
				end;
			readln;
			if s<>'1111111111111111111111111' then
				writeln(conver(s)-1)
			else
				writeln(0);
		end;
	//close(output);
end.
