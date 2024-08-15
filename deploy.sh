#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件 , yarn docs:build
npm run build:win
git init
git add -A
git commit -m 'bolg'
git branch -M master
git push -f git@github.com:zidiannote/myblog.git master

# 进入生成的文件夹
cd docs/.vuepress/dist

# git初始化，每次初始化不影响推送
git init
git add -A
git commit -m 'blogdeploy'
git branch -M blog

# 注意此处的格式是：git push -f git@github.com:USERNAME/USERNAME.github.io.git main
git push -f git@github.com:zidiannote/myblog.git blog

# 上行代码中 git@github.com:cmty256/cmty256.github.io.git 这一段其实就是你的 github 项目远程地址，建议直接粘贴
