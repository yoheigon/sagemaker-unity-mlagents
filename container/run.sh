#!/bin/sh
mkdir /ml-agents-0.15.1/unity-game/
cp -arf $SM_CHANNEL_TRAIN/* /ml-agents-0.15.1/unity-game/
cd /ml-agents-0.15.1/unity-game/
chmod 755 /ml-agents-0.15.1/unity-game/$SM_HP_ENV_NAME
mlagents-learn --env=/ml-agents-0.15.1/unity-game/$SM_HP_ENV_NAME --train /ml-agents-0.15.1/config/trainer_config.yaml
cp -arf /ml-agents-0.15.1/unity-game/models $SM_MODEL_DIR
cp -arf /ml-agents-0.15.1/unity-game/summaries $SM_MODEL_DIR
