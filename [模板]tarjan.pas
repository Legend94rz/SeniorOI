procedure dfs(s:int);
var
	ne:int;
begin
	v[s]:=1;                  //v[i]表示点i的访问状态.未访问,正访问,已访问的点,值分别为0,1,2
	inc(top); stack[top]:=s;     //当前点入栈
	inc(time); rea[s]:=time; low[s]:=time;  //记录访问该点的真实时间rea和最早时间low
	ne:=head[s];
	while ne<>0 do begin
		if v[e[ne]]=0 then dfs(e[ne]);     //如果扩展出的点未被访问,继续扩展
		if v[e[ne]]=1 then low[s]:=min(low[s],low[e[ne]]);
		//如果扩展出的不是已访问的点,更新访问源点s的最早时间.容易理解,如果一个点能到达现在正访问的点,那么路径中存在一个环使它能更早被访问
		ne:=next[ne];
	end;
	if rea[s]=low[s] then begin             //如果s的最早访问时间等于其实际访问时间,则可把其视作回路的"始点"
		inc(tot);                             //连通块编号
		while stack[top+1]<>s do begin        //将由s直接或间接扩展出的点标记为同一连通块,标记访问后出栈
			lab[stack[top]]:=tot;               //lab[i]表示点i所属的连通块
			v[stack[top]]:=2;
			dec(top);
			end;
		end;
end;

