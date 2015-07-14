my $accumulator;

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

sub validate ($input) {
    die "Only one command string allowed" if @*ARGS.elems > 1;
    die q{The only valid instructions are "h", "q", "9", and "+"}
    if $*ARGS[0] ~~ /<-[hq9\+]>/;
}

for (@*ARGS[0].split('')) -> $command {
    given $command {
        when "h" {
            say "Hello, world!";
        }
        when "q" {
            say @*ARGS[0];
        }
        when "9" {
            nine();
        }
        when "+" {
            $accumulator++
        }
    }
}
