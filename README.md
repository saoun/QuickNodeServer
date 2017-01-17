# Quick Node Server

This is a command line shortcut to set up a node server and associated directories.

## How to use:

- Open QuickNodeServer.sh
- Select All, and Copy
- Open Terminal on your Mac
- Open your bash_profile (``subl ~/.bash_profile``)
- Paste the code (anywhere, though best at the bottom)
- Save the file, and close it
- Back on Terminal, type ``reload`` which will update your machine with the changes
- On Terminal, type ``touch_node [file name]``, and you're all set!

## What the script will do:
First, the script will create a directory and file structure.

```
project
│   package.json
│
└───client
│   │
│   └───public
│   │   │
│   │   └───img
│   │   |
│   │   └───javascript
│   │   │      jquery.js
│   │   │      script.js
│   │   └───stylesheets
│   │          style.css
│   │
│   └───views
│          index.html
│   
└───server
│      index.js
│      
└───node_modules
       ...
```

Then, it will run the following commends on your Terminal:
``npm init`` which will initialize npm in the directory created. Follow the questions asked
and answer as need. None of them are mandatory, and they can be edited later. Then, it will install the following packages to run Express and Nodemon:
``npm install express --save`` <br>
``npm install mustache-express --save`` <br>
``npm install nodemon --save`` <br><br>
Express is a package that will handle the server routing and the asset serving
- Read more here: https://www.npmjs.com/package/express <br>

Mustache is a template engine for HTML files and more
- Read more about 'Usage' here: https://www.npmjs.com/package/mustache

## Extras
Once sublime opens, head to Package.json. On line 6 for "scripts", add:
``"start": "nodemon server/server.js"``. <br>
This will allow you to start the server from your Terminal and run Nodemon by typing ``npm start``.
Visit your site on http://localhost:8080
