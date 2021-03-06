use strict;
use warnings;
 
use 5.008001;
 
use ExtUtils::MakeMaker;
 
my %WriteMakefileArgs = (
  "ABSTRACT" => "Bootstrap a new project from a shared template",
  "AUTHOR" => "John Napiorkowski",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "App-Skeletor",
  "EXE_FILES" => [
    "bin/skeletor"
  ],
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "App::Skeletor",
  "PREREQ_PM" => {
      "Getopt::Long::Descriptive" => '0.099',
      "File::Share" => '0.25',
      "Module::Runtime" => '0.014',
      "Path::Tiny" => '0.072',
      "Template::Tiny" => '1.12',  
  },
  "TEST_REQUIRES" => {
    "Test::Most" => 0
  },
  "VERSION" => "0.002",
  "test" => {
    "TESTS" => "t/*.t"
  }
);
 
my %FallbackPrereqs = (
  "ExtUtils::MakeMaker" => 0,
  "Test::More" => 0
);
 
unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}
 
delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };
 
WriteMakefile(%WriteMakefileArgs);

