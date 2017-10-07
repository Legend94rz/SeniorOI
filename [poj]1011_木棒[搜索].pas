var
	i,j,n,m,sum,Low:longint;
	stick:array[0..101]of longint;
	ans:longint;
	v:array[0..101]of boolean;
function dfs(now,index,cnt:longint):boolean;
var
	i:longint;
begin
	if cnt*ans=sum then exit(true);
	for I:=index to n do
		begin
			if  v[i] or(i>1)and(stick[i]=stick[i-1])and(not v[i-1]) then continue;//如果上一条木棍没有被用到，那在这个子问题里也不会被用到
			if now+Stick[i]=ans then
				begin
					v[i]:=true;
					if dfs(0,1,cnt+1) then exit(true);
					v[i]:=false;
					exit(false);//如果某条木棍在尝试作为某条木棒的第一条时失败，那以后永远不会被用到
				end
			else
				if now+Stick[i]<ans then
					begin
						v[i]:=true;
						if dfs(now+Stick[i],i+1,cnt) then exit(true);
						v[i]:=false;
						if now=0 then exit(false);//到这里还有没有exit(true),说明子问题无解，整个问题也不会有解
	                end;
		end;
	exit(false);
end;
procedure qsort(s,h:Longint);
var
	i,j,k,u:longint;
begin
	i:=s;j:=h;k:=Stick[(s+h)shr 1];
	repeat
		while Stick[j]<k do dec(j);
		while Stick[i]>k do inc(i);
		if i<=j then
			begin
				u:=Stick[i];Stick[i]:=Stick[j];Stick[j]:=u;
				inc(i);dec(j);
			end;
	until i>j;
	if (s<j) then qsort(s,j);
	if (i<h) then qsort(i,h);
end;
begin
	while true do Begin
		readln(n);Low:=maxlongint;sum:=0;
		if n=0 then break;
		For i:=1 to n do Begin read(Stick[i]);Sum:=sum+Stick[i];if Stick[i]<Low then Low:=stick[i];end;
		qsort(1,n);//从大到小排序可以加快组合速度，不能从小到大
		For ans:=Low to sum do//木棒的长度一定介于最长木棍与木棍总长之间
			if sum mod ans=0 then//木棒的长度一定是总长的约数
				begin
					fillchar(v,sizeof(v),0);
					if dfs(0,1,1) then
						begin
							writeln(ans);
							break;
						end;
				end;
	End;
end.

