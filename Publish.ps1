if (-Not (Get-Command git -errorAction SilentlyContinue)) {
  Write-Output "Warning: Git not found, installing it"
  ./Installer.ps1
}

if (-Not (Get-Command hugo -errorAction SilentlyContinue)) {
  Write-Output "Warning: Hugo not found, installing it"
  ./Installer.ps1
}

$Stash = git stash --include-untracked
if ("$Stash" -eq "No local changes to save") {
  $Stashed="false"
} else {
  $Stashed="true"
}

git checkout gh-pages
git reset --hard master

hugo -D -v

if (!$?) {
  echo "Hugo failed to run, aborting publishing"
} else {
  New-Item -ItemType Directory -Force -Path tmp
  Move-Item -Path * -Destination tmp/ -erroraction 'silentlycontinue'
  Move-Item -Path tmp/public/* -Destination .
  Remove-Item -Path tmp -Recurse

  git add -A
  git commit -m "Publish"
  git push origin gh-pages -f
}

git checkout master

if ("$Stashed" -eq "true") {
  git stash apply
}
