# Wayne’s dotfiles

This is a forked repository from [Mathiasbynens](https://github.com/mathiasbynens/dotfiles). Please see the original repository for installation, instructions and credit.  The purpose of this repository is to allow me to get started with dotfiles from a great resource and discover what works best for my situation.

Note: There are 2 branches
 1. master - references master from https://mths.be/dotfiles 
 2. bontrager - my personal perferences and settings
	
## Usage
1. Clone repository in desired directory
2. Create `.bash_profile` in the home directory
    `touch ~/.bash_profile`
3. Update `.bash_profile` to contain the location of the repository and source the repo's bash_profile
```
export DOTFILES_RELATIVE_PATH="~/dotfiles"
source ${DOTFILES_RELATIVE_PATH}/.bash_profile
```
4. As of right now the `.gitconfig` needs to be copied over to the home directory in order for the git configurations to work

## Credit

Again please see the [forked repository](https://github.com/mathiasbynens/dotfiles). Many thanks to all who contributed and freely shared their learnings.
