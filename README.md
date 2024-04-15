# docker-cookiecutter

```bash
curl -O https://raw.githubusercontent.com/hmredmond/docker-cookiecutter/main/kickoff-time.sh
chmod +x kickoff-time.sh 
sh ./kickoff-time.sh <PAT>
echo "now use cd <name of project> to see the contents of the created project"
```


```
npx --package https://github.com/<username>/<repository>#<branch> npm run docker:build
```


```
curl -sS https://raw.githubusercontent.com/hmredmond/docker-cookiecutter/main/kickoff-time.sh | bash -s PAT

```

curl -O https://raw.githubusercontent.com/hmredmond/docker-cookiecutter/main/create.sh 
sh create.sh PAT

cookiecutter https://github.com/statsbomb/kitbag-kickoff --checkout main git_token=PAT
