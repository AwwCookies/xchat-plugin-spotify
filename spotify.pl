#!/usr/bin/perl -w
use strict;
use 5.018;
use Net::DBus;
use Xchat qw(:all);
register('Spotify','0.0.1', 'Gives XChat/Hexchat access to spotify controls via DBus');

my $bus = Net::DBus->session;
my $spotify = $bus->get_service("com.spotify.qt")->
    get_object("/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player");

hook_command("spotify->next", \&next);
hook_command("spotify->prev", \&previous);
hook_command("spotify->pasue", \&pause);
hook_command("spotify->playpasue", \&playpause);
hook_command("spotify->stop", \&stop);
hook_command("spotify->play", \&play);
# hook_command("spotify->open", \&openuri);


sub next {
    Xchat::print("03,09Spotify:\t03,00Next");
    $spotify->Next;
}

sub previous {
    Xchat::print("03,09Spotify:\t03,00Previous");
    $spotify->Previous;
}

sub pause {
    Xchat::print("03,09Spotify:\t03,00Pause");
    $spotify->Pause;
}

sub playpause {
    Xchat::print("03,09Spotify:\t03,00Play Pause");
    $spotify->PlayPause;
}

sub stop {
    Xchat::print("03,09Spotify:\t03,00Stop");
    $spotify->Stop;
}

sub play {
    Xchat::print("03,09Spotify:\t03,00Play");
    $spotify->Play;
}

sub openuri {
    Xchat::print("03,09Spotify:\t03,00Open URI: $_[0][1]");
    $spotify->OpenURI($_[0][1]);
}
