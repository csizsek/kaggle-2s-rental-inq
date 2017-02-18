#! /bin/bash

echo "removing old feature files"
rm tmp/features_*.csv

echo "git checkout notebooks"
git checkout -- 1*.ipynb

for nb in 1*.ipynb;
do
    echo "running notebook: $nb"
    jupyter nbconvert \
        --to=notebook \
        --inplace \
        --ExecutePreprocessor.enabled=True \
        --ExecutePreprocessor.timeout=3600 \
        --log-level=ERROR \
        $nb
done

echo "git checkout notebooks"
git checkout -- 1*.ipynb

