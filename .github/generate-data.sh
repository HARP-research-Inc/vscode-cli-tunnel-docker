#!/bin/bash
set -e
# Generate metadata used by the actions

# If /tmp/docker-tags.txt exists, delete it
if [ -f /tmp/docker-tags.txt ]; then
    rm /tmp/docker-tags.txt
fi

# Ensure our env vars are set

if [ -z "$GITHUB_ENV" ]; then
    echo "GITHUB_ENV is not set"
    exit 1
fi

if [ -z "$REF" ]; then
    echo "GITHUB_REF is not set"
    exit 1
fi

if [ -z "$REF_NAME" ]; then
    echo "REF_NAME is not set"
    exit 1
fi

if [ -z "$TARGET" ]; then
    echo "TARGET is not set"
    exit 1
fi

function get_tag() {
    NAME=$1
    echo "type=raw,value=$NAME" >> /tmp/docker-tags.txt
}

get_tag "$REF_NAME-$TARGET"

if [[ $TARGET == "base" ]]; then
    get_tag "$REF_NAME"
fi

# Generate the tags to push to docker
if [[ $REF == refs/tags/* ]]; then
    get_tag "$TARGET"
    read -r MAJOR MINOR PATCH <<< "$(echo "$REF_NAME" | awk -F '[\.\-]' '{print $1 " " $2 " " $3}')"
    # If we did not get a numeric major, minor, or patch, exit with an error
    if ! [[ $MAJOR =~ ^[0-9]+$ ]]; then
        echo "Major version is not a number"
        exit 1
    fi
    if ! [[ $MINOR =~ ^[0-9]+$ ]]; then
        echo "Minor version is not a number"
        exit 1
    fi
    if ! [[ $PATCH =~ ^[0-9]+$ ]]; then
        echo "Patch version is not a number"
        exit 1
    fi
    # If major is equal to 0, don't push the major tag
    if [[ $MAJOR -ne 0 ]]; then
        get_tag "$MAJOR-$TARGET"
    fi
        get_tag "$MAJOR.$MINOR-$TARGET"
        if [[ $TARGET == "base" ]]; then
            get_tag "latest"
            if [[ $MAJOR -ne 0 ]]; then
                get_tag "$MAJOR-$TARGET"
            fi
            get_tag "$MAJOR.$MINOR"
        fi
fi

# Print multi-line string to github ENV

{ 
    echo 'DOCKER_TAGS_AUTO_GEN<<EOF' 
    cat /tmp/docker-tags.txt
    echo EOF >> "$GITHUB_ENV"
} >> "$GITHUB_ENV"