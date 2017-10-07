var
   i,j,x1,x2,tmp,n,m:longint;
   f:array[0..100,0..100,0..100]of longint;
   a:array[0..100,0..100]of longint;
begin
     readln(n,m);
     for i:=1 to n do
     	 for j:=1 to m do
             read(a[i,j]);
     f[0,1,1]:=a[1,1];f[1,2,1]:=a[1,2]+a[2,1];
     f[1,1,2]:=f[1,2,1];
     for i:=2 to n+m-3 do
	      for x1:=1 to n do
              	  begin
                       if (i+2-x1<1)or(i+2-x1>m) then continue;
		       for x2:=1 to n do
                       begin
                       	    if (i+2-x2<1)or(i+2-x2>m) then continue;
		     	    if x1=x2 then continue;
                     	    tmp:=f[i-1,x1,x2];
                     	    if (x2-1>0)and(f[i-1,x1,x2-1]>tmp)and(x2-1<>x1) then
                     	       tmp:=f[i-1,x1,x2-1];
                     	    if (x1-1>0) and(x2-1>0)and(tmp<f[i-1,x1-1,x2-1])then
                     	       tmp:=f[i-1,x1-1,x2-1];
                     	    if (x1-1>0)and(f[i-1,x1-1,x2]>tmp)and(x1-1<>x2) then
                     	       tmp:=f[i-1,x1-1,x2];
                     	    f[i,x1,x2]:=tmp+a[x1,i+2-x1]+a[x2,i+2-x2];
                       end;
                  end;
     writeln(f[n+m-3,n,n-1]);
end.
