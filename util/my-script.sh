# 새로 산 m1 맥 세팅용 스크립트 파일
# 홈브루, 깃업데이트, 아이떰 설치 및 세팅

today=${date}
echo $today
echo 'createdAt : 2022 0808'
echo 'last-updated... : 2022 0808'

echo "homebrew install"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "homebrew setting"

eval "$(/opt/homebrew/bin/brew shellenv)"

echo "git update"

brew install git

echo "iterm2 install"

brew install --cask iterm2

echo "tree install"
brew install tree

echo "ohmyzsh install"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "edit oh-my-zsh theme"

sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc  > ~/temp
rm ~/.zshrc
mv ~/temp ~/.zshrc
source ~/.zshrc

echo "==========You need to change font manually================"
echo "==========[Preference] - [Profile] - [Text]=============="

echo "install syntax-highlighting"

brew install zsh-syntax-highlighting
echo source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ~/.zshrc

echo "download color scheme"
cd ~/Downloads
wget https://github.com/mbadolato/iTerm2-Color-Schemes/archive/refs/heads/master.zip

echo "download D2 fonts"
wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip