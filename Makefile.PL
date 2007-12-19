use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Linux::Apple::Laptop::LED',
    ABSTRACT_FROM => 'LED.pm',
    VERSION_FROM  => 'LED.pm',
    LICENSE       => 'perl',
    EXE_FILES     => [ 'script/lapled' ],
);
