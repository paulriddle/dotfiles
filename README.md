To set fish as default shell do

```
chsh -s `which fish`
```

Then you'll need to edit the sudoers file so that you're not
prompted for password when performing some of the basic commands
like installing packages. By default visudo uses nano. I prefer
neovim, so I run:

```
sudo update-alternatives --config editor
```

and pick nvim.

For stow to work you'd have to create a ~/.stowrc with
```
--target=/home/ripsec
```
in it.
