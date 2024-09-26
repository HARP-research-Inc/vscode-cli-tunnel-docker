#!/bin/bash

# Generate metadata used by the actions

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
    if [[ $TARGET == "base" ]]; then
        get_tag "latest"
    fi
fi

# Print multi-line string to github ENV

echo 'DOCKER_TAGS_AUTO_GEN<<EOF' >> "$GITHUB_ENV"
cat /tmp/docker-tags.txt >> "$GITHUB_ENV"
echo EOF >> "$GITHUB_ENV"