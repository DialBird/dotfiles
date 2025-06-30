.PHONY: install clean backup help

# dotfilesのリスト
DOTFILES := .bashrc .gitconfig .git_template .vimrc .tmux.conf .zshrc .zpreztorc .zprofile .ideavimrc .claude
HOME_DIR := $(HOME)
DOTFILES_DIR := $(HOME)/dotfiles
BACKUP_SUFFIX := .backup.$(shell date +%Y%m%d_%H%M%S)

# デフォルトターゲット
install: ## dotfilesをシンボリックリンクとしてインストール
	@echo "Installing dotfiles..."
	@for file in $(DOTFILES); do \
		dotfile_path="$(DOTFILES_DIR)/$$file"; \
		home_path="$(HOME_DIR)/$$file"; \
		if [ ! -e "$$dotfile_path" ]; then \
			echo "$$file does not exist in dotfiles directory, skipped"; \
			continue; \
		fi; \
		if [ ! -e "$$home_path" ]; then \
			ln -s "$$dotfile_path" "$$home_path"; \
			echo "$$file is linked"; \
		elif [ -L "$$home_path" ]; then \
			echo "$$file is already a symlink, skipped"; \
		elif [ -f "$$home_path" ]; then \
			backup_path="$$home_path$(BACKUP_SUFFIX)"; \
			mv "$$home_path" "$$backup_path"; \
			ln -s "$$dotfile_path" "$$home_path"; \
			echo "$$file is backed up to $$(basename $$backup_path) and linked"; \
		fi; \
	done
	@echo "Installation completed!"
	@echo "Setting up mise configuration..."
	@if [ -e "$(DOTFILES_DIR)/mise.toml" ]; then \
		mkdir -p "$(HOME)/.config/mise"; \
		if [ -L "$(HOME)/.config/mise/config.toml" ]; then \
			echo "mise config.toml is already a symlink, skipped"; \
		elif [ -f "$(HOME)/.config/mise/config.toml" ]; then \
			backup_path="$(HOME)/.config/mise/config.toml$(BACKUP_SUFFIX)"; \
			mv "$(HOME)/.config/mise/config.toml" "$$backup_path"; \
			ln -s "$(DOTFILES_DIR)/mise.toml" "$(HOME)/.config/mise/config.toml"; \
			echo "mise config.toml backed up to $$(basename $$backup_path) and linked"; \
		else \
			ln -s "$(DOTFILES_DIR)/mise.toml" "$(HOME)/.config/mise/config.toml"; \
			echo "mise config.toml linked"; \
		fi; \
		echo "mise setup completed!"; \
	else \
		echo "mise.toml not found in dotfiles directory, skipped"; \
	fi


clean: ## シンボリックリンクを削除
	@echo "Removing dotfile symlinks..."
	@for file in $(DOTFILES); do \
		home_path="$(HOME_DIR)/$$file"; \
		if [ -L "$$home_path" ]; then \
			rm "$$home_path"; \
			echo "$$file symlink removed"; \
		else \
			echo "$$file is not a symlink, skipped"; \
		fi; \
	done
	@echo "Cleanup completed!"

backup: ## 現在のdotfilesをバックアップ
	@echo "Creating backup of current dotfiles..."
	@backup_dir="$(HOME_DIR)/dotfiles_backup_$(shell date +%Y%m%d_%H%M%S)"; \
	mkdir -p "$$backup_dir"; \
	for file in $(DOTFILES); do \
		home_path="$(HOME_DIR)/$$file"; \
		if [ -e "$$home_path" ] && [ ! -L "$$home_path" ]; then \
			cp -r "$$home_path" "$$backup_dir/"; \
			echo "$$file backed up"; \
		fi; \
	done; \
	echo "Backup created in $$backup_dir"

status: ## 現在のdotfilesの状態を表示
	@echo "Dotfiles status:"
	@for file in $(DOTFILES); do \
		home_path="$(HOME_DIR)/$$file"; \
		dotfile_path="$(DOTFILES_DIR)/$$file"; \
		if [ ! -e "$$dotfile_path" ]; then \
			echo "  $$file: NOT FOUND in dotfiles directory"; \
		elif [ ! -e "$$home_path" ]; then \
			echo "  $$file: NOT INSTALLED"; \
		elif [ -L "$$home_path" ]; then \
			target=$$(readlink "$$home_path"); \
			if [ "$$target" = "$$dotfile_path" ]; then \
				echo "  $$file: LINKED (correct)"; \
			else \
				echo "  $$file: LINKED (incorrect target: $$target)"; \
			fi; \
		else \
			echo "  $$file: EXISTS (not a symlink)"; \
		fi; \
	done

help: ## このヘルプメッセージを表示
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
