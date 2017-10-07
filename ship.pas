var
	i,j,n,m,max,bian:longint;
	a:array[0..500] of longint;
	l,r:longint;
	f:boolean;
function r2i(re:real):longint;
begin
	r2i:=trunc(re);
end;
function check(x,y:real):boolean;
var
	i,k,j:longint;
	bg,sm:boolean;
	e,f:real;
begin
	bg:=false;sm:=false;
	i:=r2i(x);
	while ((i mod bian<>r2i(y))and(y-r2i(y)=0))or((i mod bian<=y)and(y-r2i(y)<>0)) do
		begin
			//write((i mod bian-y<0)and(y-r2i(y)<>0));write(i mod bian,' ',y:0:3);writeln(y-r2i(y)<>0);
			if (a[i mod bian]=max)and(i mod bian<>x)and(i mod bian<>y) then
				begin
					bg:=true;
					break;
				end;
			inc(i);
			if i>bian  then break;
			//writeln(i mod bian,'*');
		end;
	//writeln(bg,' ');
	i:=r2i(y);//writeln('i=',' ',i);
	while (i mod bian<>r2i(x))and(y-r2i(y)=0)or(i mod bian<>(r2i(X)+bian)mod bian)and(y-r2i(y)<>0) do
		begin
			if (a[i mod bian]=max)and(i mod bian<>x)and(i mod bian<>y) then
				begin
					sm:=true;
					break;
				end;
			inc(i);
			//writeln(i mod bian,'%');
		end;
	//writelN(x:0:3,' ',y:0:3);
	//writeln(bg,' ',sm);
	exit(bg and sm);
end;
function i2r(key:longint):real;
begin
	i2r:=key;
end;
begin
	assign(input,'ship9.in');assign(output,'ship.out');reset(input);rewrite(output);
	readlN(m);
	for i:=1 to m do
		begin
			max:=0;f:=true;
			read(bian);
			for j:=0 to bian-1 do
				begin
				read(a[j]);
				if a[j]>max then max:=a[j];
				end;
			//readln;bian:=j;writeln(bian);
			if not odd(bian) then
				begin
					for j:=0 to (bian) div 2-1 do
						if not check(i2r(j),i2r((j+bian div 2)mod bian)) then
							begin
								f:=false;break;
							end;
					if f then writeLN('Yeah!') else writeln('T_T');
				end
			else
				begin
					for j:=0 to (bian-1)div 2+1 do
						if not check(i2r(j),j+bian/2) then
							begin
								f:=false;break;
							end;
					if f then writeLN('Yeah!') else writeln('T_T');
				end;
		end;
	close(output);close(input);
end.
