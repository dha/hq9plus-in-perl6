my $accumulator;
my @instructions;

die "Only one command string allowed" if @*ARGS.elems > 1;

validate(@*ARGS[0]);

tokenize(@*ARGS[0]);

sub hello {
    say "Hello, world!"
}

sub quine {
    say @*ARGS[0];
}

sub 99 {
    my Int $beers = 99;
    while $beers > 1 {
        print qq:to/WALL/;
        $beers bottles of beer on the wall, $beers bottles of beer.\n
        Take one down, pass it around, 
        WALL
        $beers--;
        print "$beers bottles of beer on the wall\n";
    }
    print q:to/WALL/;
    1 bottle of beer on the wall, 1 bottle of beer.\n
    Take one down, pass it around, no more bottles of beer on the wall.\n
    WALL
}

sub plus {
    $accumulator++;
}

sub tokenize ($input) {
    @instructions = $input.split('');
}

sub validate ($input) {
    die q{The only valid instructions are "h", "q", "9", and "+"}
    if $input ~~ /<-[hq9\+]>/;
}
