#!/usr/bin/perl

use strict;
use warnings;


my $t = <STDIN>;
chomp $t;

for my $a0 (0..$t-1){
    my $expression = <STDIN>;
    chomp $expression;
    print check_paranthezis($expression) ? "YES\n" : "NO\n";
}

sub check_paranthezis {
    my $string = shift;
    
    return 0 
        unless length($string)%2 == 0;
    
    my @stack;

    foreach my $br ( split(//, $string) ) {
        if ( $br eq '(' ) {
            push @stack, ')';
        } elsif ( $br eq '{' ) {
           push @stack, '}';    
        } elsif ( $br eq '[' ) {
            push @stack, ']'; 
        } else {
            return 0 unless @stack;
            my $top = pop @stack;

            return 0 if ( $top ne $br );
        } 
    }

    return 0 if @stack > 0;

    return 1;
}
