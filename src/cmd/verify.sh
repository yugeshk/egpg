# Verify the signature of the given file.

cmd_verify_help() {
    cat <<-_EOF
    verify <file>
        Verify the signature of the given file.  The signature file
        <file.signature> must be present as well.

_EOF
}

cmd_verify() {
    local file="$1" ; shift
    [[ -z "$file" ]] && fail "Usage:\n$(cmd_verify_help)"
    [[ -f "$file" ]] || fail "Cannot find file '$file'"
    [[ -f "$file.signature" ]] || fail "Cannot find file '$file.signature'"

    # verify
    gpg --verify "$file.signature" "$file"
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
