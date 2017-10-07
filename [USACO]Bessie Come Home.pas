{
id:rz109291
LANG:PASCAL
PROG:comehome
}
{
USER: r z [rz109291]
TASK: comehome
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 2084 KB]
   Test 2: TEST OK [0.000 secs, 2084 KB]
   Test 3: TEST OK [0.000 secs, 2084 KB]
   Test 4: TEST OK [0.000 secs, 2084 KB]
   Test 5: TEST OK [0.000 secs, 2084 KB]
   Test 6: TEST OK [0.000 secs, 2084 KB]
   Test 7: TEST OK [0.000 secs, 2084 KB]
   Test 8: TEST OK [0.000 secs, 2084 KB]
   Test 9: TEST OK [0.000 secs, 2084 KB]

All tests OK.
Your program ('comehome') produced all correct answers!  This is your
submission #3 for this problem.  Congratulations!
}
var
	s:string;
	n,i,j:longint;
	e:array['A'..'z','A'..'z']of longint;
	a,b:array['A'..'z',0..15000]of char;
	v:array['A'..'z']of longint;
	vis:array['A'..'z']of boolean;
	q:array[0..100000]of char;
	d:array['A'..'z']of longint;
	uc:array[0..30]of char;
	l,r,he,ta,t:longint;
	k,p:char;
procedure spfa;
begin
	fillchar(d,sizeof(d),$3f);d['Z']:=0;
	L:=0;r:=1;q[r]:='Z';
	fillchar(vis,sizeof(vis),0);
	vis['Z']:=true;
	repeat
		inc(l);
		k:=q[l];
		for i:=1 to v[k] do
			begin
				if d[k]+e[k,b[k,i]]<d[b[k,i]] then
					begin
						d[b[k,i]]:=d[k]+e[k,b[k,i]];
						if not vis[b[k,i]] then
							begin
								inc(r);
								q[r]:=b[k,i];
								vis[b[k,i]]:=true;
							end;
					end;
			end;
		vis[k]:=false;
	until l>=r;
end;
begin
	assign(input,'comehome.in');reset(input);assign(output,'comehome.out');rewrite(output);
	readln(n);
	fillchar(e,sizeof(e),$3f);
	for i:=1 to n do
		begin
			readln(s);
			val(copy(s,5,length(s)-4),t);
			inc(v[s[1]]);
			b[s[1],v[s[1]]]:=s[3];
			if t<e[s[1],s[3]] then
				e[s[1],s[3]]:=t;
			inc(v[s[3]]);
			b[s[3],v[s[3]]]:=s[1];
			e[s[3],s[1]]:=e[s[1],s[3]];
			if (s[1] in['A'..'Z'])and(not vis[s[1]]) then
				begin
					inc(ta);
					uc[ta]:=s[1];
					vis[s[1]]:=true;
				end;
			if (s[3] in['A'..'Z'])and(not vis[s[3]]) then
				begin
					inc(ta);
					uc[ta]:=s[3];
					vis[s[3]]:=true;
				end;
		end;
	spfa;
	j:=$3f3f3f3f;
	for i:=1 to ta do
		begin
			if (d[uc[i]]<j)and(uc[i]<>'Z') then
				begin
					j:=d[uc[i]];
					p:=uc[i];
				end;
			//writeln(uc[i],' ',d[uc[i]]);
		end;
	writeln(p,' ',j);
	close(input);close(output);
end.
