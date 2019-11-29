# philippkueng.github.io

This is the repo for my personal blog on [https://philippkueng.ch](https://philippkueng.ch).

## Writing

Compile the Markdown files, then watch for changes and recompile as needed.

```bash
# Install rbenv to install custom ruby versions
brew install rbenv

# Download a specific ruby version
rbenv install 2.6.5 --verbose

# add eval "$(rbenv init -)" to the .zshrc file

# Install all the required dependencies defined in the Gemfile
bundle

# Install Pygments (a python dependency)
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

# Add /Users/philippkueng/Library/Python/3.7/bin to the PATH in .zshrc
pip install Pygments

# Attempt to start the server and build a static version of the blog
bundle exec jekyll serve --drafts
```