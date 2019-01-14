settings="-eu"

if [ "$DEBUG" = "on" ]; then
  settings="${settings}x"
fi

git-reassign-current-branch() {( set $settings
  ref=$1

  branch=$(git-capture-current-branch)

  prevSHA=$(git-capture-sha $branch)
  newSHA=$(git-capture-sha $ref)

  echo
  echo "Reassigning current branch"
  echo "- - -"
  echo
  echo "Current Branch Name: $branch"
  echo "Target: $ref"
  echo

  if [ $prevSHA = $newSHA ]; then
    echo "No need to move branch ($branch) to $ref; branch is already at $newSHA"
    echo

    false
  fi

  execute "git reset --hard $ref" &&
    echo -e "\nMoved current branch ($branch) to $ref ($prevSHA -> $newSHA)"
)}

git-reassign-branch() {( set $settings
  branch=$1
  ref=$2

  echo
  echo "Reassigning branch"
  echo "- - -"
  echo
  echo "Branch Name: $branch"
  echo "Target: $ref"
  echo

  prevSHA=$(git-capture-sha $branch)
  newSHA=$(git-capture-sha $ref)

  if [ $prevSHA = $newSHA ]; then
    echo "No need to move branch ($branch) to $ref; branch is already at $newSHA"
    echo

    false
  fi

  execute "git branch -f $branch $ref" &&
    echo "Moved branch $branch to $ref ($prevSHA -> $newSHA)"
)}

git-rename-branch() {( set $settings
  current=$1
  next=$2

  echo
  echo "Renaming branch"
  echo "- - -"
  echo
  echo "Current Name: $current"
  echo "Next Name: $next"
  echo

  if [ $next = $current ]; then
    echo "No need to rename branch $current to $next"
    echo

    false
  fi

  execute "git branch -m $current $next" &&
    echo "Renamed branch $current to $next"
)}

git-rename-current-branch() {(set $settings
  next=$1

  current=$(git-capture-branch)

  git-rename-branch $current $next &&
    echo "Renamed current branch ($current) to $next"
)}

git-start-branch() {(set $settings
  branch=$1

  current=$(git-capture-branch)
  parent=${2:-$current}

  echo
  echo "Starting branch"
  echo "- - -"
  echo
  echo "Branch: $branch"
  echo -n "Parent: $parent (SHA: $(git-capture-sha $parent))"

  if [ $current != $parent ]; then
    echo -n " (Current: $current)"
  fi

  echo
  echo

  if git-branch-exists $branch; then
    echo "Cannot start branch $branch; it exists (SHA: $(git-capture-sha $branch))"
    echo

    false
  fi

  execute "git branch $branch $parent" &&
    echo "Started branch $branch from $parent (SHA: $(git-capture-sha $parent))"

  echo

  if [ $parent = $current ]; then
    git checkout $branch
  fi
)}

execute() {( set $settings
  cmd=$@

  echo "Command: $cmd"

  (set +eu; eval $cmd)

  exitStatus=$?

  echo "- - -"
  echo "Done (Status: $exitStatus)"
  echo

  if [ $exitStatus -ne 0 ]; then
    false
  fi
)}

git-capture-current-branch() {( set $settings
  git-capture-branch
)}

git-capture-branch() {( set $settings
  ref=${1:-HEAD}

  git rev-parse --abbrev-ref $ref
)}

git-capture-sha() {( set $settings
  ref=${1:-$(git-capture-current-branch)}

  git rev-parse --short $ref
)}

git-branch-exists() {( set $settings
  set +e

  branch=$1

  git show-ref --quiet --verify refs/heads/$branch
)}
