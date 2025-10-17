# Automatically
curl -fSsL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-edge.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main' | sudo tee /etc/apt/sources.list.d/microsoft-edge.list
sudo apt update
sudo apt install microsoft-edge-stable
# Software sources are generated automatically by the package. Only for the first time.
# https://dev59.com/unix/8HVD5IYBdhLWcg3wWaNh
# https://www.baeldung-cn.com/linux/bash-extract-first-word
# https://www.cnblogs.com/liujiaxin2018/p/15757227.html
# https://askubuntu.com/questions/51854/is-it-possible-to-install-a-deb-from-a-url
pkg="microsoft-edge-stable"
url=https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable
list=$(wget -O- -q --no-check-certificate $url | sed -ne "s/^.*\"\\(${pkg}_[^\"]*_amd64\\.deb\\)\".*/\\1/p" | sort -Vr)
# echo "Download $repo/${list%%.deb*}.deb at $(pwd)"
repo=https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable
wget "$repo/${list%%.deb*}.deb"
sudo apt reinstall "./${list%%.deb*}.deb"
rm "./${list%%.deb*}.deb"
