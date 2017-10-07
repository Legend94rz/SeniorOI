{
ID:rz109291
PROG:crypt1
LANG:PASCAL
}
var
	a:array[0..20]of longint;
	b:array[1..5]of longint;
	i,j,n,ans:longint;
procedure cal;
var
	i,j,e,r,t:longint;
	f:array[1..3]of longint;
	bol:boolean;
begin
	e:=b[1];
	for i:=2 to 3 do
		e:=e*10+b[i];
	f[1]:=e*b[4];f[2]:=e*b[5];
	//writeln(e,' ',b[4],' ',b[5],' ',f[1],' ',f[2]);
	f[3]:=f[1]*10+f[2];
	for i:=1 to 3 do
		begin
			t:=f[i];
			while t>=1 do
				begin
					r:=t mod 10;bol:=false;
					for j:=1 to n do
						if a[j]=r then begin bol:=true;break;end;
					if not bol then exit;
					t:=t div 10;
				end;
		end;
	if ((f[1]*10+f[2])div 1000<10)and(f[1] div 100<10)and(f[2] div 100<10) then
		begin
			//writeln(e,' ',b[4],' ',b[5],' ',f[1],' ',f[2]);
			inc(ans);
		end;
end;
procedure dfs(i:longint);
var
	k:longint;
begin
	if i>5 then exit;
	for k:=1 to n do
		begin
			b[i]:=a[k];
			if i=5 then cal;
			dfs(i+1);
		end;
end;
begin
	assign(input,'crypt1.in');reset(input);assign(output,'crypt1.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		read(a[i]);
	dfs(1);
	writeln(ans);
	close(output);close(input);
end.
