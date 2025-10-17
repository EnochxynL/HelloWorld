setLang='zh_CN'
echo "Install $setLang language dependencies."
sudo apt install $(check-language-support -l $setLang)

cat ~/.config/fcitx5/profile
# [Groups/0/Items/1]
# # Name
# Name=pinyin
# # Layout
# Layout=
echo "GUI: You can configure your input method."
fcitx5-configtool
