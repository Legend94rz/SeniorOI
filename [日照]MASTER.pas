var
	a:array[0..10000]of double;
	n,k:longint;
	t:longint;
    i,j:longint;
	l,r,m,ans:double;
    e,f,g:boolean;
procedure check(u:double;var b:boolean);
var
    i,y:longint;
begin
  	t:=0;
	for i:=1 to n do
        BEGIN
           	y:=trunc(a[i]/u);
			if a[i]-u<=0.0001 then y:=1;
            inc(t,y);
        end;
    writeln(u:0:3,' ',t);
    if t>=k then
       	b:=true
    else
        b:=false;
end;
begin
	//assign(input,'MASTER.in');reset(input);assign(output,'MASTER.out');rewrite(output);
    readln(n,k);r:=0;
	for i:=1 to n do
		begin
	    	readln(a[i]);
			r:=r+a[i];
        end;
	l:=0.01;
    repeat
		m:=(l+r)/2;t:=0;
        for i:=1 to n do
            inc(t,trunc(a[i]/m));
        writeln(m:0:4,' ',t);
        if t>=k then
        	l:=m
        else
          	r:=m;
    until r-l<=0.00001;
    writeln(l:0:4,' ',m:0:4,' ',r:0:4);
    {check(l,e);check(m,f);check(r,g);
    if e then ans:=l;
    if f and(not e)then ans:=m;
    if g and(not e)and(not f) then ans:=r;
    writeln(e,' ',f,' ',g,' ',ans:0:2);}
	close(input);close(output);
end.
