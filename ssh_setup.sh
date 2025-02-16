# Getting user email

echo "Enter your email: "
read email_addr

# Removing existing keys

rm -rf $HOME/.ssh
mkdir $HOME/.ssh

# Generating ssh keys

ssh-keygen -t ed25519 -C $email_addr 


# Adding to ssh agent

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519


# Displaying the keys

cat ~/.ssh/id_ed25519.pub
