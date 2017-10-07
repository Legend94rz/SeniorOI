program ty1077;
var
	p,i,j,n,g:longint;
	min,mid,max:longint;
	t:extended;
	ans:array[1..2,1..2]of longint;
	x1,x2:longint;
	y:array[1..2]of longint;
function gcd(a,b:longint):longint;
var
	t:longint;
begin
	if (a=0)then exit(b);
	if (b=0) then exit(a);
	if a<b then begin t:=a;a:=b;b:=t;end;
	exit(gcd(b,a mod b));
end;
function maxx(a,b:longint):longint;
begin
	if a>b then exit(a);
	exit(b);
End;

procedure updata(fz,fm:longint);
var
	t1,t2:extended;
begin
	if (fz>n)or(fm>n) then exit;
	t1:=t-ans[1,1]/ans[1,2];t2:=ans[2,1]/ans[2,2]-t;
	if (t-fz/fm<t1)and(t-fz/fm>=0) then
		begin
			//writeln('No.1 will be replaced by ',fz,'/',fm,' ,about ',fz/fm:0:3,',piancha is ',abs(fz/fm-t):0:3,' history is ',ans[1,1],'/',ans[1,2],',piancha is ',t1:0:3);
			//ans[2]:=ans[1];
			ans[1,1]:=fz;
			ans[1,2]:=fm;
		end;
	if (fz/fm-t>=0)and(fz/fm-t<t2) then
		begin
			//writeln('No.2 will be replaced by ',fz,'/',fm,' ,about ',fz/fm:0:3,',piancha is ',abs(fz/fm-t):0:3,' history is ',ans[2,1],'/',ans[2,2],',piancha is ',t2:0:3);
			ans[2,1]:=fz;
			ans[2,2]:=fm;
		end;
end;
begin
	//assign(output,'test.txt');rewrite(output);
	readln(p,n);
	ans[1,1]:=-1;ans[1,2]:=1;ans[2,1]:=10000;ans[2,2]:=1;
	if p=0 then
		begin
			writeln(0,'/',n,' ',1,'/',n);
			halt;
		end;
	if p=1 then
		begin
			writeln(n-1,'/',n,' ',n,'/',n-1);
			halt;
		end;
	t:=sqrt(p);//writeln(t:0:4);
	for i:=1 to maxx(p,n) do
		begin
			min:=1;max:=n;
			repeat
				mid:=(min+max)shr 1;
				if mid/i < t  then
					min:=mid+1
				else
					max:=mid-1;
			until max<min;
			x2:=i;
			g:=gcd(min-1,i);x1:=(min-1)div g;j:=x2 div g;updata(x1,j);//write(x1,'/',j,' ');
			g:=gcd(min,i);x1:=min div g;j:=x2 div g;updata(x1,j);//writeln(x1,'/',j);
		end;
	{if ans[1,1]/ans[1,2]>ans[2,1]/ans[2,2] then
		begin
			y:=ans[1];ans[1]:=ans[2];ans[2]:=y;
		end;}
	writeln(ans[1,1],'/',ans[1,2],' ',ans[2,1],'/',ans[2,2]);
	//writeln(gcd(n,p));
	//close(output);
end.

