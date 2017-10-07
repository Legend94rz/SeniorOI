type
	node=record
		x,y:longint;
		co:boolean;
		end;
var
	i,j,m,n,z:longint;
	tot:longint;//有几幅图
	k:longint;//图像编号
	ch:array[-200..200,-256..256]of char;
	s:string;
	q:array[0..50,0..50]of node;//记录每幅图第一次出现的 #
	u:array[0..50,0..2000]of node;//所有属于图像i的像素
	ta:array[0..2000]of longint;
	b:boolean;//首次遇见的标志
	tx:longint;
function judge(j:longint):longint;
var
	i:longint;
begin
        for i:=1 to n do
		//if (ch[i,j]<>'.')and((ch[i,j]<>'0')or(ch[i,j-2]<>' '))and(ch[i,j]<>' ')or (ch[i,j-1]='#')and (ch[i,j+1]='#') then
                if (ch[i,j]<>'*'){and(ch[i,j]<>'.')} then
                	exit(1);
	exit(0);
end;
function can(k:longint):boolean;
var
	i,x,y:longint;
begin
	for i:=1 to n do
		if q[k,i].y<>0 then
			begin
				x:=q[k,i].x;
				y:=q[k,i].y;
				if (ch[x,y-1]='#')or(ch[x,y-2]='#')or(ch[x,y-1]='0')or(ch[x,y-2]='0') then
					exit(false);
			end;
	exit(true);
end;
procedure move(k:longint);
var
	i,x,y:longint;
begin
	for i:=1 to ta[k] do
		begin
			x:=u[k,i].x;
			y:=u[k,i].y;
			ch[x,y-1]:=ch[x,y];
			ch[x,y]:='*';
			u[k,i].y:=y-1;
			if u[k,i].co then
				q[k,x].y:=y-1;
		end;
end;
function ok(i,j:longint):boolean;
var
        k,o:LONGINT;
begin
        //write(i,' ',j,'     ');
        for o:=1 to n do
         for k:=j to j+50 do
                if ch[o,k]='#' then
                        exit(true);
        exit(false);

end;
procedure dfs(k:longint);
var
	bol:boolean;
begin
	if k>tot then exit;
	if can(k) then begin move(k);dfs(k);end
	else
		dfs(k+1);
end;
begin
	readln(n);
	fillchar(ch,sizeof(ch),'*');
	for I:=1 to n do
	begin
		readln(s);
		K:=1;
		m:=length(s);
		b:=false;
		for j:=1 to m do
			begin
				ch[i,j]:=s[j];

                                if (ch[i,j]='#')or(ch[i,j]='0') then
					begin
						inc(ta[k]);
						u[k,ta[k]].y:=j;
						u[k,ta[k]].x:=i;
						if not b then begin
							q[k,i].x:=i;
							q[k,i].y:=j;
							u[k,ta[k]].co:=true;
							b:=true;
						end;
					end;
				if ch[i,j]=' ' then
					begin
						inc(k);
						b:=false;
					end;
                                if ch[i,j]=' '  then ch[i,j]:='.';
                        end;
                b:=false;
	end;
	tot:=k;writeln(tot);
	dfs(2);//b:=false;
	for i:=1 to n do
	begin
                b:=false;
                for j:=-250 to 250 do
			begin
                                {if not b then
                                   tx:=j;}
                                if (judge(j)=1) then begin
					//if (ch[i,j]='0'){and(b)}and(ok(i,j)) then begin write('.');continue;end;
                                        if (ch[i,j]<>'*')and(ch[i,j]<>'0')and(ch[i,j]<>'.') then
                                                begin
						        write(ch[i,j]);
                                                        b:=true;
                                                end
					else
                                                if {(b)and}(ok(i,j)) then
                                                        write('.');
				end;
			end;
		writeln;
		end;
        {for i:=1 to n do
                begin
                for j:=1 to m do
                        write(ch[i,j]);
                writeln;
                end; }
end.
