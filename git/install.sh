#!/usr/bin/env bash

brew install git

git config --global core.pager "less -F -X"

echo -e "\nStart setting up git configuration!"

read -p "Enter user name: " username
read -p "Enter default user email: " email

git config --global user.name $username
git config --global user.email $email

echo -e "\nStart setting up additional git configuration!"
while true; do
  read -p "Enter configuration name: (or 'done' to finish): " config_name
  if [[ $config_name == "done" ]]; then
    break
  fi

  read -p "Enter repository type: " repo_type
  read -p "Enter email for $config_name: " email

  config_file=$HOME/.gitconfig.$config_name
  cat <<EOL >$config_file
[user]
  email = $email
  name = $username
EOL

  git config --global \
    includeif.gitdir:$HOME/$repo_type/$config_name/.path \
    $config_file
done
