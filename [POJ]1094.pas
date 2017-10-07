var
	ii,j,tmp,n,m,cur:longint;
	s:string;
	ind,otd:array['A'..'Z']of longint;
	b:array['A'..'Z',0..100]of char;
	f:array['A'..'Z']of boolean;
	q:ARRAY[0..300]of char;
	l,r:longint;
function topsort:byte;
var
	i,k:char;
	j:byte;
	tind:array['A'..'Z']of longint;
	CT:byte;//队列里已被声明的变量有几个
	cnt,uc:boolean;//最后一次排序时记录入度为零的点在每次扩展时是否只有一个
begin
	l:=0;r:=0;
	tind:=ind;
	uc:=false;ct:=0;
	//write(cur,' ind is zero:');
	for i:='A' to chr(ord('A')+n-1) do
		if (tind[i])=0 then
		begin
			inc(r);
			q[r]:=i;
			if f[i] then inc(ct);
			//write(i,' ');
		end;
	//writelN;
	if ct=0 then exit(1);//有环
	if ct>1 then uc:=true;
	repeat
		inc(l);
		k:=q[l];cnt:=false;
		for j:=1 to otd[k] do
			begin
				dec(tind[b[k,j]]);
				if tind[b[k,j]]=0 then
					begin
						inc(r);
						q[r]:=b[k,j];
						//if (ii=m) then
							if not cnt then cnt:=true
								else uc:=true;
					end;
			end;
	until l>=r;
	//writeln('r=',r);
	if r<cur then exit(1);//有环
	for j:=1 to r do
		if not f[q[j]] then
			exit(3);//不确定
	if uc then exit(3);
	if (r=n) then exit(2);//完成
end;
begin
	//assign(output,'test.txt');rewrite(output);
	while not eof do
		begin
			readln(n,m);
			IF (N=M)and(m=0) then begin close(output);halt;end;
			fillchar(b,sizeof(b),0);
			fillchar(ind,sizeof(ind),0);fillchar(otd,sizeof(otd),0);
			fillchar(f,sizeof(f),0);cur:=0;
			for ii:=1 to m do
				begin
					readln(s);
					inc(ind[s[3]]);//入度
					inc(otd[s[1]]);//出度
					b[s[1],otd[s[1]]]:=s[3];
					if not f[s[1]] then begin inc(cur);f[s[1]]:=true;end;
					if not f[s[3]] then begin inc(cur);f[s[3]]:=true;end;
					tmp:=topsort;
					//writeln('tmp=',tmp);
					if (tmp<>3)or(tmp=3)and(ii=m) then
						break;
				end;
			case tmp of
				1:begin writeln('Inconsistency found after ',ii,' relations.');
						end;//有环
				2:begin write('Sorted sequence determined after ',ii,' relations: ');
						for j:=1 to n do
							write(q[j]);
						writeln('.');
						end;//完成
				3:begin writeln('Sorted sequence cannot be determined.');
						end;//不确定
			end;
			for j:=1 to m-ii do
				readln(s);
		end;
        close(output);
end.
{
Sorted sequence determined after 4 relations: ABCD.//完成
Inconsistency found after 2 relations.//有环
Sorted sequence cannot be determined.//不确定
}
