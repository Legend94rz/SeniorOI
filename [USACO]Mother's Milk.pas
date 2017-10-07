{
ID:rz109291
PROG:milk3
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: milk3
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 304 KB]
   Test 2: TEST OK [0.000 secs, 304 KB]
   Test 3: TEST OK [0.000 secs, 304 KB]
   Test 4: TEST OK [0.000 secs, 304 KB]
   Test 5: TEST OK [0.000 secs, 304 KB]
   Test 6: TEST OK [0.000 secs, 304 KB]
   Test 7: TEST OK [0.000 secs, 304 KB]
   Test 8: TEST OK [0.000 secs, 304 KB]
   Test 9: TEST OK [0.000 secs, 304 KB]
   Test 10: TEST OK [0.000 secs, 304 KB]

All tests OK.
YOUR PROGRAM ('milk3') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
TYPE
	node=record
		da:array[1..3] of 0..20;
		end;
var
	k,t:node;
	i,j:longint;
	m:array[1..3] of 0..20;
	q:array[0..10000]of node;
	l,r:longint;
	b:array[0..50]of boolean;
	d:array[1..6,1..2]of 1..3=((1,2),(2,3),(3,1),(2,1),(3,2),(1,3)); //(灌桶,被灌桶)
function same(e,f:node):boolean;
begin
	for j:=1 to 3 do
		if e.da[j]<>f.da[j] then
			exit(false);
	exit(true);
end;
function dupe(key:node):boolean;
var
	i:longint;
begin
	for i:=1 to r do
		if same(key,q[i]) then
			exit(true);
	exit(false);
end;
begin
	assign(input,'milk3.in');reset(input);assign(output,'milk3.out');rewrite(output);
	readln(m[1],m[2],m[3]);
	l:=0;r:=1;
	q[r].da[1]:=0;
	q[r].da[2]:=0;
	q[r].da[3]:=m[3];
	repeat
		inc(l);
		k:=q[l];
		t:=k;
		for i:=1 to 6 do
			begin
				k:=t;
				if (k.da[d[i,1]]>0)and(k.da[d[i,2]]<m[d[i,2]]) then//灌桶大于0，被灌桶小于最大量
					//两种情况:一是灌桶水量+被灌桶水量<=被灌桶最大量;二是灌桶水量+被灌桶水量>被灌桶最大量
					if(k.da[d[i,1]]+k.da[d[i,2]]<m[d[i,2]])then//case 1
						begin
							k.da[d[i,2]]:=k.da[d[i,2]]+k.da[d[i,1]];//更新被灌桶
							k.da[d[i,1]]:=0;//更新灌桶
						end
					else
						begin
							k.da[d[i,1]]:=k.da[d[i,1]]-(m[d[i,2]]-k.da[d[i,2]]);
							k.da[d[i,2]]:=m[d[i,2]];
						end;
				if not dupe(k) then
					begin
						inc(r);
						q[r]:=k;
					end;
				//write(k.da[1],' ',k.da[2],' ',k.da[3],' ',l,' ',r);
				if (k.da[1]=0) then
					//begin
					b[k.da[3]]:=true;
				        {writeln('true');
					end
				else
					writeln; }
			end;
	until l>=r;
	for i:=0 to m[3]-1 do
		if b[i] then
			write(i,' ');
	writeln(m[3]);
	close(input);close(output);
end.
