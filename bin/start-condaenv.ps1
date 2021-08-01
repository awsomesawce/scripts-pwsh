# Taken from Anaconda start-menu shortcut on Windows.
# This allows the user to start the conda env from the current powershell session.
if ($env:CONDA_EXE) {
    Write-Error "Conda environment is already loaded"
} else {
    & 'C:\Users\Carl\miniconda3\shell\condabin\conda-hook.ps1' ; conda activate 'C:\Users\Carl\miniconda3' 
}
