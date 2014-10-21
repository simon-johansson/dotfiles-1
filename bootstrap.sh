#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	source ~/.bash_profile;
}

# Ladda ner zsh och sätt det som default shell
# Kör .osx skriptet

# if test ! $(which brew)
# then
#   echo "  Installing Homebrew for you."
#   ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
# fi

# https://github.com/thoughtbot/laptop/blob/master/mac

# def install_prezto
#   puts
#   puts "Installing Prezto (ZSH Enhancements)..."

#   run %{ ln -nfs "$HOME/.yadr/zsh/prezto" "${ZDOTDIR:-$HOME}/.zprezto" }

#   # The prezto runcoms are only going to be installed if zprezto has never been installed
#   file_operation(Dir.glob('zsh/prezto/runcoms/z*'), :copy)

#   puts
#   puts "Overriding prezto ~/.zpreztorc with YADR's zpreztorc to enable additional modules..."
#   run %{ ln -nfs "$HOME/.yadr/zsh/prezto-override/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc" }

#   puts
#   puts "Creating directories for your customizations"
#   run %{ mkdir -p $HOME/.zsh.before }
#   run %{ mkdir -p $HOME/.zsh.after }
#   run %{ mkdir -p $HOME/.zsh.prompts }

#   if ENV["SHELL"].include? 'zsh' then
#     puts "Zsh is already configured as your shell of choice. Restart your session to load the new settings"
#   else
#     puts "Setting zsh as your default shell"
#     if File.exists?("/usr/local/bin/zsh")
#       if File.readlines("/private/etc/shells").grep("/usr/local/bin/zsh").empty?
#         puts "Adding zsh to standard shell list"
#         run %{ echo "/usr/local/bin/zsh" | sudo tee -a /private/etc/shells }
#       end
#       run %{ chsh -s /usr/local/bin/zsh }
#     else
#       run %{ chsh -s /bin/zsh }
#     end
#   end
# end

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
