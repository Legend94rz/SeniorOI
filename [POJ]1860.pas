type
  	edge=record
      r,c:double;
      end;
var
  s,i,j,n,m,st,ed:longint;
  val:double;
  e:array[0..1000,0..1000]of edge;
  v:array[0..1000]of longint;
  b:array[0..10000,0..1000]of longint;
  r1,c1,r2,c2:double;
function spfa:boolean;
var
   i,j,k:Longint;
   q:array[0..100000]of longint;
   vis:array[0..300]of boolean;
   l,r:longint;
   d:array[0..300]of double;
begin
	 l:=0;r:=1;
     q[r]:=s;
     fillchar(vis,sizeof(vis),0);vis[s]:=true;
     fillchar(d,sizeof(d),0);d[s]:=val;
     repeat
	 	   inc(l);
           k:=q[l];
           for i:=1 to v[k] do
               if (d[k]-e[k,b[k,i]].c)*e[k,b[k,i]].r>d[b[k,i]] then
               	  begin
				  	   d[b[k,i]]:=(d[k]-e[k,b[k,i]].c)*e[k,b[k,i]].r;
                       if not vis[b[k,i]] then
                       	  begin
						  	   inc(r);
                               q[r]:=b[k,i];
                               vis[b[k,i]]:=true;
                          end;
                       if b[k,i]=s then
                          exit(true);
                  end;
		   vis[k]:=false;
     until l>=r;
     exit(false);
end;
begin
	 readln(n,m,s,val);
	 for i:=1 to m do
	 	 begin
	      readln(st,ed,r1,c1,r2,c2);
		  inc(v[st]);
          b[st,v[st]]:=ed;
          e[st,ed].c:=c1;e[st,ed].r:=r1;
          inc(v[ed]);
          b[ed,v[ed]]:=st;
          e[ed,st].c:=c2;e[ed,st].r:=r2;
         end;
     if spfa then
     	writelN('YES')
     else
       writeln('NO');
end.
