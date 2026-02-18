# Tell Conda NOT to mess with the prompt (Starship handles this)
export CONDA_CHANGEPS1=false

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# --- Modern Tools Configuration ---

# 1. Initialize zoxide (The smarter cd)
eval "$(zoxide init zsh)"
alias cd="z"

# 2. Alias cat to bat
alias cat="bat"

# 3. Alias ls to eza (with icons and git status)
alias ls="eza --icons --git"
alias ll="eza --icons --git -l"
alias tree="eza --icons --tree"

# 4. Use bat to read man pages (Colorized Manuals!)
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# --- Fixed Smart Conda Wrapper ---
conda() {
    # 1. SPECIAL CASE: 'activate' and 'deactivate'
    # These must be evaluated by the shell, not just run as a command.
    if [[ "$1" == "activate" || "$1" == "deactivate" ]]; then
        eval "$(command conda shell.zsh "$@")"
        return
    fi

    # 2. STANDARD CASE: All other commands (install, list, search, etc.)
    # Run them normally as the binary executable.
    command conda "$@"
    local exit_status=$?

    # 3. SMART LISTENER: Check for 'create' to trigger direnv setup
    if [[ $exit_status -eq 0 && "$1" == "create" ]]; then
        local env_name=""
        local args=("$@")
        for ((i=1; i<=${#args[@]}; i++)); do
            if [[ "${args[$i]}" == "-n" || "${args[$i]}" == "--name" ]]; then
                env_name="${args[$((i+1))]}"
                break
            fi
        done

        if [[ -n "$env_name" ]]; then
            echo ""
            if read -q "choice?🐍 Do you want to auto-activate '$env_name' in this directory? (y/n) "; then
                echo ""
                echo "layout anaconda $env_name" > .envrc
                direnv allow
                echo "✅ .envrc created! Environment will now auto-load here."
            else
                echo ""
                echo "Skipping .envrc creation."
            fi
        fi
    fi

    return $exit_status
}

# Added by Antigravity
export PATH="/Users/swapnilroy/.antigravity/antigravity/bin:$PATH"