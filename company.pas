program company;

type
  node = record
    l, r, dep, f, val: longint;
  end;
var
  tr: array[0..1 shl 17] of node;
  i, j, n, m, x, y, t: longint;
  isn: array[0..1 shl 17] of boolean;
  a: array[0..1 shl 17] of extended;
  r, Count, max: longint;
  tmp: extended;

  procedure qsort(s, t: longint);
  var
    i, j: longint;
    k, y: extended;
  begin
    i := s;
    j := t;
    k := a[(s + t) shr 1];
    repeat
      while a[j] > k do
        Dec(j);
      while a[i] < k do
        Inc(i);
      if i <= j then
      begin
        y := a[i];
        a[i] := a[j];
        a[j] := y;
        Inc(i);
        Dec(j);
      end;
    until i > j;
    if (s < j) then
      qsort(s, j);
    if (i < t) then
      qsort(i, t);
  end;

begin
  Assign(input, 'company.in');
  reset(input);
  Assign(output, 'company.out');
  rewrite(output);
  readln(n);
  tr[1].dep := 0;
  for i := 1 to n do
  begin
    Read(t);
    if t = 2 then
    begin
      readln(x, y);
      tr[i].l := x;
      tr[x].f := i;
      tr[x].dep := tr[i].dep + 1;
      tr[i].r := y;
      tr[y].f := i;
      tr[y].dep := tr[i].dep + 1;
    end
    else
    begin
      readln(x);
      tr[i].val := x;
      isn[i] := True;
    end;
  end;
  for i := 1 to n do
    if isn[i] then
    begin
      Inc(r);
      tmp := tr[i].val;
      tmp := tmp * (1 shl tr[i].dep);
      //writeln(i,tr[i].dep);
      a[r] := tmp;
    end;
  qsort(1, r);
  Count := 1;
  for i := 2 to r do
    if a[i] = a[i - 1] then
      Inc(Count)
    else
    begin
      if Count > max then
        max := Count;
      Count := 1;
    end;
  if Count > max then
    max := Count;
  writeln(r - max);
  Close(output);
end.

