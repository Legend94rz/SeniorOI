program ty1171;
var
	n,i:longint;
	ans:int64;
	a:array[1..80]of longint=(0,1,2,4,6,10,14,21,29,41,55,76,100,134,175,230,296,
384,489,626,791,1001,1254,1574,1957,2435,3009,3717,4564,5603,6841,8348,10142,
12309,14882,17976,21636,26014,31184,37337,44582,53173,63260,75174,89133,105557,
124753,147272,173524,204225,239942,281588,329930,386154,451275,526822,614153,
715219,831819,966466,1121504,1300155,1505498,1741629,2012557,2323519,2679688,
3087734,3554344,4087967,4697204,5392782,6185688,7089499,8118263,9289090,
10619862,12132163,13848649,15796475);
procedure dfs(I,last,curs:longint);
var
	k:longint;
begin
	if curs<=0 then exit;
	for K:=last to curs do
		begin
			if (i=1)and(k>n div 2) then exit;
			a[i]:=k;
			if curs-k=0 then
				inc(ans);
			dfs(i+1,k,curs-k);
		end;
end;
begin
	//assign(output,'test.txt');rewrite(output);
	readln(n);
	{write('a:array[1..80]of longint=(');
	for n:=1 to 80 do
		begin
		ans:=0;
		dfs(1,1,n);
		write(ans,',');
		end;
	writeln(');');}
	writeln(a[n]);
	//close(output);
end.
