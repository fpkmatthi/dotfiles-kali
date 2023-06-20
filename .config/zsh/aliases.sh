# Zsh shell aliases
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias aslr-off='echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias aslr-on='echo 2 | sudo tee /proc/sys/kernel/randomize_va_space'
hex2endian() {
	[ -z "$1" ] && echo "No args supplied" && return
	if [[ $1 = 0x* ]]; then
		echo $1 | cut -c 3- | fold -w 2 | tac | sed 's/^/\\x/g' | tr -d "\n"
	else;
		echo no hex supplied
	fi
}
