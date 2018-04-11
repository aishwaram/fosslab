#!/usr/bin/perl
#Date and day
@months=qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
@days=qw(Sun Mon Tue Wed Thu Fri Sat Sun);
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)= localtime();
print "$mday $months[$mon] $days[$wday]\n";


#Subroutines- kind of like a function
#Use subroutine_name(list of arguments);
sub Hello
{print "Hello Worold! \n";
}
#Functional call
Hello();

sub Average
{  $n=scalar(@_);
   $sum=0;
   foreach $item (@_)
    {
    $sum+=$item;
     }
    $average=$sum/$n;
    #my operator makes variable private
    my $b=10;
    
    print "Average for given numbers: $average\n";
     return $average;
}
$a=Average(10,20,30);
print "$a is average,$b";
# $b doesnt get printed

