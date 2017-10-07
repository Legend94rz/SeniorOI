type
	n1=record
		num:longint;
		data,add:longint;
		sort:byte;
		end;
	tn=record
		d,sum,yan:longint;
		end;
var
	i,j,n,m,x,y,z,la,l2,ls:longint;
	f:array[-1..200001]of n1;
	rec:array[0..200001]of byte;//原数据类型-问/加
	tf:array[0..200001,1..3]of longint;
	add:array[0..200001]of longint;
	ch,chb:char;
	t:array[0..800000]of tn;
procedure qsort(s,t:Longint);
var
	i,j:longint;
	u,k:n1;
begin
	i:=s;j:=t;k:=f[(s+t)shr 1];
	repeat
		while (f[j].data>k.data) do dec(j);
		while (f[i].data<k.data) do inc(i);
		if i<=j then
			begin
				u:=f[j];f[j]:=f[i];f[i]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<t) then qsort(i,t);
end;
procedure gai(a,b,l,r,c,p:longint);
var
	k:longint;
begin
	if(a=l)and(b=r) then begin inc(t[p].yan,c);exit;end;
    //这里注意修改延时域时不能t[p].yan:=c;而应该inc(t[p].yan,c);
	if c<>0 then
		begin
			inc(t[p].sum,(r-l+1)*c);
			k:=(a+b) shr 1;
			if (r<=k) then begin gai(a,k,l,r,c,p shl 1);exit;end;
			if (l>k) then begin gai(k+1,b,l,r,c,p shl 1+1);exit;end;
			gai(a,k,l,k,c,p shl 1);gai(k+1,b,k+1,r,c,p shl 1+1);
        end;
end;
function ask(a,b,x,p:longint):longint;
var
	k:longint;
begin
	if t[p].yan<>0 then
		begin
			inc(t[p shl 1].yan,t[p].yan);
			inc(t[p shl 1+1].yan,t[p].yan);
			inc(t[p].sum,t[p].yan*(b-a+1));
			t[p].yan:=0;
        end;
	if (a=b)and(b=x) then exit(t[p].sum);
	k:=(a+b) shr 1;
	if (x<=k) then exit(ask(a,k,x,p shl 1));
	exit(ask(k+1,b,x,p shl 1+1));
end;
begin
	//assign(input,'data.txt');reset(input);assign(output,'test.txt');rewrite(output);
	readln(n,m);
	for i:=1 to m do
		begin
			read(ch);
			if ch='W' then
				begin
		            readln(x,y,z);
                    inc(la);f[la].data:=x;f[la].num:=i;f[la].sort:=1;
					inc(la);f[la].data:=y;f[la].num:=i;f[la].sort:=2;
					rec[i]:=1;add[i]:=z;
                end
			else
				begin
		            readln(x);
					inc(la);f[la].sort:=3;f[la].data:=x;f[la].num:=i;
					rec[i]:=2;
                end;
        end;
	qsort(1,la);

	{for i:=1 to la do writeln(i,' ',f[i].num,' ',f[i].data,' ',f[i].sort);
	writeln('----------------');}

    ls:=1;tf[f[1].num,f[1].sort]:=ls;
	for i:=2 to la do
		begin
			if f[i].data<>f[i-1].data then inc(ls);
			tf[f[i].num,f[i].sort]:=ls;
		end;
	{for i:=1 to m do
		if rec[i]=1 then
			begin
    	        x:=tf[i,1];y:=tf[i,2];z:=add[i];
				writeln('1 ',x,' ',y,' ',z);
        	end
		else
			begin
				x:=tf[i,3];
				writeln('2 ',x);
			end;}
	fillchar(t,sizeof(t),0);
	for i:=1 to m do
		if rec[i]=1 then
	        begin
				x:=tf[i,1];y:=tf[i,2];z:=add[i];
				//writeln('gai ',x,'--',y,' ',z);
				gai(1,ls,x,y,z,1);
	        end
		else
			begin
				x:=tf[i,3];
				//writeln('ask ',x);
				writeln(ask(1,ls,x,1));
            end;
	//close(output);
end.

