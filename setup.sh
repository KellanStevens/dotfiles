#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NO_COLOUR='\033[0m'

log_info() {
    echo -e "${BLUE}[INFO]${NO_COLOUR} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NO_COLOUR} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NO_COLOUR} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NO_COLOUR} $1"
}

check_macos() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        log_error "This script is designed for macOS only"
        exit 1
    fi
    log_success "Running on macOS"
}

install_rosetta() {
    log_info "Installing Rosetta 2 for Apple Silicon compatibility..."
    if /usr/bin/pgrep oahd >/dev/null 2>&1; then
        log_success "Rosetta 2 is already installed"
    else
        if sudo softwareupdate --install-rosetta --agree-to-license; then
            log_success "Rosetta 2 installed successfully"
        else
            log_error "Failed to install Rosetta 2"
            exit 1
        fi
    fi
}

install_homebrew() {
    log_info "Checking for Homebrew installation..."

    if command -v brew >/dev/null 2>&1; then
        log_success "Homebrew is already installed"
        log_info "Updating Homebrew..."
        brew update
    else
        log_info "Installing Homebrew..."
        if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
            log_success "Homebrew installed successfully"

            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            log_error "Failed to install Homebrew"
            exit 1
        fi
    fi
}

install_from_brewfile() {
    log_info "Installing packages from Brewfile..."

    log_info "Checking for Brewfile..."
    BREWFILE_URL="https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/Brewfile"
    BREWFILE_PATH="/tmp/Brewfile"

    log_info "Downloading Brewfile..."
    if curl -fsSL "$BREWFILE_URL" -o "$BREWFILE_PATH"; then
        log_success "Brewfile downloaded successfully"
    else
        log_error "Failed to download Brewfile"
        exit 1
    fi

    log_info "Installing packages from Brewfile..."
    if brew bundle --file="$BREWFILE_PATH"; then
        log_success "All packages from Brewfile installed successfully"
    else
        log_warning "Some packages from Brewfile may have failed to install"
    fi

    rm -f "$BREWFILE_PATH"

    log_success "Brewfile installation completed"
}

apply_macos_preferences() {
    log_info "Applying macOS preferences..."

    PREFERENCES_URL="https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/macOS-preference.sh"
    PREFERENCES_PATH="/tmp/macOS-preference.sh"

    log_info "Downloading macOS preferences script..."
    if curl -fsSL "$PREFERENCES_URL" -o "$PREFERENCES_PATH"; then
        log_success "macOS preferences script downloaded successfully"
    else
        log_error "Failed to download macOS preferences script"
        exit 1
    fi

    log_info "Applying macOS preferences..."
    if bash "$PREFERENCES_PATH"; then
        log_success "macOS preferences applied successfully"
    else
        log_warning "Some macOS preferences may have failed to apply"
    fi

    rm -f "$PREFERENCES_PATH"

    log_success "macOS preferences setup completed"
}

setup_zsh_config() {
    log_info "Setting up zsh configuration..."

    ZSHRC_URL="https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/.zshrc"
    ZSHRC_PATH="/tmp/.zshrc"

    log_info "Downloading .zshrc..."
    if curl -fsSL "$ZSHRC_URL" -o "$ZSHRC_PATH"; then
        log_success ".zshrc downloaded successfully"
    else
        log_error "Failed to download .zshrc"
        exit 1
    fi

    log_info "Installing .zshrc..."
    if cp "$ZSHRC_PATH" "$HOME/.zshrc"; then
        log_success ".zshrc installed successfully"
    else
        log_error "Failed to install .zshrc"
        exit 1
    fi

    log_info "Creating .zsh directory structure..."
    mkdir -p "$HOME/.zsh"

    ALIASES_URL="https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/.zsh/aliases.zsh"
    ALIASES_PATH="/tmp/aliases.zsh"

    log_info "Downloading aliases.zsh..."
    if curl -fsSL "$ALIASES_URL" -o "$ALIASES_PATH"; then
        log_success "aliases.zsh downloaded successfully"
        if cp "$ALIASES_PATH" "$HOME/.zsh/aliases.zsh"; then
            log_success "aliases.zsh installed successfully"
        else
            log_error "Failed to install aliases.zsh"
        fi
    else
        log_warning "Failed to download aliases.zsh, skipping..."
    fi

    KEYBINDINGS_URL="https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/.zsh/keybindings.zsh"
    KEYBINDINGS_PATH="/tmp/keybindings.zsh"

    log_info "Downloading keybindings.zsh..."
    if curl -fsSL "$KEYBINDINGS_URL" -o "$KEYBINDINGS_PATH"; then
        log_success "keybindings.zsh downloaded successfully"
        if cp "$KEYBINDINGS_PATH" "$HOME/.zsh/keybindings.zsh"; then
            log_success "keybindings.zsh installed successfully"
        else
            log_error "Failed to install keybindings.zsh"
        fi
    else
        log_warning "Failed to download keybindings.zsh, skipping..."
    fi

    rm -f "$ALIASES_PATH" "$KEYBINDINGS_PATH"

    rm -f "$ZSHRC_PATH"

    log_success "zsh configuration setup completed"
}

setup_config_files() {
    log_info "Setting up configuration files..."

    log_info "Creating .config directory structure..."
    mkdir -p "$HOME/.config"

    log_info "Downloading configuration files..."

    mkdir -p "$HOME/.config/cursor"
    curl -fsSL "https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/.config/cursor/settings.json" -o "$HOME/.config/cursor/settings.json" && log_success "Cursor settings.json installed" || log_warning "Failed to install Cursor settings.json"
    curl -fsSL "https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/.config/cursor/extensions.sh" -o "$HOME/.config/cursor/extensions.sh" && log_success "Cursor extensions.sh installed" || log_warning "Failed to install Cursor extensions.sh"

    mkdir -p "$HOME/.config/fastfetch"
    curl -fsSL "https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/.config/fastfetch/config.jsonc" -o "$HOME/.config/fastfetch/config.jsonc" && log_success "Fastfetch config.jsonc installed" || log_warning "Failed to install Fastfetch config.jsonc"

    mkdir -p "$HOME/.config/ohmyposh"
    curl -fsSL "https://raw.githubusercontent.com/KellanStevens/dotfiles/HEAD/.config/ohmyposh/config.toml" -o "$HOME/.config/ohmyposh/config.toml" && log_success "Oh My Posh config.toml installed" || log_warning "Failed to install Oh My Posh config.toml"

    log_success "Configuration files setup completed"
}

main() {
    log_info "Starting macOS setup script..."
    echo "========================================"

    check_macos

    log_info "Step 1/6: Installing Rosetta 2 (if needed)..."
    install_rosetta

    log_info "Step 2/6: Installing Homebrew..."
    install_homebrew

    log_info "Step 3/6: Installing packages from Brewfile..."
    install_from_brewfile

    log_info "Step 4/6: Applying macOS preferences..."
    apply_macos_preferences

    log_info "Step 5/6: Setting up zsh configuration..."
    setup_zsh_config

    log_info "Step 6/6: Setting up configuration files..."
    setup_config_files

    echo "========================================"
    log_success "Setup completed successfully!"
    echo ""
    log_info "Installed components:"
    echo "  ✓ Homebrew package manager"
    echo "  ✓ Rosetta 2 (Apple Silicon compatibility)"
    echo "  ✓ All packages from Brewfile"
    echo "  ✓ macOS preferences applied"
    echo "  ✓ zsh configuration installed"
    echo "  ✓ Configuration files (Cursor, Fastfetch, Oh My Posh)"
    echo ""
    log_info "Please restart your terminal or run 'source ~/.zshrc' to use Homebrew commands"
}

main "$@"
