package DBIx::Class::Schema::AuditLog::Structure::Changeset;
{
  $DBIx::Class::Schema::AuditLog::Structure::Changeset::VERSION = '0.2.1';
}

use base 'DBIx::Class::Core';

use strict;
use warnings;

__PACKAGE__->load_components(qw< TimeStamp >);

__PACKAGE__->table('audit_log_changeset');

__PACKAGE__->add_columns(
    'id' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 1,
        'is_nullable'       => 0,
    },
    'description' => {
        'data_type'   => 'varchar',
        'is_nullable' => 1,
        'size'        => 255,
    },
    'timestamp' => {
        'data_type'     => 'timestamp',
        'set_on_create' => 1,
        'is_nullable'   => 0,
    },
    'user' => {
        'data_type'   => 'integer',
        'is_nullable' => 1,
    },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->belongs_to(
    'User',
    'DBIx::Class::Schema::AuditLog::Structure::User',
    { 'foreign.id' => 'self.user' },
);

__PACKAGE__->has_many(
    'Action',
    'DBIx::Class::Schema::AuditLog::Structure::Action',
    { 'foreign.changeset' => 'self.id' },
);

1;

__END__
=pod

=head1 NAME

DBIx::Class::Schema::AuditLog::Structure::Changeset

=head1 VERSION

version 0.2.1

=head1 AUTHOR

Mark Jubenville <ioncache@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Mark Jubenville.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

