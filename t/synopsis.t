use Test::More;

plan(skip_all => "Not running on Linux")   unless $^O eq "linux";
plan(skip_all => "/dev/adb does not exist")   unless -e "/dev/adb";
plan(skip_all => "/dev/adb is not writeable") unless -w "/dev/adb";
plan(tests => 20);

    use IO::Handle ();
    use Time::HiRes qw(usleep);
    use Linux::Apple::Laptop::LED qw(ON OFF);

    open my $fh, ">", "/dev/adb" or die $!;
    $fh->autoflush(1);

    my $nap = 100_000; # 0.1 seconds
    for (1 .. 10) {
        ok syswrite($fh => ON);
        usleep($nap / 2);
        ok syswrite($fh => OFF);
        usleep($nap / 2);
    }
