type
	arr=record
		d:array[0..50000]of longint;
		l:longint;
		end;
var
	b,i,j,n,m,p:longint;
	a:arr;
	s,sa,sb:string;
function cf(a:arr;b:longint):arr;
var
	i:longint;
begin
	for i:=1 to a.l do a.d[i]:=a.d[i]*b;
	for i:=1 to a.l do
		begin
			inc(a.d[i+1],a.d[i] div 10);
			a.d[i]:=a.d[i] mod 10;
        end;
	inc(a.l);//这里要多加一位，乘法嘛~~~
	while a.d[a.l]>0 do
		begin
			inc(a.d[a.l+1],a.d[a.l] div 10);
			a.d[a.l]:=a.d[a.l]mod 10;
			inc(a.l);
        end;
	exit(a);
end;
begin
	//assign(output,'test.txt');rewrite(output);
	while not eof do
		begin
			readln(s);
			fillchar(a,sizeof(a),0);
			p:=pos(' ',s);
			sa:=copy(s,1,p-1);sb:=copy(s,p+1,length(s)-p);val(sb,n);
			while (sa[length(sa)]='0')and(pos('.',sa)<>0) do delete(sa,length(sa),1);
			p:=pos('.',sa);
            if p<>0 then m:=(length(sa)-p)*n else m:=0;
            delete(sa,p,1);val(sa,b);
			for i:=1 to length(sa) do a.d[i]:=ord(sa[length(sa)-i+1])-48;a.l:=length(sa);

			//for i:=a.l downto 1 do write(a.d[i]);writeln;
			//writeln('p=',p,' sa=',sa,' sb=',sb,' n=',n,' l=',a.l,' m=',m,' b=',b);

			for i:=2 to n do a:=cf(a,b);//writeln('l=',a.l);
            while (a.d[a.l]=0)and(a.l>m) do dec(a.l);

			j:=1;while (a.d[j]=0)and(m>j) do inc(j);//注意结果类似 ****0000.  的情况
			if a.l<m then a.l:=m;
			for i:=a.l downto j do
				begin
					if (i=m)and(i>j) then write('.');
					write(a.d[i]);
				end;
			writeln;
        end;
	//close(output);
end.

