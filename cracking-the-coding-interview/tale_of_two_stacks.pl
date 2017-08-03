# Enter your code here. Read input from STDIN. Print output to STDOUT
use strict;
use warnings;
use feature qw(say);

my $queries = <STDIN>;
chomp $queries;

my @firstStack = ();
my @secondStack = ();

my $i = 0;
while ( $i++ <= $queries ) {
    my $instruction_line = <STDIN>;
    next unless $instruction_line;
    chomp $instruction_line;

    my ( $instr, $elem ) = split(/\s+/, $instruction_line );

    queue_elem($elem) if $instr == 1;
    dequeue()         if $instr == 2;
    get_first()       if $instr == 3;
}

sub queue_elem {
    my $elem = shift;
    push @firstStack, $elem if $elem;
}

# Get the first elem in the queue,
# which means the elem at the bottom of 
# the first stack
sub dequeue {
    unless ( @secondStack ) {
        while (@firstStack) {
            my $element = pop @firstStack;
            push @secondStack, $element;
        }
    }

    pop @secondStack; 
}

# Get the first elem in the queue,
# which means the elem at the bottom of 
# the first stack
sub get_first {
    my $top = dequeue();
    say $top;
    push @secondStack, $top;
}

