use utf8;
use inc::Module::Install;

name 'Linux-Apple-Laptop-LED';

author        'Ævar Arnfjörð Bjarmason <avar@cpan.org>';
abstract_from 'LED.pm';
license_from  'LED.pm';

install_script 'script/lapled';

# LED.pm
requires 'Exporter' => 0;

# t/
build_requires 'Test::More' => 0; # 5.007003

tests 't/*.t';

auto_install;
WriteAll;
