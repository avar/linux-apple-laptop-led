package Linux::Apple::Laptop::LED;

our $VERSION = '0.05';

sub  ON () { "\x06\xee\x04\x00\x01" }
sub OFF () { "\x06\xee\x04\x00\x00" }

sub import
{
    shift;
    my $caller = caller;
    *{"$caller\::$_"} = \&$_ for @_;
}

__END__

=head1 NAME

Linux::Apple::Laptop::LED - Turn the front LED on Apple laptops on and off via ADB

=head1 SYNOPSIS

    use IO::Handle ();
    use Time::HiRes qw(usleep);
    use Linux::Apple::Laptop::LED qw(ON OFF);

    open my $fh, ">", "/dev/adb" or die $!;
    $fh->autoflush(1);

    my $nap = 100_000; # 0.1 seconds
    for (1 .. 10) {
        syswrite($fh => ON);
        usleep($nap / 2);
        syswrite($fh => OFF);
        usleep($nap / 2);
    }

=head1 DESCRIPTION

Provides an interface for turning the front LED on Apple laptops
running Linux on and off. The user needs to open F</dev/adb> and print
either C<ON> or C<OFF> to it to turn the led on and off, respectively.

=head1 EXPORTS

Can optionally export two constant subroutines, C<ON> ond C<OFF>,
which return a string to be written to F</dev/adb>.

=head1 AUTHOR

E<AElig>var ArnfjE<ouml>rE<eth> Bjarmason <avar@cpan.org>

=head1 LICENSE

Copyright 2007 E<AElig>var ArnfjE<ouml>rE<eth> Bjarmason.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
