#!/bin/sh

cp -arf /opt/ml/input/data/ /unity-volume/
mlagents-learn --docker-target-name=unity-volume --env=3DBall --train trainer_config.yaml
cp -arf /unity-volume/models /opt/ml/model/
