# Delete the key.

cmd_key_delete_help() {
    cat <<-_EOF
    rm,del,delete [<key-id>]
        Delete the key.

_EOF
}

cmd_key_delete() {
    local key_id="$1"
    [[ -z $key_id ]] && get_gpg_key && key_id=$GPG_KEY

    if is_unsplit_key $key_id; then
        local fingerprint
        fingerprint=$(gpg --with-colons --fingerprint $key_id | grep '^fpr' | cut -d: -f10)
        [[ -n "$fingerprint" ]] || fail "Key $key_id not found."
        gpg --batch --delete-secret-and-public-keys "$fingerprint"
    else
        # remove the partials
        rm -f "$EGPG_DIR"/$key_id.key.[0-9][0-9][0-9]
        rm -f "$DONGLE"/.egpg_key/$key_id.key.[0-9][0-9][0-9]
        rm -f $key_id.key.[0-9][0-9][0-9]
    fi
}

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
