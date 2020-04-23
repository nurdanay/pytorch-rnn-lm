#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools


# download the data set!

mkdir -p $data/shakes

mkdir -p $data/shakes/raw

wget https://github.com/nurdanay/pytorch-rnn-lm/data/plays.txt
mv plays.txt $data/shakes/raw

# preprocess slightly

cat $data/shakes/raw/plays.txt | python $base/scripts/preprocess_raw.py > $data/shakes/raw/plays.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/shakes/raw/plays.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
    $data/shakes/raw/plays.preprocessed.txt

# split into train, valid and test

head -n 500 $data/shakes/raw/plays.preprocessed.txt > $data/shakes/valid.txt
head -n 1000 $data/shakes/raw/plays.preprocessed.txt | tail -n 500 > $data/shakes/test.txt
tail -n 43993 $data/shakes/raw/plays.preprocessed.txt > $data/shakes/train.txt
