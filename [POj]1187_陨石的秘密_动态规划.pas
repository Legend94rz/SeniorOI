const
	p=11380;
var
	i,j,k,l,ll,kk,jj,ii:longint;
	l1,l2,l3,d,t:longint;
	f:array[-1..31,-1..11,-1..11,-1..11]of longint;
begin
	readln(l1,l2,l3,d);
	for i:=0 to d do f[i,0,0,0]:=1;
	for i:=1 to d do
		for j:=0 to l1 do
			for k:=0 to l2 do
				for l:=0 to l3 do
					begin
						if (j=0)and(k=0)and(l=0) then continue;
						t:=0;
						for ll:=0 to l-1 do
							t:=(t+(f[i-1,0,0,ll]*f[i,j,k,l-ll-1])mod p)mod p;
						for kk:=0 to k-1 do
							for ll:=0 to l do
								t:=(t+(f[i-1,0,kk,ll]*f[i,j,k-kk-1,l-ll])mod p)mod p;
						for jj:=0 to j-1 do
							for kk:=0 to k do
								for ll:=0 to l do
									t:=(t+(f[i-1,jj,kk,ll]*f[i,j-jj-1,k-kk,l-ll])mod p)mod p;
						f[i,j,k,l]:=t;
                    end;
	writeln((f[d,l1,l2,l3]-f[d-1,l1,l2,l3]+p)mod p);
end.

