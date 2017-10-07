var
	n,m:longint;
	ed,e,head,next:array[0..47801]of longint;
	i,j,tot,s,t,nn,l,r,mid:longint;
	ans,flow:longint;
	h,vh:array[0..3801]of longint;
function min(a,b:longint):longint;
begin
	if a<b then exit(a);
	exit(b);
end;
procedure add(x,y,z:longint);
begin
	inc(tot);
	//if y=2 then writeln('Warning: ',x,' ',y,' ',z,' ',tot,' ',ans);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
	inc(tot);
	ed[tot]:=x;e[tot]:=0;
	next[tot]:=head[y];
	head[y]:=tot;
end;
function sap(m,f:Longint):longint;
var
	minh,rest,k,b,ege:Longint;
begin
	//writeln(m,' ',f);readln;
	if m=t then exit(f);
	minh:=nn;rest:=f;
	ege:=head[m];
	while ege<>0 do
		begin
			b:=ed[ege];
			if e[ege]>0 then
				begin
					if h[b]+1=h[m] then
						begin
							k:=sap(b,min(rest,e[ege]));
							dec(rest,k);dec(e[ege],k);inc(e[ege xor 1],k);
							if h[s]>=nn then exit(f-rest);
						end;
					if h[b]<minh then minh:=h[b];if rest=0 then break;
				end;
			ege:=next[ege];
		end;
	if rest=f then
		begin
			dec(vh[h[m]]);
			if vh[h[m]]=0 then h[s]:=nn;
			h[m]:=minh+1;
			inc(vh[h[m]]);
		end;
	exit(f-rest);
end;
procedure print;
var
	k,b,ege:longint;
begin
	for i:=0 to 2*ans+1 do
		begin
			write(i);
			ege:=head[i];
			while ege<>0 do
				begin
					if e[ege]<=0 then begin ege:=next[ege];continue;end;
					write('->',ed[ege],' ',e[ege]);
					ege:=next[ege];
                end;
			writeln;
        end;
end;
function cal:longint;
var
	i,j:longint;
begin
	for j:=1 to ans-1 do
		if sqr(trunc(sqrt(ans+j)))=ans+j then
			add(j*2,ans*2+1,1);
	add(s,2*ans,1);add(ans*2+1,t,1);
	//----------rebuilt-----------------
	{tot:=1;fillchar(head,sizeof(head),0);
	for i:=1 to ans do
		begin
			for j:=1 to i-1 do
				if sqr(trunc(sqrt(i+j)))=i+j then
					add(j*2,i*2+1,1);
			add(s,i*2,1);add(i*2+1,t,1);
        end;
	flow:=0;fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);}
	//----------------------------------
	//write('flow=');
	fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);
    while h[s]<nn do inc(flow,sap(s,1 shl 30));
	//writeln(flow,' ',ans-flow);
	exit(ans-flow);
end;
begin
	assign(input,'ball.in');reset(input);assign(output,'ball.out');rewrite(output);
	readln(n);tot:=1;s:=1;ans:=1;t:=0;nn:=4;
	while cal<=n do begin inc(ans);{writeln('ans=',ans);}inc(nn,2);end;
	{l:=1;r:=1800;
	repeat
		ans:=(l+r)shr 1;
		if cal<=n then
			l:=ans+1
		else
			r:=ans-1;
	until l>r;
	writeln(r);}
	writeln(ans-1);
    close(output);
end.

