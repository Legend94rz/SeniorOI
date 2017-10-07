const
	mi:array[0..8]of longint=(1,10,100,1000,10000,100000,1000000,10000000,100000000);
	target=123804765;
	fact:array[0..8]of longint=(1,1,2,6,24,120,720,5040,40320);
type node=record
		data,dep:longint;
	end;
var
	i,j,k:longint;
	x,newx,u,ha:longint;
	q:array[0..362881]of node;
	l,r:longint;
	b:array[0..362881]of boolean;
	temp:string;
function hash(key:longint):longint;
var
	i,j,n:longint;
	s:string;
begin
	hash:=0;
	str(key,s);
        for i:=1 to 8 do
		begin
			n:=0;
			for j:=i+1 to 9 do
				if (s[j]<s[i]) then
			inc(n);
			hash:=hash+n*fact[9-i];
		end;
end;
begin
	readln(x);
	l:=0;r:=1;
	q[r].data:=x;q[r].dep:=0;
	//writeln(hash(target));readlN;
	repeat
		inc(l);
		x:=q[l].data;
		str(x,temp);
		j:=pos('0',temp);
		if j=0 then j:=1;
		//writeln('j=',j);
		for i:=1 to 4 do
			begin
				if x=target then begin writeln(q[l].dep);halt;end;
				if (j mod 3=0)and(i=3)then continue;
				if (j mod 3=1)and(i=2)then continue;
				if (j>=7)and(i=4)then continue;
				if (j<=3)and(i=1)then continue;
				k:=j+2*i-5;
				u:=x div mi[9-k] mod 10;
				newx:=x-u*mi[9-k]+u*mi[9-j];
				ha:=hash(newx);
				//writeln(x,' ',ha,' ',l,' ',r);
				if not b[ha] then
					begin
						inc(r);
						q[r].data:=newx;
						q[r].dep:=q[l].dep+1;
						b[ha]:=true;
					end;
			end;
	until l>=r;
end.
