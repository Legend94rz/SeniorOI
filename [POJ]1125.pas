var
	i,j,n,m,x,y,k,min:longint;
	b,e:array[0..105,0..105]of longint;
	v,ind,longest:array[0..105]of longint;
        f:byte;
begin
	m:=-1;
	while m<>0 do
		begin
		readln(m);
                if m=0 then break;
                fillchar(b,sizeof(b),0);
                fillchar(e,sizeof(e),$3f);
                fillchar(v,sizeof(v),0);
                fillchar(ind,sizeof(ind),0);
		for i:=1 to m do
		    begin
                    read(n);
                    for j:=1 to n do
		    	begin
		             read(x,y);
			     inc(v[i]);
                             inc(ind[x]);
                             b[i,v[i]]:=x;
                             e[i,x]:=y;
                    	end;
                    end;
                f:=0;
		for i:=1 to m do
                    if ind[i]=0 then
                       begin
                            inc(f);
			    if f>=2 then
			       begin
                               writeln('disjoint');
			       break;
                               end;
                       end;
		if f>=2 then continue;
                for i:=1 to m do
                    e[i,i]:=0;
                for k:=1 to m do
                    for i:=1 to m do
                    	if i<>k then
                           for j:=1 to m do
                               if (j<>i)and(j<>k)then
                               	  if e[i,k]+e[k,j]<e[i,j] then
                                     e[i,j]:=e[i,k]+e[k,j];
        	{for i:=1 to m do
                    for j:=1 to m do
                        writelN(i,' ',j,' ',e[i,j]);}
		fillchar(longest,sizeof(longest),0);
                for i:=1 to m do
                    for j:=1 to m do
		    	if (e[i,j]>longest[i]){and(e[i,j]<>$3f3f3f3f)} then
                           longest[i]:=e[i,j];
		min:=$3f3f3f3f;
                for i:=1 to m do
		    if (longest[i]<min)and(longest[i]<>$3f3f3f3f) then
                       begin
		       min:=longest[i];
                       k:=i;
                       end;
                writeln(k,' ',min);
		end;
end.
