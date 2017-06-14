function node_touch(){

  if [ "$#" -ne 1 ]
  then
    echo "You must provide a project name. Usage: 'node_touch [name]'"
    return
  fi
    mkdir $1
    cd $1
    mkdir client
      mkdir client/views
        echo -e '<!doctype html>\n<html>\n<head>\n  <link href="stylesheets/style.css" rel="stylesheet" type="text/css">\n</head>\n<body>\n  <div class="container">\n    "Hello World."\n  </div>\n</body>\n</html>\n<script src="javascript/jquery.js" type="text/javascript"></script>\n<script src="javascript/script.js" type="text/javascript"></script>' > client/views/index.html
      mkdir client/public
        mkdir client/public/img
        mkdir client/public/stylesheets
          touch client/public/stylesheets/style.css
        mkdir client/public/javascript

          #gets jQuery, checks for successful download.
          curl -f http://code.jquery.com/jquery-2.2.1.min.js > client/public/javascript/jquery.js
          if [ -s client/public/javascript/jquery.js ]
          then
            echo 'jQuery Download Successful.'
          else
            rm client/public/javascript/jquery.js
            echo 'ERROR: jQuery download failed, file removed.'
          fi

          echo -e '"use strict";\n(function(){\n\n})();' > client/public/javascript/script.js

      printf  'var express = require("express");
var app = express();
var mustache = require("mustache-express");

app.engine("html",mustache());
app.set("view engine", "html");
app.set("views", __dirname+"/../client/views");
app.use("/", express.static(__dirname+"/../client/public"));

//Define the port
var port = 8080;

//Define what happens then a user visits the root route
app.get("/",function(req,res)
{
res.render("index"); //Tell Express which html file to render for this route
});

//Start the server on the defined port
app.listen(port, function()
{
  console.log("Server running on port: "+port);
})' > index.js

    npm init
    npm install express --save
    npm install mustache-express --save
    npm install nodemon --save
    npm install -g json # installs a global NPM package that will allow us to edit package.json easier
    json -I -f package.json -e 'this.scripts.start = "nodemon index.js"' # adds start script to package.json
    subl . #change this line to your editor of choice.

}
