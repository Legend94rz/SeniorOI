type
	heap=record
		s,t,d:longint;
	end;
var
	i,j,n,m:longint;
	ch:array[0..1000001]of char;
	a,l,r:array[0..1000001]of longint;
	h:array[0..8000001]of heap;
	has:boolean;
	tmp:heap;
	la:Longint;
	flag:array[0..1000001]of boolean;
	ans:array[0..1000001,1..2]of longint;
	ansL:longint;
operator >(a,b:heap)ans:boolean;
begin
	ans:=(a.d>b.d)or(a.d=b.d)and(a.s>b.s);
end;
procedure swap(a,b:longint);
var
	t:heap;
begin
	t:=h[a];h[a]:=h[b];h[b]:=t;
end;
procedure up(x:Longint);
begin
	while (x>1)and(h[x shr 1]>h[x]) do begin swap(x,x shr 1);x:=x shr 1;end;
end;
procedure down(x:longint);
var
	j:longint;
begin
	j:=x shl 1;
	while j<=la do
		begin
			if (h[j]>h[j+1])and(j+1<=la) then inc(j);
			if h[x]>h[j] then
				begin
					swap(x,j);
					x:=j;
					j:=j shl 1;
				end
			else
				break;
        end;
end;
begin
	assign(input,'dancinglessons.in');reset(input);assign(output,'dancinglessons.out');rewrite(output);
	readln(n);
	for I:=1 to n do read(ch[i]);readln;
	for I:=1 to n do begin read(a[i]);l[i]:=i-1;r[i]:=i+1;end;
	for i:=2 to n do
		if ch[i]<>ch[i-1] then
			begin
				inc(la);//writeln(la);
				h[la].s:=i-1;h[la].t:=i;
				h[la].d:=abs(a[i]-a[i-1]);
				up(la);
			end;
	//writeln('>',la);
	while la>0 do
		begin
			if (not flag[h[1].s]) and (not flag[h[1].t]) then
				begin
					inc(ansL);has:=false;
					ans[AnsL,1]:=h[1].s;ans[Ansl,2]:=h[1].t;
					flag[h[1].s]:=true;flag[h[1].t]:=true;
					l[r[h[1].t]]:=l[h[1].s];
					r[L[h[1].s]]:=r[h[1].t];
					if (ch[l[h[1].s]]<>ch[r[h[1].t]])and(L[h[1].s]<>0)and(r[h[1].t]<>n+1) then
						begin
							has:=true;
							tmp.s:=l[h[1].s];tmp.t:=r[h[1].t];tmp.d:=abs(a[tmp.s]-a[tmp.t]);
                        end;
				end;
			h[1]:=h[lA];dec(la);down(1);
			if has then begin inc(la);h[la]:=tmp;up(la);end;
        end;
	writeln(ansL);
	for i:=1 to ansL do
		writeln(ans[i,1],' ',ans[i,2]);
	close(output);
end.

