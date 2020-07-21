- https://qiita.com/tamura_CD/items/98bbd4a3143da960faf5#-express%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB

- https://qiita.com/tamura_CD/items/e3abdab9b8c5aa35fa6b

```
$ mkdir -p 00002-TypeScript-RESTサーバー

$ cd 00002-TypeScript-RESTサーバー

$ sudo npm install -g express


$ sudo npm install -g express-generator


$ express my-app

  warning: the default view engine will not be jade in future releases
  warning: use `--view=jade' or `--help' for additional options


   create : my-app/
   create : my-app/public/
   create : my-app/public/javascripts/
   create : my-app/public/images/
   create : my-app/public/stylesheets/
   create : my-app/public/stylesheets/style.css
   create : my-app/routes/
   create : my-app/routes/index.js
   create : my-app/routes/users.js
   create : my-app/views/
   create : my-app/views/error.jade
   create : my-app/views/index.jade
   create : my-app/views/layout.jade
   create : my-app/app.js
   create : my-app/package.json
   create : my-app/bin/
   create : my-app/bin/www

   change directory:
     $ cd my-app

   install dependencies:
     $ npm install

   run the app:
     $ DEBUG=my-app:* npm start


$ cd my-app

$ npm install

$ npm start

> my-app@0.0.0 start /home/kuraine/script-sketch/TypeScript/00002-TypeScript-RESTサーバー/my-app
> node ./bin/www

$ firefox http://localhost:3000

$ chrome http://localhost:3000

$ tree -I node_modules
.
├── app.js
├── bin
│   └── www
├── package-lock.json
├── package.json
├── public
│   ├── images
│   ├── javascripts
│   └── stylesheets
│       └── style.css
├── routes
│   ├── index.js
│   └── users.js
└── views
    ├── error.jade
    ├── index.jade
    └── layout.jade

7 directories, 10 files

```
