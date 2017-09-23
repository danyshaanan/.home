
# git

### Merging two histories into one

This is just one way to merge two histories (repos) into one history (repo).

In this example, we'll copy the history of the `p1` repo into the `p2` repo.
For simplicity, the two repos reside in the same directory.

```bash
cd p1
SHA=`git rev-parse @`
git bundle create ~/$SHA @
cd ../p2
git bundle unbundle ~/$SHA
git merge --allow-unrelated-histories --no-edit $SHA
rm -f ~/$SHA
git log --graph --oneline --decorate
```

### Creating a new repo out of an existing directory

```bash
git init --bare ~/newRepo.git
git subtree push --prefix EXISTING_DIRECTORY ~/newRepo.git master
git clone ~/newRepo.git ~/newRepo

rm -rf ~/newRepo.git && cd ~/newRepo
```

### Remove sensitive data from the whole history:

https://help.github.com/articles/remove-sensitive-data/
