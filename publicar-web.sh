#En el terminal de BASH (linux) se ejecuta: sh deploy.sh

# abort on errors
set -e
##############################################
# Esto sirve para hacer un commit local en dist

# build
npm run docs:build


# navigate into the build output directory
cd docs/.vuepress/dist

git init
git add -A
git commit -m 'deploy'
git push -f https://github.com/delphier007/delphier007.github.io master
##############################################

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
#git push -f git@github.com:delphier007/pruebasgit.git master:gh-pages

#git push -f https://github.com/delphier007/delphier007.github.io master

# IMPORTANTE: En Github, para que la página username.github.io sea la gh-pages (sin tener que poner /repo/), la rama tiene que ser forzosamente la MASTER. Por tanto, en la rama fuentes, vamos a hacer el push de los fuentes.

cd -