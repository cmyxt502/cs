git add -A

read -p "commit:"
git commit -m $REPLY
git push origin master
