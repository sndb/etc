minimal_install:
	stow -v -t ~ bash neovim tmux

install: minimal_install
	stow -v -t ~ git framebuffer

minimal_restow:
	stow -v --restow -t ~ bash neovim tmux

restow: minimal_restow
	stow -v --restow -t ~ git framebuffer

minimal_delete:
	stow -v --delete -t ~ bash neovim tmux

delete: minimal_delete
	stow -v --delete -t ~ git framebuffer
