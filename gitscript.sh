#festival --tts voice.txt
ls
pwd
read -p "Enter Folder Name From GIT Folder :" n3
cd /home/adada/Desktop/GIT/$n3
ls
pwd
git init
read -p "Enter URL of git repo :" n1
git add .
read -p "Any Commit Message :" n2
git commit -a -m \"$n2\"
#git remote remove origin
git remote add origin $n1
git push origin master 
git remote remove origin
