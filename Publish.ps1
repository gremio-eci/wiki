if (-Not (Get-Command git -errorAction SilentlyContinue)) {
  ./Installer.ps1
  Write-Output "Warning: Git not found, installing it"
}

if (-Not (Get-Command hugo -errorAction SilentlyContinue)) {
  ./Installer.ps1
  Write-Output "Warning: Hugo not found, installing it"
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
  Move-Item -Path * -Destination tmp/
  Move-Item -Path .* -Destination tmp/
  Move-Item -Path tmp/public/* -Destination .
  Move-Item -Path tmp/.git -Destination .
  Remove-Item -Path tmp -Recurse

  git add -A
  git commit -m "Publish"
  git push origin gh-pages -f
}

git checkout master

if ("$Stashed" -eq "true") {
  git stash apply
}
