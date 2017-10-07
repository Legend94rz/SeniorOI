{
id:rz109291
PROG:prefix
LANG:PASCAL
}
{
此题没看懂，贴标程
USER: r z [rz109291]
TASK: prefix
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 504 KB]
   Test 2: TEST OK [0.000 secs, 504 KB]
   Test 3: TEST OK [0.000 secs, 504 KB]
   Test 4: TEST OK [0.000 secs, 504 KB]
   Test 5: TEST OK [0.162 secs, 504 KB]
   Test 6: TEST OK [0.189 secs, 504 KB]

All tests OK.
YOUR PROGRAM ('prefix') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
var
  f:array[0..200001] of boolean;
  s:array[1..200] of string[10];
  len:array[1..203] of longint;
  st,tmp:ansistring;
  tot,k,i,j,n:longint;
  c:char;
begin
  assign(input,'prefix.in');reset(input);
  assign(output,'prefix.out');rewrite(output);
  tot:=1;
  while c<>'.' do
    begin
      read(c);
      if c in ['A'..'Z'] then s[tot]:=s[tot]+c
      else inc(tot);
      if ord(c)=13 then dec(tot);//避免回车干扰
    end;
  tot:=tot-2;//消除末尾回车影响
  readln(st);
  while not eof do
    begin
      readln(tmp);st:=st+tmp;
    end;
  for i:=1 to tot do
    len[i]:=length(s[i]);
  n:=length(st);
  fillchar(f,sizeof(f),0);f[0]:=true;
  for i:=1 to n do
    for j:=1 to tot do
      if (len[j]<=i)and(copy(st,i-len[j]+1,len[j])=s[j]) and (f[i-len[j]]) then
        begin
          f[i]:=true;
          break;
        end;
  for i:=n downto 0 do
    if f[i] then
      begin
        writeln(i);
        close(input);
        close(output);
        halt;
      end;
end.