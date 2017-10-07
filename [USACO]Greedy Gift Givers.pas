{
ID:rz109291
PROG:gift1
LANG: PASCAL
}
Program gift1;
var
	np,i,j:longint;
	name,sn,rn:string[17];
	rest:array[0..10000]of longint;
	key:array[1..100]of longint;
	money,num,t:longint;
	ind:array[1..10000]of string[17];
function hash(s:string):longint;
var
	i:longint;
begin
	hash:=0;
	for i:=1 to length(s)do
		hash:=hash+(ord(s[i])-ord('A'))*i;
end;
begin
	assign(input,'gift1.in');assign(output,'gift1.out');reset(input);rewrite(output);
	readln(np);
	for i:=1 to np do
		begin
			readln(name);
                        t:=hash(name);
			key[i]:=t;
			ind[t]:=name;
		end;
	for i:=1 to np do
		begin
			readln(name);
			readln(money,num);
			t:=hash(name);
			if num<>0 then
				rest[t]:=rest[t]-(money div num)*num
			else
				rest[t]:=rest[t]-money;
			for j:=1 to num do
				begin
					readln(rn);
					t:=hash(rn);
					//write('*',rest[t],'*');
					rest[t]:=rest[t]+money div num;
					//writeln(rest[t],'*');
				end;
		end;
	for i:=1 to np do
		writeln(ind[key[i]],' ',rest[key[i]]);
	close(output);
end.
