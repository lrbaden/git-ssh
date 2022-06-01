#! /bin/sh

echo -e "\nWelcome to git-ssh v$VERSION ..."

# Using identity file
IDENTITY_FILE=${IDENTITY_FILE:-""}

if [ -n "$IDENTITY_FILE" ]; then

    echo -e "  starting ssh agent ..."
    eval `ssh-agent -s` 1> /dev/null

    echo -e "  adding identity file ..."
    ssh-add "$IDENTITY_FILE" > /dev/null 2>&1 || echo "  failed to add identity."

    echo -e "  done.\n"

fi

# execute command
exec "$@"
