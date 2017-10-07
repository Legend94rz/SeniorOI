type
	heap=record
		time,data,num:longint;
		end;
var
	n,i:longint;
	w:longint;
	tot:longint;
	head,next,ed,a,c,d:array[0..100001]of longint;
	ans:longint;
	hp:array[0..400001]of heap;
	la:longint;
procedure swap(a,b:longint);
var
	t:heap;
begin
	t:=hp[a];hp[a]:=hp[b];hp[b]:=t;
end;
procedure up(x:longint);
begin
	while (x>1)and(hp[x shr 1].data<hp[x].data) do begin swap(x,x shr 1);x:=x shr 1;end;
end;
procedure down(x:longint);
var
	j:longint;
begin
	j:=x shl 1;
	while j<=la do
		begin
			if (hp[j].data<hp[j+1].data)and(j<la)then inc(j);
			if hp[j shr 1].data<hp[j].data then
				begin
					swap(j shr 1,j);
					j:=j shl 1;
				end
			else
				break;
        end;
end;
function getmax(day:longint):longint;
begin
	while (hp[1].time+d[hp[1].num]<=day)and(la>=1) do
		begin
			//writeln('delAt',hp[1].num);
			hp[1]:=hp[la];dec(la);down(1);
        end;
    if la=0 then exit(0);
	exit(hp[1].data);
end;
procedure deal(K:longint);
var
	ege,b:longint;
begin
	ege:=head[k];//write('*',k);
	while ege<>0 do
		begin
			b:=ed[ege];//write('->',b);
			inc(la);
            hp[la].time:=k;hp[la].data:=a[b];hp[la].num:=b;up(la);
			ege:=next[ege];
        end;
	//writeln;
end;
procedure add(x,y:longint);
begin
	if y>n then exit;
	inc(tot);
//	writeln('add:',y,'->',x);
	ed[tot]:=x;
	next[tot]:=head[y];
	head[y]:=tot;
end;
begin
	assign(input,'water.in');reset(input);assign(output,'water.out');rewrite(output);
	readln(n);
	for i:=1 to n do
		begin
			readln(a[i],c[i],d[i]);
			deal(i);//第i天该加的加入
			w:=getmax(i);
			if w>0 then a[i]:=a[i]+w;
			add(i,i+c[i]);//第i天到第i+c[i]天要加入堆
			if a[i]>ans then ans:=a[i];//if i=4 then writeln('la=',la);
        end;
	writeln(ans);
	close(output);
end.

