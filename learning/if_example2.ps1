if ((Split-Path -Leaf (gcm -Name nvim | Select-Object -ExpandProperty Source)) -like "*n*vim*") {
echo "Neovim is installed in your path!"
} else {
echo "Neovim is not installed in your path."
}
