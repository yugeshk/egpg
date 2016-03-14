#
# This file is part of EasyGnuPG.  EasyGnuPG is a wrapper around GnuPG
# to simplify its operations.  Copyright (C) 2016 Dashamir Hoxha
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses/
#

cmd_contact_help() {
    cat <<-_EOF

Usage: $0 contact <command> [<options>]

Commands to manage the contacts (correspondents, partners).
They are listed below.

    ls,list,show,find [<contact>...] [-r,--raw | -c,--colons]
        Show the details of the contacts (optionally in raw format or
        with colons). A list of all the contacts will be displayed if
        no one is selected. A contact can be selected by name, email,
        id, etc.

    rm,del,delete <contact>... [-f,--force]
        Delete the given contact(s).

    exp,export [<contact>...] [-o,--output <file>]
        Export contact(s) to file.

    imp,import,add <file>
        Import (add) contact(s) from file.

    fetch [<contact>...] [-d,--dir <gnupghome>]
        Get contacts from another gpg directory (by default from $GNUPGHOME).

    confirm <contact> [-u,--undo]
        You have verified the identity of the contact (the details of
        the contact, name, email, etc. are correct and belong to a
        real person). With option --undo the confirmation is removed.

    vouch <contact> [-u,--undo]
        You have verified the identity of the contact and you also let
        your friends know that you have confirmed it. With option
        --undo the vouching is removed.

    trust <contact> [-l,--level <trust-level>]
        You have verified the identity of the contact and you also
        trust him to be able to verify correctly and honestly the
        identities of other people. The trust levels are:
        full, marginal, none, unknown

    sync
        Synchronize the local contacts with the keyserver network.

_EOF
}
