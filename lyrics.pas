type
  node=record
    lyc:string;
    no:longint;
    end;
var
	i,j,n,tot:longint;
	a:array[0..2500000]of node;
    s,name,art,t:string;
procedure add(s:string);
var
    h,m,se:longint;
    i,p:longint;
begin
	for i:=length(s) downto 1 do
		if s[i]=']' then
			begin
				p:=i;
				break;
			end;
	i:=1;
	while s[i]='[' do
		begin
			inc(tot);
			val(copy(s,i+1,2),h);
			val(copy(s,i+4,2),m);
			val(copy(s,i+7,2),se);
			a[tot].no:=h*6000+m*100+se;
			a[tot].lyc:=copy(s,p+1,length(s)-p+1);
			inc(i,10);
		end;
	
end;
procedure qsort(s,t:longint);
var
	k,i,j:Longint;
    y:node;
begin
    i:=s;j:=t;k:=a[(s+t)shr 1].no;
    repeat
      	while a[j].no>k do dec(j);
        while a[i].no<k do inc(i);
        if i<=j then
        	begin
                y:=a[i];a[i]:=a[j];a[j]:=y;
                inc(i);dec(j);
            end;
    until i>j;
    if (s<j) then qsort(s,j);
    if (i<t) then qsort(i,t);
end;
begin
	assign(input,'song.lrc');reset(input);assign(output,'song.txt');rewrite(output);
	while not eof do
		begin
			readln(s);//art:='';name:='';
			inc(i);
			if (copy(s,2,3)='ar:') then
				begin
					t:=copy(s,pos(':',s)+1,length(s)-pos(':',s)-1);//writeln(t,' ',i);
					art:='        '+t;
					//continue;
				end;
			if (copy(s,2,3)='ti:') then
				begin
					t:=copy(s,pos(':',s)+1,length(s)-pos(':',s)-1);//writeln(t,' ',i);
					name:='    '+t;
					//continue;
				end;
			if (s[2]in['0'..'9'] )then
				add(s);
		end;
	//writeln(art);writeln(name);
	qsort(1,tot);
	writeln(name);
	writelN(art);
	for i:=1 to tot do
		writelN({a[i].no,' ',}a[i].lyc);
	close(input);close(output);
end.
