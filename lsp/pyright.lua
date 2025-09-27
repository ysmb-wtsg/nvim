return {
  filetypes = { "python" },
  settings = {
    python = {
      pythonPath = ".venv/bin/python",
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
