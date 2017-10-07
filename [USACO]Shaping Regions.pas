{
ID:rz019291
LANG:PASCAL
PROG:rect1
}
{
USER: r z [rz109291]
TASK: rect1
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 324 KB]
   Test 2: TEST OK [0.000 secs, 324 KB]
   Test 3: TEST OK [0.000 secs, 324 KB]
   Test 4: TEST OK [0.000 secs, 324 KB]
   Test 5: TEST OK [0.000 secs, 324 KB]
   Test 6: TEST OK [0.000 secs, 324 KB]
   Test 7: TEST OK [0.000 secs, 324 KB]
   Test 8: TEST OK [0.000 secs, 324 KB]
   Test 9: TEST OK [0.000 secs, 324 KB]
   Test 10: TEST OK [0.000 secs, 324 KB]
   Test 11: TEST OK [0.000 secs, 324 KB]

All tests OK.
YOUR PROGRAM ('rect1') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
	ans:array[0..2600]of longint;
	x1,x2,y1,y2,c:array[0..2000]of longint;
	i,j,n,k,mc:longint;
procedure cover(l,r,x,s,k,col:longint);
begin
	while (k<=n)and((l>=x2[k])or(r<=x1[k])or(x>=y2[k])or(s<=y1[k])) do inc(k);
	if k>n then begin ans[col]:=ans[col]+(r-l)*(s-x);exit;end;
	if (l<=x1[k]) then begin cover(l,x1[k],x,s,k+1,col);l:=x1[k];end;//这里=可有可无，下同
	if (r>=x2[k]) then begin cover(x2[k],r,x,s,k+1,col);r:=x2[k];end;
	if (x<=y1[k]) then begin cover(l,r,x,y1[k],k+1,col);x:=y1[k];end;
	if (s>=y2[k]) then begin cover(l,r,y2[k],s,k+1,col);s:=y2[k];end;
end;
begin
	assign(input,'rect1.in');reset(input);assign(output,'rect1.out');rewrite(output);
	readlN(x2[0],y2[0],n);
	x1[0]:=0;c[0]:=1;y1[0]:=0;
	for i:=1 to n do
		begin
		readln(x1[i],y1[i],x2[i],y2[i],c[i]);
		if c[i]>mc then mc:=c[i];
		end;
	for i:=n downto 0 do
		cover(x1[i],x2[i],y1[i],y2[i],i+1,c[i]);
	for I:=1 to mc do
		if ans[i]<>0 then
			writelN(i,' ',ans[i]);
	close(input);close(output);
end.
