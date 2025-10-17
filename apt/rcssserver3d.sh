# https://gitlab.com/robocup-sim/SimSpark/-/wikis/Installation-on-Linux
echo "deb http://download.opensuse.org/repositories/science:/SimSpark/xUbuntu_$(lsb_release -r -s | awk 'END {print}')/ /" | sudo tee /etc/apt/sources.list.d/science:SimSpark.list
curl -fsSL https://download.opensuse.org/repositories/science:SimSpark/xUbuntu_$(lsb_release -r -s | awk 'END {print}')/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/science_SimSpark.gpg > /dev/null
sudo apt-get update
sudo apt-get install rcssserver3d-dev
