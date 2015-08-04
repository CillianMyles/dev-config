# Sublime Text 2
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
sudo apt-get install sublime-text

# Install the Package Manager 
https://packagecontrol.io/installation

# Flatgrammer Theme 
https://github.com/artifactdev/flatgrammer-theme

# Download Zip
https://github.com/artifactdev/flatgrammer-theme/archive/master.zip

# Unzip and rename the folder to Theme - Flatgrammer
cd ~/Downloads/
unzip flatgrammer-theme-master.zip
mv flatgrammer-theme-master Theme\ -\ Flatgrammer
cp -r Theme\ -\ Flatgrammer/ /home/cillian/.config/sublime-text-2/Packages

# Open User preferences
nano ~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings

# Add the following, save, and then restart Sublime
{
  "args":
  {
    "activate_browser": true,
    "auto_save": true,
    "browser_name": "all",
    "delay": 0.5
  },
  "auto_complete_commit_on_tab": true,
  "color_scheme": "Packages/Theme - Flatgrammer/Flatgrammer.tmTheme",
  "command": "browser_refresh",
  "folder_exclude_patterns":
  [
    ".git",
    ".hg",
    "tmp",
    "log",
    "doc",
    "coverage"
  ],
  "font_size": 13.0,
  "hot_exit": false,
  "ignored_packages":
  [
    "Vintage",
    "Markdown"
  ],
  "keys":
  [
    "ctrl+shift+r"
  ],
  "quick_panel_small": true,
  "remember_open_files": false,
  "sidebar_size_12": true,
  "tab_size": 2,
  "tabs_small": false,
  "theme": "Flatgrammer.sublime-theme",
  "translate_tabs_to_spaces": true,
  "update_check": false
}