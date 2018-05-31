#!/bin/bash

mkdir $HOME/build

tar -czf $HOME/beam.tar.gz ./README.md

cd $HOME

git config --global user.email "vadim@beam-mw.com"
git config --global user.name "Vadim Grigoruk"
git clone --quiet https://beam-mw:${TRAVIS_SECURE_TOKEN_NAME}@github.com/beam-mw/beam-builds build > /dev/null

cp $HOME/beam.tar.gz $HOME/build/beam.tar.gz

git add .
git commit -m "Travis build $TRAVIS_BUILD_NUMBER"
git push https://${TRAVIS_SECURE_TOKEN_NAME}@github.com/beam-mw/beam-builds master > /dev/null 2>&1

echo "Done\n"

# setup_git()
# {
#     git config --global user.email "vadim@beam-mw.com"
#     git config --global user.name "Vadim Grigoruk"
# }

# commit_build()
# {
#     # create folders for the build

#     APP=beam
#     DATE_FOLDER=nightly/$(date +%Y.%m.%d)
#     RELEASE_FOLDER=$DATE_FOLDER/release

#     if [[ "$OSTYPE" == "linux"* ]]; then
#         OS_FOLDER=$RELEASE_FOLDER/linux
#     elif [[ "$OSTYPE" == "darwin"* ]]; then
#         OS_FOLDER=$RELEASE_FOLDER/mac
#     else
#         echo "Error, OS:$OSTYPE not supported"
#         exit 1
#     fi

#     # checkout to 'nightly-builds' branch and add 
#     git fetch
#     git checkout nightly-builds
#     git pull

#     mkdir -p $OS_FOLDER
#     # compress the build

#     tar -czf $OS_FOLDER/$APP.tar.gz ./README.md 
#     #--directory=$APP beam.cpp

#     git add -f $OS_FOLDER/$APP.tar.gz
#     git commit --message "Travis build: $DATE_FOLDER on $OSTYPE"
#     git push
# }

# setup_git
# commit_build
