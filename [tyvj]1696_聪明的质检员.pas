program qc;
var
	j,i,n,m:longint;
	s,t,k:int64;
	w,v,count:array[0..200001]of longint;
	l,r,mid:int64;
	z,y:array[0..200001]of longint;
	vv:array[0..200001]of int64;
function check(k:longint):int64;
var
	i,j:longint;
	res:int64;
begin
	fillchar(count,sizeof(count),0);
    fillchar(vv,sizeof(vv),0);
	res:=0;
	for i:=1 to n do
		if w[i]>=k then
			begin
				count[i]:=count[i-1]+1;
				vv[i]:=vv[i-1]+v[i];
			end
		else
			begin
				count[i]:=count[i-1];
				vv[i]:=vv[i-1];
			end;
	for i:=1 to m do
		begin
			res:=res+(count[y[i]]-count[z[i]-1])*(vv[y[i]]-vv[z[i]-1]);
			if res>2*s then exit(s+1);
		end;
	exit(res);
end;
begin
	readln(n,m,s);
	for i:=1 to n do readln(w[i],v[i]);
	for i:=1 to m do readln(z[i],y[i]);
	l:=0;r:=3*s;
	repeat
			mid:=(l+r)shr 1;
			t:=check(mid);
			//writeln(t,' ',mid);
			if t<s then
				r:=mid
			else
				if t>s then
					l:=mid
				else
					begin
						writeln(0);
						halt;
                    end;
	until r-l<=1;
	//writeln('res: ',l,' ',mid,' ',r);
	t:=1 shl 62;
    k:=abs(check(l)-s);
	if k<t then t:=k;
	k:=abs(check(mid)-s);
	if k<t then t:=k;
	k:=abs(check(r)-s);
	if k<t then t:=k;
	writeln(t);
end.

