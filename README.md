## Structure
```
--
  |
  |- Build - Gulp tasks, Stylguide Template, TODOs and other files not associated with the actual site
  |
  |- Src - Preprocessed files
     |
     |- coffee - proprocessed JS files
     |
     |- font - font files before being processed as Base64 CSS files
     |
     |- img - images prior to minification
     |
     |- jade - proprocessed HTML files
     |
     |- styl - proprocessed CSS files
     |
     |- svg - svg prior to minification and symbol creation https://css-tricks.com/svg-symbol-good-choice-icons/
  |
  |- Docs - Dynamically Generated Documentation
  |
  |- Tmp - Temporary files created as part of the build process
  |
  |- App - The Site
```

## Build
If not already installed, install Node, on a Mac:

`brew i node`

If not already installed globally, install gulp and bower:

`npm i gulp bower -g`

Install Node Build Components:

`npm i`

Install Bower Front-End Components:

`bower i`

Run all tasks:

`gulp`

Check localhost:8088 and localhost:1111 in your browser.