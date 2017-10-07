{
id:rz019291
PROG:fact4
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: fact4
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 312 KB]
   Test 2: TEST OK [0.000 secs, 312 KB]
   Test 3: TEST OK [0.000 secs, 312 KB]
   Test 4: TEST OK [0.000 secs, 312 KB]
   Test 5: TEST OK [0.000 secs, 312 KB]
   Test 6: TEST OK [0.000 secs, 312 KB]
   Test 7: TEST OK [0.000 secs, 312 KB]
   Test 8: TEST OK [0.027 secs, 312 KB]
   Test 9: TEST OK [0.027 secs, 312 KB]
   Test 10: TEST OK [0.027 secs, 312 KB]

All tests OK.
YOUR PROGRAM ('fact4') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
type
	arr=array[0..10000]of longint;
var
	i,j,la:longint;
	a:arr;
	n:longint;
function cf(a:arr;x:longint):arr;
var
	i,j:longint;
begin
	for I:=1 to la do
		a[i]:=a[i]*x;
	for i:=1 to la do
		begin
		a[i+1]:=a[i+1]+a[i] div 10;
		a[i]:=a[i]mod 10;		
		end;
        while a[la]>0 do
		begin
			a[la+1]:=a[la]div 10;
			a[la]:=a[la]mod 10;
			inc(la);
		end;
        exit(a);
end;	
begin
	assign(input,'fact4.in');reset(input);assign(output,'fact4.out');rewrite(output);
	readln(n);
	la:=1;a[1]:=1;
	for i:=1 to n do
		begin
			a:=cf(a,i);
			{for j:=la downto 1 do
				write(a[j]);
			writeln(' ',la);
			dec(la);  }
		end;
        //writeln;
	for i:=1 to la do
		if a[i]<>0 then
			begin
				writeln(a[i]);
				close(input);
				close(output);
				halt;
			end;
end.
