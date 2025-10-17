# https://www.anaconda.com/blog/rpm-and-debian-repositories-for-miniconda
# Install our public gpg key to trusted store
curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
sudo install -o root -g root -m 644 conda.gpg /etc/apt/trusted.gpg.d/
rm conda.gpg

# Add our debian repo
echo "deb [arch=amd64] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" | sudo tee /etc/apt/sources.list.d/conda.list

# Install it!
sudo apt update
sudo apt install conda
# Reading package lists... Done
# Building dependency tree
# Reading state information... Done
# The following NEW packages will be installed:
#  conda
# 0 upgraded, 1 newly installed, 0 to remove and 3 not upgraded.
# Need to get 76.3 MB of archives.
# After this operation, 221 MB of additional disk space will be used.
# Get:1 https://repo.anaconda.com/pkgs/misc/debrepo/conda stable/main amd64 conda amd64 4.5.11-0 [76.3 MB]
# Fetched 76.3 MB in 10s (7733 kB/s)
# debconf: delaying package configuration, since apt-utils is not installed
# Selecting previously unselected package conda.
# (Reading database ... 4799 files and directories currently installed.)
# Preparing to unpack .../conda_4.5.11-0_amd64.deb ...
# Unpacking conda (4.5.11-0) ...
# Setting up conda (4.5.11-0) …
source /opt/conda/etc/profile.d/conda.sh
conda -V
