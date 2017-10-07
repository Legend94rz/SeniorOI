{
id:rz109291
PROG:contact
LANG:PASCAL
}
{USER: r z [rz109291]
TASK: contact
LANG: PASCAL

Compiling...
Compile: OK

Executing...
   Test 1: TEST OK [0.000 secs, 3596 KB]
   Test 2: TEST OK [0.000 secs, 3596 KB]
   Test 3: TEST OK [0.000 secs, 3596 KB]
   Test 4: TEST OK [0.000 secs, 3596 KB]
   Test 5: TEST OK [0.081 secs, 3596 KB]
   Test 6: TEST OK [0.081 secs, 3596 KB]
   Test 7: TEST OK [0.108 secs, 3596 KB]

All tests OK.
YOUR PROGRAM ('contact') WORKED FIRST TIME!  That's fantastic
-- and a rare thing.  Please accept these special automated
congratulations.
}
type
	node=record
		s:string[20];
		c:longint;
		end;
var
	tre:array[0..100000]of longint;
	i,j,n,a,b,ls,p,la:longint;
	ans:array[0..100000]of node;
	s:array  [0..200010]of char;
	y:string;
function min(a,b:longint):longint;
begin
	if a>b then exit(b);
	exit(a);
end;
procedure count(d,pos:longint);
begin
	if(d>b)or(tre[pos]=0) then exit;
	inc(y[0]);
	if odd(pos) then
		y[d]:='1'
	else
		y[d]:='0';
	if d>=a then
		begin
		inc(la);
		ans[la].s:=y;
		ans[la].c:=tre[pos];
		end;
	if tre[pos shl 1]>0 then count(d+1,pos shl 1);
	if tre[pos shl 1+1]>0 then count(d+1,pos shl 1 +1);
	dec(y[0]);
end;
function change(a,b:string):boolean;   // 比较字符串 需要交换时 返回false 否则为true
var
    i:byte;
begin
    change:=false;
    if a[0]>b[0] then exit(false);
    if a[0]<b[0] then exit(true);
	exit(a<b);
end;
procedure sort(b,e:longint);      // 以次数为第一关键字 字符串为第二关键字的快排
var
    i,j:longint;
    y:string;
    x:longint;
    yy:node;
begin
    i:=b;
    j:=e;
    x:=ans[(i+j) shr 1].c;
    y:=ans[(i+j) shr 1].s;
    repeat
		while (ans[j].c<x) or ((ans[j].c=x) and change(y,ans[j].s)) do dec(j);
        while (ans[i].c>x) or ((ans[i].c=x) and change(ans[i].s,y)) do inc(i);
        if i<=j then
            begin
                yy:=ans[j];ans[j]:=ans[i];ans[i]:=yy;
                inc(i);dec(j);
            end;
    until i>j;
    if i<e then sort(i,e);
    if j>b then sort(b,j);
end;
procedure print;
var
	k,tc,j:longint;
	ts:string;
begin
	k:=1;
	tc:=ans[1].c;
	for i:=1 to n do
		begin
			writeln(tc);
			j:=0;
			ts:='';
			while (k<=la)and(ans[k].c=tc) do
				begin
					inc(j);
					ts:=ts+ans[k].s+' ';
					if j mod 6 = 0 then
						begin
						delete(ts,length(ts),1);
						writeln(ts);
						j:=0;
						ts:='';
						end;
					inc(k);
				end;
			if j mod 6<>0 then
				begin
					delete(ts,length(ts),1);
					writeln(ts);
				end;
			tc:=ans[k].c;
			if k>la then break;
		end;
end;
procedure work;
var
    i,j:longint;
    p:integer;
begin
    for i:= 1 to ls do
        begin
            p:=1;
            for j:=i to min(i+b-1,ls) do
                begin
                    if s[j]='1' then
                        p:=p shl 1 + 1
                    else
                        p:=p shl 1;
                    inc(tre[p]);
			//writeln(i,' ',j,' ','tre[',p,']=',tre[p]);
		end;
	end;
end;
begin
    assign(input,'contact.in');reset(input);assign(output,'contact.out');rewrite(output);
	readln(a,b,n);
    while not eof do
        begin
            while not eoln do
                begin
                    inc(ls);
                    read(s[ls]);
                end;
            readln;
        end;
	work;
	y:='';count(1,2);
	y:='';count(1,3);
	sort(1,la);
	print;
	close(input);close(output);
end.
