## Build
##### If not already installed, install Node, on a Mac:

`brew i node`

##### If not already installed globally, install gulp and bower:

`npm i gulp bower -g`

##### Install Node and Bower Components:

`npm i`

(Bower components are automatically added to vendor.js if the components bower.json is correct. Sometimes a bower component's main file needs to be overridden which can be done is build/bower.json)

##### Run all tasks:

`gulp`

Check localhost:8088 and localhost:8088/styleguide in your browser.
