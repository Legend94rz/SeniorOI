{
id:rz019291
PROG:spin
LANG:PASCAL
}
{
USER: r z [rz109291]
TASK: spin
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 280 KB]
   Test 2: TEST OK [0.000 secs, 280 KB]
   Test 3: TEST OK [0.000 secs, 280 KB]
   Test 4: TEST OK [0.000 secs, 280 KB]
   Test 5: TEST OK [0.000 secs, 280 KB]
   Test 6: TEST OK [0.000 secs, 280 KB]
   Test 7: TEST OK [0.000 secs, 280 KB]
   Test 8: TEST OK [0.000 secs, 280 KB]

All tests OK.
Your program ('spin') produced all correct answers!  This is your
submission #2 for this problem.  Congratulations!
}
var
	w,m:array[0..5,0..359]of boolean;
	v:array[0..5]of longint;
	i,j,k:longint;
	s,t,n:longint;
begin
	assign(input,'spin.in');reset(input);assign(output,'spin.out');rewrite(output);
	for i:=1 to 5 do
		begin
		read(v[i]);
		read(n);
		for j:=1 to n do
			begin
				read(s,t);
				for k:=s to s+t do
					w[i,k mod 360]:=true;
			end;
		end;
	for i:=0 to 359 do
		begin
			for j:=1 to 5 do
				for k:=0 to 359 do
					m[j,(k+v[j]*i)mod 360]:=w[j,k];
			for j:=0 to 359 do
				if m[1,j]and(m[2,j])and(m[3,j])and(m[4,j])and(m[5,j]) then
					begin
						writelN(i);
						close(input);
						close(output);
						halt;					
					end;
		end;
	writeln('none');
	close(input);close(output);
end.
