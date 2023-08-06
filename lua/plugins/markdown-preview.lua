
return {

{
  "iamcco/markdown-preview.nvim",
  version = "*",
  ft = "markdown",
  config = function()
    vim.fn["mkdp#util#install"]()


  end
}

}


