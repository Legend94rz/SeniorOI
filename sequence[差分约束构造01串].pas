var
	i,j,N,A0,B0,L0,A1,B1,L1:longint;
	tot:longint;
	c,ed,e,next,head:array[0..1000001]of longint;
	s:array[0..10001]of longint;
	q:array[0..20001]of longint;
	V:array[0..2001]of boolean;
procedure add(x,y,z:longint);
begin
	inc(tot);
	//writeln('add ',x,'->',y,' ',z);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
end;
function spfa:boolean;
var
	l,r:longint;
	k,b,ege:longint;
begin
	l:=0;r:=1;q[r]:=0;
	fillchar(s,sizeof(s),$3f);s[0]:=0;
	fillchar(v,sizeof(v),0);v[0]:=true;c[0]:=1;
	repeat
		inc(l);if l>=20000 then l:=1;
		k:=q[l];v[k]:=false;
		ege:=head[k];//write('#',k);
		while ege<>0 do
			begin
				b:=ed[ege];//write('->',b,'(',e[ege],')');
				if s[k]+e[ege]<s[b] then
					begin
						s[b]:=s[k]+e[ege];
						if not v[b] then
							begin
								inc(r);if r>=20000 then r:=1;
								q[r]:=b;v[b]:=true;
                                inc(c[b]);if c[b]>n then exit(false);
							end;
					end;
				ege:=next[ege];
			end;
		//writeln;
	until l=r;
	exit(true);
end;
begin
	assign(input,'sequence.in');reset(input);assign(output,'sequence.out');rewrite(output);
	readln(N,A0,B0,L0,A1,B1,L1);
	for i:=1 to n do
		begin
		    add(i-1,i,1);
			add(i,i-1,0);
		end;
	for i:=1 to n do
		begin
	        add(0,i,i);
			add(i,0,0);
		end;
	for i:=1 to n-l0+1 do
		begin
	        add(i-1,i+l0-1,l0-a0);
			add(i+l0-1,i-1,b0-l0);
		end;
	for i:=1 to n-l1+1 do
		begin
			add(i-1,i+l1-1,b1);
			add(i+l1-1,i-1,-a1);
        end;
	if spfa then
		begin
			for i:=1 to n-1 do
				write(s[i]-s[i-1]);
			writeln(s[n]-s[n-1]);
		end
	else
		writeln(-1);
	close(output);
end.

