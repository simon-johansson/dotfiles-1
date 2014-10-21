#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

alias webfaction="ssh sijoh006@web371.webfaction.com"
alias trolla="ssh sijo@trol.la"
alias desk="cd ~/Desktop/"
alias simon="cd ~/"
alias torrents="cd /Volumes/data/torrents"
alias tmp="cd /tmp"
alias proj="cd ~/Projekt"
alias ..='cd ..'
alias ...='cd ../..'
alias lsa="ls -a"
alias rm="rm -i"
alias "unzip-all"="unzip \*.zip"
alias "webstorm"="open -a /Applications/WebStorm.app/"

function dash { open dash://"$1"; }

function unzip-all-seperate {
  for file in *.zip
  do
    echo $file
    unzip $file -d $file.dir
  done
}

function clone {
  gh_url=${1:-`pbpaste`}
  co_dir=/tmp/$(expr "$gh_url" : '.*/\(.*\).git$')

  git clone "${gh_url}" "${co_dir}" && cd "${co_dir}"
}
