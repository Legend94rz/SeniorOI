type
	node=record
		da:longint;
		my:double;
		end;
var
	i,j,k,p:longint;
	n,m,cur:longint;
	v:array[0..10000]of longint;
	b:array[0..500,0..10000]of longint;
	e:array[0..500,0..500]of double;
	num:array[0..10000]of longint;
	s,s1,s2:string;
	rate:double;
	ch:char;
	f:boolean;
function hash(key:string):longint;
var
	i:longint;
begin
	exit(7*(ord(key[1])-ord('A'))+3*(ord(key[(1+length(key))shr 1])-ord('A'))+2*(ord(key[length(key)])-ord('A')));
	{hash:=0;
	for i:=1 to length(key) do
		hash:=i*(ord(s[i])-ord('A')+1)+hash;}
end;
function spfa(s:longint):boolean;
var
	//vis:array[0..5000]of longint;
	d:array[0..5000]of double;
	vis:array[0..5000]of boolean;
	q:array[0..100000]of node;
	l,r,k,i:Longint;
begin
	fillchar(vis,sizeof(vis),0);
	fillchar(d,sizeof(d),0);
	l:=0;r:=1;q[r].da:=s;q[r].my:=1;
	vis[s]:=true;d[s]:=1;
	repeat
		inc(l);
		k:=q[l].da;
		for i:=1 to v[k] do
			IF d[k]*e[k,b[k,i]]>d[b[k,i]] then
				begin
					d[b[k,i]]:=d[k]*e[k,b[k,i]];
					if not vis[b[k,i]] then
						begin
							inc(r);
							q[r].da:=b[k,i];
							vis[b[k,i]]:=true;						
						end;
					if b[k,i]=s then
						//begin
							//writeln('head=',k,'val=',d[k]:0:3,'to:',b[k,i],'will get more,this e w=:',e[k,b[k,i]]:0:3,'after:',d[k]*e[k,b[k,i]]:0:3);
							exit(true);
						//end;
				end;
		vis[k]:=false;
	until l>=r;
	exit(false);
end;
begin
	while true do
		begin
			readln(n);
			inc(cur);
			fillchar(e,sizeof(e),0);fillchar(v,sizeof(v),0);fillchar(b,sizeof(b),0);
			if n=0 then break;
			for i:=1 to n do
				begin
					readln(s);
					k:=hash(s);
					num[k]:=i;
					//writeln('hsh=',k);
				end;
			readln(m);
			for i:=1 to m do
				begin
					s1:='';s2:='';ch:='*';
					while ch<>' ' do
						begin
							read(ch);
							s1:=s1+ch;
						end;
					delete(s1,length(s1),1);
					read(rate);readln(s2);delete(s2,1,1);
					k:=hash(s1);p:=hash(s2);
					//writeln('*',s2,'*',p);
					if rate>e[num[k],num[p]] then begin
						inc(v[num[k]]);b[num[k],v[num[k]]]:=num[p];
						e[num[k],num[p]]:=rate;
					end;
				end;
			{for i:=1 to n do
				for j:=1 to v[i] do
					writelN(i,' ',b[i,j],' ',e[i,b[i,j]]:0:3);}
			f:=false;
			for i:=1 to n do
				if v[i]>0 then
					if spfa(i) then
						begin
							writeln('Case ',cur,': Yes');
							f:=true;
							break;
						end;
			if not f then
				writelN('Case ',cur,': No');
		end;
end.
