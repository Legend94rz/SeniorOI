type    numtp = array[ 1..9,1..9 ] of longint ;
        bootp = array[ 1..9,1..9,1..9 ] of boolean ;
const   w: array[ 1..9,1..9 ] of longint =                   ((6,6,6,6,6 , 6,6,6,6),
                                                              (6,7,7,7,7 , 7,7,7,6),
                                                              (6,7,8,8,8 , 8,8,7,6),
                                                              (6,7,8,9,9 , 9,8,7,6),
                                                              (6,7,8,9,10, 9,8,7,6),
                                                              (6,7,8,9,9 , 9,8,7,6),
                                                              (6,7,8,8,8 , 8,8,7,6),
                                                              (6,7,7,7,7 , 7,7,7,6),
                                                              (6,6,6,6,6 , 6,6,6,6));
 g                              : array[ 1..9,1..9 ] of longint = ((1,1,1,2,2,2,3,3,3),
                                                                   (1,1,1,2,2,2,3,3,3),
                                                                   (1,1,1,2,2,2,3,3,3),
                                                                   (4,4,4,5,5,5,6,6,6),
                                                                   (4,4,4,5,5,5,6,6,6),
                                                                   (4,4,4,5,5,5,6,6,6),
                                                                   (7,7,7,8,8,8,9,9,9),                                                                                                                                          
                                                                   (7,7,7,8,8,8,9,9,9),
                                                                   (7,7,7,8,8,8,9,9,9));
var     pos                     : numtp ;
        ins                     : bootp ;
        v                       : array[ 1..81 ] of boolean ;
        x , y                   : array[ 1..81 ] of longint ;
        sum , tot , ans         : longint ;
procedure prepare ;
var
	i , j , m , l , r       : longint ;
begin
        for i := 1 to 9 do
            for j := 1 to 9 do
                pos[ i , j ] := 9 ;     //此空可填数的数量；
        fillchar( ins,sizeof( ins ),true );
        sum := 0 ;
        tot := 0 ;
        for i := 1 to 9 do
        begin
            for j := 1 to 9 do
            begin
                read( m );
                if m = 0 then
                begin
					inc( sum );    //须填空数目
                    x[ sum ] := i ;    //记录每一个空的横纵坐标
                    y[ sum ] := j ;
                end else
                begin
                    inc( tot,m*w[ i , j ] );   //先预处理可得分数
                    pos[ i,j ] := 0 ;          //此空可填数的数量为0;
                    for l := 1 to 9 do
                        for r := 1 to 9 do
                            if pos[ l,r ] = 0 then continue else
                            if ins[ l,r,m ] and ( ( l=i ) or ( r=j ) or ( g[ l,r ] = g[ i,j ] ) ) then //判断是否可填m
                            begin
                                ins[ l,r,m ] := false ;  //此空不可填m
                                dec( pos[ l,r ] );//此空可填数的数量减1
							end;
                end;
            end;
            readln;
        end;
		fillchar( v , sizeof( v ) , false );
end;
procedure dfs( r , tot : longint ; pos : numtp ; ins : bootp );
var     i , j , m , mm          : longint ;
        pos1                    : numtp ;
        ins1                    : bootp ;
begin
        if r > sum then
        begin
            if tot > ans then ans := tot ;
            exit ;
        end;
        mm := 10 ; m := 0 ;
        for i := 1 to sum do    //遍历所有未填的空；
            if not v[ i ]{ and ( pos[ x[ i ],y[ i ] ] < mm )} then
            begin
                mm := pos[ x[ i ],y[ i ] ] ;
                m := i ;    //m为可填的数的数目最少的空在队列中的位置
            end;
		v[ m ] := true ;        //从可填数的数目最少的点开始填；
        for i := 1 to 9 do if ins[ x[ m ],y[ m ] , i ] then   //如果可填i
        begin
            pos1 := pos ; ins1 := ins ;
            for j := 1 to sum do if ( x[ j ]=x[ m ] ) or ( y[ j ]=y[ m ] ) or( g[ x[ j ],y[ j ] ]=g[ x[ m ],y[ m ] ] ) then
                if ( not v[ j ] ) and ins1[ x[ j ],y[ j ],i ] then
                begin
                    ins1[ x[ j ],y[ j ],i ] := false ;
                    dec( pos1[ x[ j ],y[ j ] ] );     //可填数目减1；
                end;
            dfs( r+1,tot+w[ x[ m ],y[ m ] ]*i,pos1,ins1 );
        end;
        v[ m ] := false ; //回溯，最小点设为未填
end;
begin
        rewrite(output);
        ans := -1 ;
        prepare ;
        dfs( 1,tot,pos,ins );
        writeln( ans );
end.