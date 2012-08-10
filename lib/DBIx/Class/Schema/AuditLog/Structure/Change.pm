package DBIx::Class::Schema::AuditLog::Structure::Change;
{
  $DBIx::Class::Schema::AuditLog::Structure::Change::VERSION = '0.2.5';
}

use base 'DBIx::Class::Core';

use strict;
use warnings;

__PACKAGE__->table('audit_log_change');

__PACKAGE__->add_columns(
    'id' => {
        'data_type'         => 'integer',
        'is_auto_increment' => 1,
        'is_nullable'       => 0,
    },
    'action' => {
        'data_type'   => 'integer',
        'is_nullable' => 0,
    },
    'field' => {
        'data_type'   => 'integer',
        'is_nullable' => 0,
    },
    'old_value' => {
        'data_type'   => 'varchar',
        'is_nullable' => 1,
        'size'        => 255,
    },
    'new_value' => {
        'data_type'   => 'varchar',
        'is_nullable' => 1,
        'size'        => 255,
    },
);

__PACKAGE__->set_primary_key('id');

__PACKAGE__->belongs_to(
    'Action',
    'DBIx::Class::Schema::AuditLog::Structure::Action',
    { 'foreign.id' => 'self.action' },
);

__PACKAGE__->belongs_to(
    'Field',
    'DBIx::Class::Schema::AuditLog::Structure::Field',
    { 'foreign.id' => 'self.field' },
);

1;

__END__
=pod

=head1 NAME

DBIx::Class::Schema::AuditLog::Structure::Change

=head1 VERSION

version 0.2.5

=head1 AUTHOR

Mark Jubenville <ioncache@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Mark Jubenville.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

