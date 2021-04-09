set -e
# Forgetting uncomitted files in the working directory has costed me the draft of another blog post :)
git status | grep "l'albero di lavoro è pulito" || (echo "ABORTING DEPLOY, WOULD LOSE FILES"; exit 1)
zola build
git checkout gh-pages
# Forgetting to exclude `.git` has costed me several days worth of work and over 30 commits :)))
find . -maxdepth 1 -not -name '.' -not -name '.git' -not -name 'public' -exec rm -r {} \;
mv public/* .
#echo "birabittoh.dev" > CNAME
rmdir public/
git add .
git commit -m "Deploy site"
git push
git checkout master
