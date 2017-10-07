var
   i,j,n,m,y:longint;
   f:array[0..10000] of longint;
   life,high,time:array[0..1005]of longint;
   fd:boolean;
begin
     assign(input,'WELL.IN');reset(input);assign(output,'WELL.OUT');rewrite(output);
     readln(n,m);
     for i:=1 to m do
     	 readln(time[i],life[i],high[i]);
     f[0]:=10;
     for i:=1 to m-1 do
         for j:=i+1 to m do
	      if time[j]<time[i] then
              	 begin
		      y:=time[i];time[i]:=time[j];time[j]:=y;
                      y:=high[i];high[i]:=high[j];high[j]:=y;
                      y:=life[i];life[i]:=life[j];life[j]:=y;
                 end;
     for i:=1 to m do
     	 begin
         fd:=false;
     	 for j:=n downto 0 do
             if f[j]>=time[i] then
             	begin
                  if j+high[i]>=n then
                     begin
		     	  writeln(time[i]);
			  close(input);
                          close(output);
                          halt;
                     end;
		  if f[j]>f[j+high[i]] then
                     f[j+high[i]]:=f[j];
                  f[j]:=f[j]+life[i];
                  fd:=true;
                end;
         if not fd then break;
         end;
     writeln(f[0]);
     close(outPUT);
end.
