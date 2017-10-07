{
ID:rz109291
PROG:beads
LANG:PASCAL
}
program beads;
var
	ch:array[-700..700]of char;
	i,j,k,n,max:longint;
	l,r,p,ll,rr:longint;
	c1,c2:char;
begin
	assign(input,'beads.in');assign(output,'beads.out');reset(input);rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			read(ch[i]);
			ch[i+n]:=ch[i];
			ch[i-n]:=ch[i];
		end;
	for i:=1 to n do
		begin
			j:=i;
			while ch[j]='w' do dec(j);
			c1:=ch[j];
			j:=i+1;
			while ch[j]='w' do inc(j);
			c2:=ch[j];
			j:=i-1;
			while (ch[j]=c1)or (ch[j]='w')do
				dec(j);
			l:=i-j;
			j:=i+2;
			while (ch[j]=c2)or (ch[j]='w')do
				inc(j);
			r:=j-i-1;
			if l+r>max then max:=l+r;
		end;
	if max>n then max:=n;
	writeln(max);
	close(input);close(output);
end.
