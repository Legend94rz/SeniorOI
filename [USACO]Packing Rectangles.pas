{
ID:rz109291
PROG:packrec
LANG:PASCAL
}
type
	node=record
		c,k,num:longint;
		end;
var
	a:array[0..5,0..2]of longint;
	i,j,tail:longint;
	s1,s2,s3,s4,d1,d2,d3,d4:longint;
	vis:array[0..5]of boolean;
	b:array[0..5]of longint;//实际用0..4，表示第i个矩形是给出的矩形的第几个
	q:array[0..5000]of node;
	min:longint;
function max(a,b,c,d:longint):longint;
begin
	max:=0;
	if a>max then max:=a;
	if b>max then max:=b;
	if c>max then max:=c;
	if d>max then max:=d;
end;
function ok(a,b:longint):boolean;
var
	i:longint;
begin
	for i:=1 to tail do
		if (q[i].c=a) and(q[i].k=b) then
			exit(false);
	exit(true);
end;
procedure judge(s,a,c:longint);
var
	t:longint;
begin
	if a>c then
		begin
		t:=a;a:=c;c:=t;
		end;
	if s<min then begin
			min:=s;
			tail:=1;
			q[tail].c:=a;
			q[tail].k:=c;
		end
	else
		if (s=min)and(ok(a,c)) then begin
			inc(tail);
			q[tail].c:=a;
			q[tail].k:=c;
		end;
	//writeln(s,' ',a,' ',c);
end;
procedure cal;{大矩形横为长,竖为宽}
var
	w1,w2,w3,w4,h1,h2,h3,h4,w,h:longint;
begin
	//---------No.1----------
	w1:=a[b[1],d1];
	w2:=a[b[2],d2];
	w3:=a[b[3],d3];
	w4:=a[b[4],d4];
	h1:=a[b[1],3-d1];
	h2:=a[b[2],3-d2];
	h3:=a[b[3],3-d3];
	h4:=a[b[4],3-d4];
	h:=max(h1,h2,h3,h4);//纵向长
	w:=w1+w2+w3+w4;//横向长
	judge(h*w,h,w);
	//writeln(h*w,h,w);
	//---------No.2----------
	w:=max(w1+w2+w3,w4,0,0);
	h:=max(h1,h2,h3,0)+h4;
	judge(h*w,h,w);
	//---------No.3----------
	w:=max(w1+w2,w3,0,0)+w4;
	h:=max(h1+h3,h2+h3,h4,0);
	judge(h*w,h,w);
	//---------No.4/5----------
	w:=max(w2,w3,0,0)+w1+w4;
	h:=max(h1,h2+h3,h4,0);
	judge(h*w,h,w);
	//---------No.6----------
	h:=max(h1+h3,h2+h4,0,0);
	if h4>=h1+h3 then w:=max(w2,w1+w4,w3+w4,0);
	if h3>=h2+h4 then w:=max(w1,w2+w3,w4+w3,0);
	if (h3>h4) and (h3<h4+h2) then w:=max(w1+w2,w2+w3,w3+w4,0);
	if (h4>h3) and (h4<h3+h1) then w:=max(w1+w2,w1+w4,w3+w4,0);
	if (h3=h4) then w:=max(w3+w4,w1+w2,0,0);
	judge(h*w,h,w);
end;
procedure dfs(i:longint);
var
	k,j:longint;
begin
	if i>4 then exit;
	for k:=1 to 4 do
		if not vis[k] then
			begin
				b[i]:=k;
				vis[k]:=true;
				if i=4 then
					for d1:=1 to 2 do
						for d2:=1 to 2 do
							for d3:=1 to 2 do
								for d4:=1 to 2 do
									cal;
				dfs(i+1);
				vis[k]:=false;
			end;
end;
procedure qsort(s,t:longint);
var
	i,j,k,y:longint;
begin
        i:=s;j:=t;k:=q[random(t-s+1)+s].c;
	repeat
		while (q[j].c>k)AND(j>i) do dec(j);
		while (q[i].c<k)AND(j>i) do inc(i);
		if i<=j then
			begin
			y:=q[j].c; q[j].c:=q[i].c; q[i].c:=y;
			y:=q[j].k; q[j].k:=q[i].k; q[i].k:=y;
			inc(i);dec(j);
			end;
	until i>=j;
	if (i<t)then qsort(i,t);
	if (s<j)then qsort(s,j);
end;
begin
	assign(input,'packrec.in');reset(input);
	assign(output,'packrec.out');rewrite(output);
	min:=$3f3f3f3f;
	fillchar(vis,sizeof(vis),0);
	for i:=1 to 4 do
		readln(a[i,1],a[i,2]);
	dfs(1);
	randomize;
	qsort(1,tail);
	writeln(min);
	for i:=1 to tail do
		writeln(q[i].c,' ',q[i].k);
	close(input);close(output);
end.
