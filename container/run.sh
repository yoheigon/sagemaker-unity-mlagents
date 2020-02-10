#!/bin/sh

cp -arf /opt/ml/input/data/train/ /ml-agents-0.11.0/unity-volume/
cp /ml-agents-0.11.0/config/trainer_config.yaml /ml-agents-0.11.0/unity-volume/
mlagents-learn --docker-target-name=ml-agents-0.11.0/unity-volume/train --env=3DBall --train trainer_config.yaml
cp -arf /ml-agents-0.11.0/unity-volume/train/models /opt/ml/model/
cp -arf /ml-agents-0.11.0/unity-volume/train/summaries /opt/ml/model/
