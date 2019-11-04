#En el terminal de BASH (linux) se ejecuta: sh deploy.sh

# abort on errors
set -e

# build
npm run docs:build

# navigate into the build output directory
cd docs/.vuepress/dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
#git push -f git@github.com:delphier007/pruebasgit.git master:gh-pages
git push -f https://github.com/delphier007/delphier007.github.io master:master


cd -