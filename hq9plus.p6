my $accumulator;

sub hello {
    say "Hello, world!"
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
