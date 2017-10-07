type
	a33=array[1..3,1..3]of 0..8;
	a4=array[1..4]of -1..1;
	node=record
		ch:a33;
		si,sj:1..3;
		f:byte;
		pnt,dep,next:byte;
		end;
const
	goal:a33=((1,2,3),(8,0,4),(7,6,5));
	start:a33=((2,8,3),(4,6,4),(7,0,5));
	di:a4=(0,-1,0,1);
	dj:a4=(1,0,-1,0);
var
	data:array[0..100]of node;
	r,k,ni,nj,head,tail,depth:integer;
function check(k:integer):boolean;
	begin
		ni:=temp.si+di[k];nj:+temp.sj+dj[k];
		if(nim in [1..3])and(nj in [1..3])then
			check:=true
		else
			check:=false;
	end;
function dupe:boolean;
var
	i,j,k:integer;
	