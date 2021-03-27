# TODOs 

## 2021-03-26

- [ ] Organize config
  - [ ] Get aliases in aliasfile, get functions in `other_functions.ps1` file.

- [ ] Create a ps1 script that enables me to do this command all in one go for individual files
`git add . && git commit -m 'add file_name' && git push`

## 02/24/2021

- [x] TODO: Finish writing project variable script
- [ ] TODO: write a function that automatically greps all files for the word "TODO"

```powershell
function rgtodo { rg TODO . }
# hey that was easy.
# Or for regular grep
function greptodo {grep TODO .}
```