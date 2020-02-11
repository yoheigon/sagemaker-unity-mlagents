#!/bin/sh

echo $SM_HP_ENV_NAME
cp -arf $SM_CHANNEL_TRAIN /ml-agents-0.11.0/unity-volume/
cp /ml-agents-0.11.0/config/trainer_config.yaml /ml-agents-0.11.0/unity-volume/train/
mlagents-learn --docker-target-name=ml-agents-0.11.0/unity-volume/train --env=$SM_HP_ENV_NAME --train trainer_config.yaml
cp -arf /ml-agents-0.11.0/unity-volume/train/models $SM_MODEL_DIR
cp -arf /ml-agents-0.11.0/unity-volume/train/summaries $SM_MODEL_DIR
