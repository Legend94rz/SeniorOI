{
ID:rz109291
PROG:palsquare
LANG:PASCAL
}
const
	p:array[0..20]of char=('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K');
var
	i,j,n,b:longint;
	si,y:string;
function ok(i:longint):boolean;
var
	r:string;
	j,t:longint;
begin
	t:=i*i;str(t,si);//writeln(t);
	r:='';
	while t>=1 do
		begin
			r:=p[t mod b]+r;
			t:=t div b;
		end;
	//writeln(r);

	for j:=1 to length(r)div 2 do
		if r[j]<>r[length(r)-j+1] then exit(false);
	si:=r;r:='';
	while i>=1 do
		begin
			r:=p[i mod b]+r;
			i:=i div b;
		end;
	y:=r;
	exit(true);
end;
begin
	assign(input,'palsquare.in');assign(output,'palsquare.out');reset(input);rewrite(output);
	readln(b);
	for i:=1 to 300 do
		if ok(i) then writeln(y,' ',si);
	close(input);close(output);
end.
