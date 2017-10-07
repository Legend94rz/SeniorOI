type
	tree=record
		col,yan:longint;
		end;
var
	{l,r,ls,rs,}n:array[-1000..400001]of longint;
	tmp,m,t,z,tt,k,i,x,y,ans:Longint;
	H:array[-1000..300]of boolean;
	cH:char;
	f:array[-1000..400001]of tree;
procedure build(l,r,p:longint);
var
	k:longint;
begin
	fillDword(f,sizeof(f)shr 2,1);//writeln(f[1].col,' ',f[0].col);
end;
procedure gai(a,b,l,r,c,p:Longint);
var
	k:longint;
begin
	//if l>r then exit;
	if (a=l)and(b=r) then begin f[p].col:=c;exit;end;
	if f[p].col>0 then
		begin
			f[p shl 1].col:=f[p].col;
			f[p shl 1+1].col:=f[p].col;
			f[p].col:=-1;
		end;
	k:=(a+b) shr 1;
	if (r<=k) then begin gai(a,k,l,r,c,p shl 1);exit;end;
	if (l>k) then begin gai(k+1,b,l,r,c,p shl 1+1);exit;end;
	gai(a,k,l,k,c,p shl 1);gai(k+1,b,k+1,r,c,p shl 1+1);
end;
function ask(a,b,x,p:longint):longint;//单点询问
var
	k:longint;
begin
	if (f[p].col>0) then exit(f[p].col);
	k:=(a+b) shr 1;
	if (x<=k) then exit(ask(a,k,x,p shl 1));
	if (x>k) then exit(ask(k+1,b,x,p shl 1+1));
end;
procedure count(a,b,l,r,p:longint);
var
	k:Longint;
begin
	if (b>m)or(r>m) then exit;
	if (a<=l)and(b>=r)and(f[p].col>0) then begin h[f[p].col]:=true;exit;end;
	k:=(a+b) shr 1;
	if r<=k then begin count(a,k,l,r,p shl 1);exit;end;
	if l>k then begin count(k+1,b,l,r,p shl 1+1);exit;end;
	count(a,k,l,k,p shl 1);count(k+1,b,k+1,r,p shl 1+1);
end;
begin
	readln(m,t,k);
	build(1,m,1);
	while k>0 do
		begin
			dec(k);
			read(ch);
			if ch='C' then
				begin
					readln(x,y,z);if x>y then begin tmp:=x;x:=y;y:=tmp;end;
					gai(1,m,x,y,z,1);
				end
			else
				begin
					readln(x,y);if x>y then begin tmp:=x;x:=y;y:=tmp;end;
					fillchar(h,sizeof(h),0);
					count(1,m,x,y,1);
					ans:=0;
					for i:=1 to t do if (h[i]) then inc(ans);
					writeln(ans);
				end;
//			for i:=1 to m do write(ask(1,m,i,1),' ');writeln;
		end;
end.

