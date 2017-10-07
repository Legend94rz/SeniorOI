var
	head,ed,e,next:array[0..4000001]of longint;
	i,j,k,n,f,d,x,y,z,s,t:longint;
	tot,nn,m:longint;
	flow:longint;
	h,vh:array[0..100000]of longint;
procedure add(x,y,z:longint);
begin
	inc(tot);
	ed[tot]:=y;e[tot]:=z;
	next[tot]:=head[x];
	head[x]:=tot;
	inc(tot);
	ed[tot]:=x;e[tot]:=0;//
	next[tot]:=head[y];
	head[y]:=tot;
end;
function min(a,b:longint):longint;
begin
	if (a<b) then exit(a);
	exit(b);
end;
function sap(m,f:longint):longint;
var
	rest,minh:longint;
	ege,k,b:longint;
begin
	if m=t then exit(f);
	minh:=nn-1;rest:=f;
	ege:=head[m];
	while ege<>0 do
		begin
			b:=ed[ege];
			if e[ege]>0 then
				begin
					if h[b]+1=h[m] then
						begin
							k:=sap(b,min(e[ege],rest));
							dec(e[ege],k);inc(e[ege xor 1],k);dec(rest,k);
							if h[b]>=nn then exit(f-rest);
                        end;
					if h[b]<minh then minh:=h[b];
					if rest=0 then break;
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
	for i:=0 to t do
		begin
			write(i);
			ege:=head[i];
			while ege<>0 do
				begin
					if e[ege]=0 then begin ege:=next[ege];continue;end;
					write('->',ed[ege]);
					ege:=next[ege];
                end;
			writeln;
        end;
end;
begin
	while not eof do
    	begin
			flow:=0;fillchar(h,sizeof(h),0);fillchar(vh,sizeof(vh),0);
			fillchar(head,sizeof(head),0);
			readln(n,f,d);//s:=1;t:=2*(n+1)+f+d;nn:=t;
            s:=0;t:=2*n+f+d+1;nn:=t+1;tot:=1;vh[0]:=nn;
			//for i:=2*n+2 to 2*(n+1)+f-1 do add(s,i,1);
			//for i:=2*n+2+f to 2*(n+1)+f+d-1 do add(i,t,1);

			for i:=1 to f do add(0,i,1);
			for i:=f+n+1 to f+n+d do add(i,t,1);
			for i:=1 to n do
				begin
					read(x,y);//add(2*i,2*i xor 1,1);
					add(f+i,f+i+n+d,1);
					for j:=1 to x do//Fi
						begin
							read(z);
							//add(z+2*n+1,i*2,1);
							add(z,f+i,1);
						end;
					for j:=1 to y do
						begin
							read(z);
							//add(2*i xor 1,z+2*(n+1)+f-1,1);
							add(f+n+d+i,f+n+z,1);
						end;
					readln;
				end;
			//print;
			while h[s]<nn do inc(flow,sap(s,1 shl 30));
			writeln(flow);
		end;
end.

