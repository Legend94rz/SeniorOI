{
ID:rz109291
PROG:namenum
LANG:PASCAL
}
const
	d:array['A'..'Z']of -1..9=(2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,-1,7,7,8,8,8,9,9,9,-1);
var
	f:text;
	i,j,l:longint;
	find,fl:boolean;
	a:array[0..13]of longint;
	s:string;
begin
	assign(input,'namenum.in');assign(output,'namenum.out');reset(input);rewrite(output);
	assign(f,'dict.txt');reset(f);
	readln(s);l:=length(s);
	for i:=1 to l do
		a[i]:=ord(s[i])-ord('0');
	for i:=1 to 4617 do
		begin
		readln(f,s);
		if length(s)=l then
			begin
			find:=true;
                        for j:=1 to l do
				if d[s[j]]<>a[j] then begin find:=false;break;end;
			if find then begin writeln(s);fl:=true;end;
			end;
		end;
        if not fl then writeln('NONE');
	close(input);close(output);
end.
