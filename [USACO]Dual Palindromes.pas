{
ID:rz109291
LANG:PASCAL
PROG:dualpal
}
const
	p:array[0..20]of char=('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K');
var
	i,j,n:longint;
	curn,s:longint;
function ok(i:longint):boolean;
var
	r:string;
	k,t,j:longint;
	b:boolean;
	c:longint;
begin
	c:=0;
	for k:=2 to 10 do
		begin
			r:='';t:=i;
			while t>=1 do
				begin
					r:=p[t mod k]+r;
					t:=t div k;
				end;
			b:=true;
			for j:=1 to length(r)div 2 do
				if r[j]<>r[lengtH(r)-j+1]then begin b:=false;break;end;
			if b then begin inc(c);if c>=2 then exit(true);end;
		end;
	exit(false);
end;
begin
	assign(input,'dualpal.in');reset(input);assign(output,'dualpal.out');rewrite(output);
	readln(n,s);
	while curn<n do
		while true do
			begin
				inc(s);
				if ok(s)then begin inc(curn);writeln(s);if curn>=n then break;end;
			end;
	close(input);close(output);
end.
