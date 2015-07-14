my $accumulator;

die "Only one command string allowed" if @*ARGS.elems > 1;

validate(@*ARGS[0]);

sub hello {
    say "Hello, world!"
}

sub quine {
    say @*ARGS[0];
}

sub nine {
    my Int $beers = 99;
    while $beers > 1 {
        say "$beers bottles of beer on the wall, $beers bottles of beer.";
        print "Take one down, pass it around, ";
        $beers--;
        print "$beers bottles of beer on the wall\n\n";
    }
    print q:to/WALL/;
    1 bottle of beer on the wall, 1 bottle of beer.
    Take one down, pass it around, no more bottles of beer on the wall.
    WALL
}

sub plus {
    $accumulator++;
}

sub tokenize ($input) {
    my @commands = $input.split('');
    return @commands;
}

sub validate ($input) {
    die q{The only valid instructions are "h", "q", "9", and "+"}
    if $input ~~ /<-[hq9\+]>/;
}

sub execute ($command) {
    given $command {
        when "h" {
            hello();
        }
        when "q" {
            quine();
        }
        when "9" {
            nine();
        }
        when "+" {
            plus();
        }
    }
}

for tokenize(@*ARGS[0]) -> $command {
    execute($command);
}
