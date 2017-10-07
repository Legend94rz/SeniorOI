{
id:rz109291
PROG:butter
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: butter
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 8384 KB]
   Test 2: TEST OK [0.000 secs, 8388 KB]
   Test 3: TEST OK [0.000 secs, 8384 KB]
   Test 4: TEST OK [0.000 secs, 8380 KB]
   Test 5: TEST OK [0.000 secs, 8384 KB]
   Test 6: TEST OK [0.000 secs, 8384 KB]
   Test 7: TEST OK [0.081 secs, 8384 KB]
   Test 8: TEST OK [0.108 secs, 8384 KB]
   Test 9: TEST OK [0.189 secs, 8380 KB]
   Test 10: TEST OK [0.216 secs, 8384 KB]

All tests OK.
Your program ('butter') produced all correct answers!  This is your
submission #4 for this problem.  Congratulations!
}
var
	b,e:array[0..1000,0..1000]of longint;
	v,d:array[0..1000]of longint;
	x,y,z:longint;
	i,j,n,m,p,c,min,t:longint;
	ct:array[0..1000]of longint;
procedure spfa(s:longint);
var
	vis:array[0..1000]of boolean;
	q:array[0..100000]of longint;
	l,r,k,i,res:longint;
begin
	fillchar(vis,sizeof(vis),0);
	fillchar(d,sizeof(d),$3f);
	vis[s]:=true;d[s]:=0;
	l:=0;r:=1;q[1]:=s;
	repeat
		inc(l);
		k:=q[l];
		for i:=1 to v[k] do
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
		vis[k]:=false;
	until l>=r;
	res:=0;
	for i:=1 to p do
		if ct[i]<>0 then
			inc(res,ct[i]*d[i]);
	if res<min then min:=res;
end;
begin
	assign(input,'butter.in');reset(input);assign(output,'butter.out');rewrite(output);
	readln(n,p,c);
	for i:=1 to n do
		begin
			readln(t);
			inc(ct[t]);
		end;
	fillchar(e,sizeof(e),$3f);
	for i:=1 to c do
		begin
			readln(x,y,z);
			inc(v[x]);b[x,v[x]]:=y;e[x,y]:=z;
			inc(v[y]);b[y,v[y]]:=x;e[y,x]:=z;
		end;
	min:=maxlongint;
	for i:=1 to p do
		spfa(i);
	writeln(min);
	close(input);close(output);
end.
