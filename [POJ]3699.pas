type
	int=longint;
	str=string;
var
	s:                             string;
	i,j,m,n,k,p,q,l,loc,blk:      longint;
	num: array[0..255556]      of longint;
	yu:  array [1..10,0..2]    of string ;
	rec: array[1..10000,0..10] of string ;
	ask: array[1..100,0..10000]of string ;
	na:  array [1..100]        of longint;
	req: array[1..100,1..3]    of string ;
	rowl:array[1..50]          of longint;
	bol: array[1..10000]       of boolean;
function hash(str:string):longint;
var
	i,sum:longint;
begin
	sum:=0;
	for i:=1 to length(str) do
		sum:=sum+( abs( ord(str[i])-ord('A') )*i );
	exit(sum);
end;
function can(k,j:longint):boolean;//在第k个询问中，第j个人是否符合
var
	temp:longint;
	t1,t2:string;
	w,y,code:longint;
begin
	t1:=req[k,1];t2:=req[k,3];//域名、条件
	temp:=hash(t1);
	if req[k,2]='='then
		begin
			if rec[j,num[temp]]=t2 then
				begin
					bol[j]:=true;
					exit(true);
				end;
		end
	else
	begin
		val(rec[j,num[temp]],w,code);
		val(t2,y,code);
		if (req[k,2]='>')and(w>y)then
			begin
				bol[j]:=true;
				exit(true);
			end
			else
				if (w<y)and(req[k,2]='<') then
					begin
						bol[j]:=true;
						exit(true);
					end;
	end;
	exit(false);
end;
function get(I:longint):longint;//返回第i个询问的最大长度
var
	g,h,temp,sm:longint;
	max:array[1..50]of longint;
begin
	sm:=0;fillchar(max,sizeof(max),0);fillchar(rowl,sizeof(rowl),0);
	for h:=1 to na[i] do//枚举h个询问域
		begin
			max[h]:=length(ask[i,h]);
			for g:=1 to n do//枚举n个人
				if can(i,g)then
				begin
					temp:=hash(ask[i,h]);
					if length(rec[g,num[temp]])>max[h] then
						max[h]:=length(rec[g,num[temp]]);
				end;
			max[h]:=max[h]+2;
			rowl[h]:=max[h];
			sm:=sm+max[h];
		end;
	exit(sm+na[i]-1);
end;
begin
	readln(m,n,k);
	//===================Stage 1===========================
	for i:=1 to m do
		begin
			readln(yu[i,0]);
			loc:=pos(' ',yu[i,0]);
			yu[i,1]:=copy(yu[i,0],1,loc-1);
			num[ hash(yu[i,1]) ]:=i;          //处理域名编号
			yu[i,2]:=copy(yu[i,0],loc+1,length(yu[i,0])-loc);
		end;
	//===================Stage 2===========================
	for i:=1 to n do
		begin
		readln(rec[i,0]);p:=1;q:=1;
		for j:=1 to length(rec[i,0]) do
			if rec[i,0,j]=' ' then
				begin
					rec[i,q]:=copy(rec[i,0],p,j-p);//i个人的第q个域的值
					p:=j+1;
					inc(q);
				end;
		rec[i,q]:=copy(rec[i,0],p,length(rec[i,0])-p+1);//对串尾的处理
		end;
	//===================Stage 3===========================
	for i:=1 to k do
		begin
		readln(ask[i,0]);delete(ask[i,0],1,7);p:=1;q:=1;
		for j:=1 to length(ask[i,0]) do
			if(ask[i,0,j])='"'then delete(ask[i,0],j,1);
		for j:=1 to pos('where',ask[i,0]) do
			if ask[i,0,j]=',' then
				begin
					ask[i,q]:=copy(ask[i,0],p,j-p);//第i个询问的第q个询问域的名称
					p:=j+1;
					inc(q);
				end;
		ask[i,q]:=copy(ask[i,0],p,j-1-p);p:=pos('where',ask[i,0])+6;na[i]:=q;//对串尾的处理
		for j:=p to length(ask[i,0])do
			if ask[i,0,j]in ['>','<','=']then
				begin
					req[i,1]:=copy(ask[i,0],p,j-p);                 //记录第i个询问的域名
					req[i,2]:=copy(ask[i,0],j,1);                   //记录第i个询问的表达符号
					req[i,3]:=copy(ask[i,0],j+1,length(ask[i,0])-j);//记录第i个询问的条件
				end;
		end;
	//=====================================================
	for i:=1 to k do      //处理第i个询问
		begin
			//----第一行-------
			write('+');
			l:=get(i);
			for j:=1 to l do
				write('-');
			writeln('+');
			//------------------

			//------第二行----------
			for j:=1 to na[i]do
				begin
					write('|');
					for blk:=1 to (rowl[j]-length( ask[i,j] )   )div 2 do
						write(' ');
					write(ask[i,j]);
					for blk:=1 to (rowl[j]-length( ask[i,j] )   )div 2 do
						write(' ');
					if (rowl[j]-length( ask[i,j] )   )mod 2<>0 then
						write(' ');
				end;
			writeln('|');
			//---------------------

			//---------第三行------
			write('|');q:=0;loc:=1;
			for j:=1 to l do
				begin
				inc(q);
				if (q<>rowl[loc]+1)and(loc<>na[i])then
					write('-')
				else
					if (loc<>na[i])then
						begin
							write('|');
							inc(loc);
							q:=0;
						end
					else
						write('-');
                                end;
			writeln('|');//行结束
			//----------------------
			for j:=1 to n do    //scan
				if bol[j] then  //第j 个人符合条件
					begin
						for q:=1 to na[i] do
							begin
								write('|');
								s:=rec[j,num[ hash(ask[i,q]) ] ] ;
								for blk:=1 to (rowl[q]-length(s))div 2 do
									write(' ') ;
								write(s);
								for blk:=1 to (rowl[q]-length(s))div 2 do
									write(' ');
								if (rowl[q]-length(s))mod 2 <> 0 then write(' ');
							end;
						writeln('|');
					end;
			//-------------最后一行-----------------
			write('+');
			for j:=1 to l do
				write('-');
			writeln('+');
			//-------------------------------------
			if i<>k then
				begin
					writeln;
					fillchar(bol,sizeof(bol),0);
				end;
		end;
end.
