const p=100000000;
type
	node=record
		d:array[0..501]of int64;
		l:longint;
		end;
var
	i,j,n,m,k,t:longint;
	b:array[0..2001]of boolean;
	a:array[0..2001]of longint;
	f:array[0..1501]of node;
	tmp:node;
	ts:string;
operator *(a:node;b:longint)ans:node;
var
	i:longint;
begin
	fillchar(ans,sizeof(ans),0);ans.l:=a.l+4;
	for i:=1 to ans.l do
		begin
			ans.d[i]:=ans.d[i]+a.d[i]*b;
			inc(ans.d[i+1],ans.d[i] div p);
			ans.d[i]:=ans.d[i] mod p;
		end;
	while (ans.d[ans.l]=0)and(ans.l>1) do dec(ans.l);
end;
operator <(a,b:node)ans:boolean;
var
	i:longint;
begin
	if a.l<b.l then exit(true);
	if a.l>b.l then exit(false);
	for i:=a.l downto 1 do
		if a.d[i]<b.d[i] then
			exit(true)
		else
			if a.d[i]>b.d[i] then
				exit(false);
	exit(false);
end;
function pow(a,b:longint):longint;
var
	i:longint;
begin
	pow:=1;
	for i:=1 to b do pow:=pow*a;
end;
begin
	//assign(input,'.in');reset(input);assign(output,'.out');rewrite(output);
	readln(n);fillchar(b,sizeof(b),1);b[1]:=false;
	if n=0 then begin writeln(0);close(output);exit;end;
	j:=2;
	for i:=2 to n do
		begin
			j:=i;
			if b[i] then while j<=n do begin inc(j,i);b[j]:=false;end;
		end;
	for i:=2 to n do
		if b[i] then
			a[i]:=trunc(ln(n)/ln(i));
	f[0].d[1]:=1;f[0].l:=1;
	for k:=2 to n do
		if b[k] then
			begin
			for j:=n downto 0 do
				for i:=0 to a[k] do
					begin
						t:=pow(k,i);
						if j>=t then
							begin
								tmp:=f[j-t]*t;
								if f[j]<tmp then f[j]:=tmp;
							end;
					end;
			end;
	for i:=f[n].l downto 1 do
		begin
			str(f[n].d[i],ts);
			if i<>f[n].l then while length(ts)<8 do ts:='0'+ts;
			write(ts);
		end;
    writeln;close(output);
end.

