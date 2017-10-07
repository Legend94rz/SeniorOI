var
	a:array[0..9]of longint=(0,1,2,3,4,5,6,7,8,9);
	i,j,sed,ans:longint;
	vis:array[1..9]of boolean;
        bb:array[1..9] of longint;
function check:boolean;
var
	i:longint;
	e,f,g,r,t:longint;
	b:array[1..9]of boolean;
begin
	e:=0;f:=0;g:=0;
	fillchar(b,sizeof(b),0);
	for i:=1 to 9 do
		if bb[i]<>0 then
			e:=10*e+bb[i];
	f:=e*2;
	g:=e*3;
	//if (e=192)and(f=384)and(g=576) then readln;
	if (f>=1000)or (g>=1000)then
		exit(false);
        //write(e,' ',f,' ',g);
        t:=e;
        while t>=1 do
                begin
                        r:=t mod 10;
                        if r=0 then exit(false);
			if (b[r]) then
			        exit(false);
			b[r]:=true;
			t:=t div 10;
                end;
        t:=f;
        while t>=1 do
		begin
			r:=t mod 10;
                        if r=0 then exit(false);
			if (b[r]) then
			        exit(false);
			b[r]:=true;
			t:=t div 10;
		end;
        t:=g;
	while t>=1 do
		begin
			r:=t mod 10;
			if r=0 then exit(false);
			if (b[r]) then
			        exit(false);
			b[r]:=true;
			t:=t div 10;
		end;
        writeln(e,' ',f,' ',g);
	exit(true);
end;
procedure dfs(i:longint);
var
	k,j:longint;
        bol:boolean;
begin
	if (i>3) then exit;
	for k:=1 to 9 do
		if not vis[k] then
			begin
				vis[k]:=true;
				bb[i]:=k;
                                if (i=3) then
                                        //begin
                                        bol:=check;
                                        //writelN(bol);
                                        //if bol then inc(ans);
                                        //end;
                                {begin
					for j:=1 to 9 do
						write(b[j]);
					writeln;
				end;}
				dfs(i+1);
				vis[k]:=false;
			end;
end;
begin
	//assign(output,'test.txt');rewrite(output);
	fillchar(vis,sizeof(vis),0);
	dfs(1);
	//writeLN(ans);
	//close(output);
end.
