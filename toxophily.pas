program tox;

var
  ans, h, r, n, m, k, i: longint;
  g: array[1..200000] of integer;
  a: array[1..1000000] of integer;

begin
  //Assign(input, 'toxophily.in');
  //reset(input);
  //Assign(output, 'toxophily.out');
  //rewrite(output);

  readln(n, m);
  for i := 1 to m do
    g[i] := 0;
  h := 1;
  k := 0;
  ans := maxlongint;
  for i := 1 to n do
  begin
    Read(r);
    if g[r] = 0 then
      Inc(k);
    Inc(g[r]);
    a[i] := r;
    while g[a[h]] > 1 do
    begin
      Dec(g[a[h]]);
      Inc(h);
    end;
    if k = m then
      if i - h + 1 < ans then
        ans := i - h + 1;
  end;
  //readln;
  if ans <> maxlongint then
    writeln(ans)
  else
    writeln(-1);

  Close(input);
  Close(output);
end.

