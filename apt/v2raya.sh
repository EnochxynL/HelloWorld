# https://v2raya.org/en/docs/prologue/installation/debian/
wget -qO - https://apt.v2raya.org/key/public-key.asc | sudo tee /etc/apt/keyrings/v2raya.asc
echo "deb [signed-by=/etc/apt/keyrings/v2raya.asc] https://apt.v2raya.org/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
sudo apt update

# Autmatically download
sudo apt install v2raya v2ray ## you can install xray package instead of if you want

# Manually download
# https://github.com/v2rayA/v2rayA/releases
# https://dev59.com/unix/8HVD5IYBdhLWcg3wWaNh
# https://www.baeldung-cn.com/linux/bash-extract-first-word
# https://www.cnblogs.com/liujiaxin2018/p/15757227.html
# https://askubuntu.com/questions/51854/is-it-possible-to-install-a-deb-from-a-url
pkg="v2raya"
url=https://github.com/v2rayA/v2raya-apt/tree/master/pool/main/v/v2raya
list=$(wget -O- -q --no-check-certificate $url | sed -ne "s/^.*\"\\(${pkg}_[^\"]*_amd64\\.deb\\)\".*/\\1/p" | sort -Vr)
# echo "Download $repo/${list%%.deb*}.deb at $(pwd)"
repo=https://raw.gitmirror.com/v2rayA/v2raya-apt/master/pool/main/v/v2raya
wget "$repo/${list%%.deb*}.deb"
sudo apt install "${list%%.deb*}.deb"
rm "${list%%.deb*}.deb"

# Manually download
pkg="v2ray"
url=https://github.com/v2rayA/v2raya-apt/tree/master/pool/main/v/v2ray
list=$(wget -O- -q --no-check-certificate $url | sed -ne "s/^.*\"\\(${pkg}_[^\"]*_amd64\\.deb\\)\".*/\\1/p" | sort -Vr)
# echo "Download $repo/${list%%.deb*}.deb at $(pwd)"
repo=https://raw.gitmirror.com/v2rayA/v2raya-apt/master/pool/main/v/v2ray
wget "$repo/${list%%.deb*}.deb"
sudo apt install "${list%%.deb*}.deb"
rm "${list%%.deb*}.deb"

sudo systemctl enable v2raya.service
