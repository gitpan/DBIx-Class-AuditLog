
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "DBICx::TestDatabase" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0,
    "utf8" => 0
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Simple activity audit logging for DBIx::Class",
  "dist_author" => [
    "Mark Jubenville <ioncache\@gmail.com>"
  ],
  "dist_name" => "DBIx-Class-AuditLog",
  "dist_version" => "0.2.4",
  "license" => "perl",
  "module_name" => "DBIx::Class::AuditLog",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Class::C3::Componentised" => 0,
    "DBIx::Class" => 0,
    "DBIx::Class::Core" => 0,
    "DBIx::Class::Schema" => 0,
    "DBIx::Class::TimeStamp" => 0,
    "Scalar::Util" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
