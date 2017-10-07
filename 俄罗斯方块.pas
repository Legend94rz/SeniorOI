var
	i,j,n,k:longint;
        ans:int64;
	a:array[-2..108]of longint;
function check(i,f:longint):boolean;
begin
	case k of
		1:case f of
			1:exit((a[i]=a[i+1])and(a[i+1]=a[i+2])and(a[i+2]=a[i+3]));
			2:exit(true);
			end;
		2:exit((a[i]=a[i+1])and(f=1));
		3:case f of
			1:exit((a[i]=a[i+1])and(a[i+1]-a[i+2]=-1));
			2:exit(a[i]-a[i-1]=-1);
			end;
		4:case f of
			1:exit((a[i]=a[i+1])and(a[i-1]-a[i]=1));
			2:exit((a[i]-a[i+1]=-1));
			end;
		5:case f of
			1:exit((a[i]=a[i+1])and(a[i]=a[i+2]));
			2:exit(a[i]-a[i+1]=-1);
			3:exit((a[i]-a[i-1]=-1)and(a[i]-a[i+1]=-1));
			4:exit(a[i]-a[i-1]=-1);
			end;
		6:case f of
			1:exit((a[i]=a[i+1])and(a[i]=a[i+2]));
			2:exit(a[i]=a[i+1]);
			3:exit((a[i+1]=a[i+2])and(a[i+1]-a[i]=1));
			4:exit(a[i]-a[i-1]=-2);
			end;
		7:case f of
			1:exit((a[i]=a[i+1])and(a[i]=a[i+2]));
			2:exit(a[i]=a[i+1]);
			3:exit((a[i-1]=a[i-2])and(a[i]-a[i-1]=-1));
			4:exit(a[i]-a[i+1]=-2);
			end;
		end;
	exit(false);
end;
begin
	assign(input,'game.in');reset(input);//assign(output,'game.out');rewrite(output);
	readln(n,k);
	fillchar(a,sizeof(a),$3f);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do
		for j:=1 to 4 do
			if check(i,j) then//检查从第i位开始的d[k,j,0]位能否放置第k个方块的第j种旋转
				begin
					inc(ans);
					//writeln('c ',k,' xz ',j,' start ',i);
				end;
	writeln(ans);
	close(input);close(output);
end.
