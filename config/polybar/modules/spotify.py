#!/usr/bin/python
# -*- coding: utf-8 -*-

import dbus, sys, optparse
from dbus import Interface, SessionBus

trunclen = 25

def get_song():
    try:
        session_bus = dbus.SessionBus()
        spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")

        spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")
        metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")

        artist = metadata['xesam:artist'][0]
        song = metadata['xesam:title']

        if len(song) > trunclen:
            song = song[0:trunclen]
            song += '...'
            if ('(' in song) and (')' not in song):
                song += ')'

        output = artist + ': ' + song
        print song
        return output
    except:
        print("No Song")
    pass


def action(action):
    try:
        bus = SessionBus()
        proxy = bus.get_object('org.mpris.MediaPlayer2.spotify', '/org/mpris/MediaPlayer2')
        interface = Interface(proxy, dbus_interface='org.mpris.MediaPlayer2.Player')

        if action in ['pause', 'play']:  # Workaround spotify’s bad implementation of Play…
            interface.Pause()
        if action in ['playpause', 'play']:
            interface.PlayPause()
        elif action == 'next':
            interface.Next()
        elif action == 'previous':
            interface.Previous()
    except Exception as e:
        print(e + "action")


def main():
    parser = optparse.OptionParser()
    parser.add_option("-a", action="store", dest="action",default=False)
    parser.add_option("-s", action="store_true", dest="song",default=False)

    (options, args) = parser.parse_args()

    if options.song:
        get_song()
    elif options.action:
        action(options.action)

if __name__ == "__main__":
    main()
