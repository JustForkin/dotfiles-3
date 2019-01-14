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

  git-rename-branch $current $next
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
