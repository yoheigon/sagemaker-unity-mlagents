import subprocess

cmd1 = "cp -arf /opt/ml/input/data/ /unity-volume/"
cmd2 = "mlagents-learn --docker-target-name=unity-volume --env=3DBall --train trainer_config.yaml"
cmd3 = "cp -arf /unity-volume/models /opt/ml/model/"
subprocess.call(cmd1.split())
subprocess.call(cmd2.split())
subprocess.call(cmd3.split())
