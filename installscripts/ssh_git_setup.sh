type -p 'sshd' &>/dev/null || printf "error: Could not find 'sshd', Make sure you have openssh installed.\n"
ssh-keygen -t rsa -b 4096 -C "aakashsensharma@gmail.com"
echo "generated ssh key"
eval "$(ssh-agent -s)"
echo "started ssh agent"
ssh-add ~/.ssh/id_rsa
echo "Added the ssh-key to the keychain"
xclip -selection clipboard < ~/.ssh/id_rsa.pub
echo "The key has been copied to your clipboard. Upload this to github."
