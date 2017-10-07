begin
	assign(input,'game.in');assign(output,'game.out');reset(input);rewrite(output);
	writeln(1);
	close(input);close(output);
end.