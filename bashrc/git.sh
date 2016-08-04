

alias gst='clear && git status'

gitick () { echo $1 >> $1 && git add $1 && git commit -m $1; }

prhash () {
  BRANCH=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`
  REMOTE=`git config --get branch.$BRANCH.remote`
  (git fetch $REMOTE refs/pull/$1/merge > /dev/null 2> /dev/null) && git rev-parse FETCH_HEAD;
}

gh() {
  gcpath=$HOME/.gh/$1
  [[ -d $gcpath/.git ]] || git clone git@github.com:$1.git $gcpath
  cd $gcpath
}

ghj() {
  gh danyshaanan/$1
}
