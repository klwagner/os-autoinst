package backend::svirt;
use strict;
use base ('backend::baseclass');

# this is a fake backend to some extend. We do don't start VMs, but provide ssh access
# to a libvirt running host (KVM for System Z in mind)

use testapi qw/get_var/;

sub new {
    my $class = shift;
    my $self = bless({class => $class}, $class);
    die "configure WORKER_HOSTNAME e.g. in workers.ini" unless get_var('WORKER_HOSTNAME');
    return $self;
}

# we don't do anything actually
sub do_start_vm() {
    my ($self) = @_;

    # remove backend.crashed
    $self->unlink_crash_file;
    return {};
}

sub do_stop_vm {
    my ($self) = @_;

    return {};
}

sub do_savevm {
    my ($self, $args) = @_;
    return {};
}

sub do_loadvm {
    my ($self, $args) = @_;
    die "if you need loadvm, you're screwed with IPMI";
}

sub status {
    my ($self) = @_;
    return;
}

1;

# vim: set sw=4 et:
