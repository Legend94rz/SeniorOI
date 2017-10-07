{
ID:rz109291
LANG:PASCAL
PROG:clocks
}
const
	data:array[1..9,0..5]of byte=((4,1,2,4,5,0),
						(3,1,2,3,0,0),
						(4,2,3,5,6,0),
						(3,1,4,7,0,0),
						(5,2,4,5,6,8),
						(3,3,6,9,0,0),
						(4,4,5,7,8,0),
						(3,7,8,9,0,0),
						(4,5,6,8,9,0));
var
	a,b:array[0..10]of longint;
	x,i:longint;
	ans:string;
procedure outit;
var
	i,j:Longint;
begin
	for i:=1 to 9 do
		if a[i] mod 4 <>0 then exit;
	ans:='';
	for i:=1 to 9 do
		for j:=1 to b[i] do
			ans:=ans+chr(48+i)+' ';
	delete(ans,length(ans),1);
		writeln(ans);
	close(input);close(output);
	halt;
end;
procedure dfs(i:longint);
var
	j,k:longint;
begin
	if i=10 then begin outit;exit;end;
	for j:=0 to 3 do
		begin
			b[i]:=j;
			for k:=1 to data[i,0] do
				inc(a[data[i,k]],j);
			dfs(i+1);
			for k:=1 to data[i,0] do
				dec(a[data[i,k]],j);
		end;
end;
begin
        assign(input,'clocks.in');reset(input);assign(output,'clocks.out');rewrite(output);
        for i:=1 to 9 do
		begin
		read(x);
		a[i]:=x div 3;
		end;
	dfs(1);
end.
