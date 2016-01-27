dir=~/etc/dotfiles/mutt
olddir=~/etc/dotfiles.bak/mutt
target=~/.mutt
files="account.com.friedersdorff.max account.com.gmail.maxf130 account.uk.ac.le.student.mf195 mailcap muttrc"
directories="com.friedersdorff.max com.gmail.maxf130.account uk.ac.le.student.mf195"

mkdir -p $olddir

cd $dir

for file in $files; do
  mv $target/$file $olddir/
  ln -s $dir/$file $target/$file
done

for directory in $directories; do
  mkdir -p $target/$directory
  /bin/bash $dir/$directory/makelinks.sh
done
