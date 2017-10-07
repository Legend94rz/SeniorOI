type
    node=record
    data,num:longint;
    end;
var
   i,j,n,m,x,y,k,t:longint;
   a:array[0..5000]of node;
procedure qsort(s,t:longint);
var
   i,j,k:longint;
   y:node;
begin
     i:=s;j:=t;k:=a[(s+t)shr 1].data;
     repeat
     	   while a[j].data>k do dec(j);
           while a[i].data<k do inc(i);
           if i<=j then
			begin
				y:=a[i];a[i]:=a[j];a[j]:=y;
				inc(i);dec(j);
			end;
     until i>=j;
     if i<t then qsort(i,t);
     if s<j then qsort(s,j);
end;
begin
     assign(input,'server.in');reset(input);assign(output,'server.out');rewrite(output);
     readln(n);
     for i:=1 to n do
     	 begin
			read(a[i].data);
			a[i].num:=i;
         end;
     qsort(1,n);
     readln(m);
     for i:=1 to m do
     	 begin
			REAdln(x,y,k);
			t:=0;
			for j:=1 to n do
              	  if (a[j].num>=x)and(a[j].num<=y)then
                     begin
						inc(t);
						if t=k then
							begin
								writelN(a[j].num);
								break;
                             end;
                     end;
	 end;
     close(input);close(output);
end.
