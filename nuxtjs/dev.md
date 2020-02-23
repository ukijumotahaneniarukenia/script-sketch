# 作業ディレクトリに移動

```
cd ~/script-sketch/nuxtjs
```

# コマンドラインツールインストール

```
sudo npm install -g @vue/cli

yarn global add @vue/cli-init
```

# テンプレート作成

```
vue init nuxt-community/starter-template test
```

# アプリディレクトリに移動

```
cd test
```

# フレームワークツールインストール

```
npm install

npm install --save @nuxtjs/axios
```

# アプリ設定ファイル編集

```
sed -i 's;"dev": "nuxt";"dev": "HOST=0.0.0.0 PORT=3000 nuxt";' package.json
```

# プロセス起動

```
npm run dev 1>launch-nuxtjs.log 2>&1 &
```

# ブラウザからアクセス

```
http://localhost:3000/
```

# インデックスページ作成
```
cat <<EOS>pages/index.vue
<template>
  <div>
    <ul>
       <li v-for="(post,index) in posts" :key="index">
         <a :href="post.url" target="_blank" rel="noopener noreferrer">{{ post.title }}</a>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    async asyncData({ \$axios }) {
      // 取得先のURL
      const url = "https://qiita.com/api/v2/items";
      // リクエスト（Get）
      const response = await \$axios.\$get(url);
      // 配列で返ってくるのでJSONにして返却
      return {
        posts: response
      };
    }
  };
</script>
EOS
```

# フレームワーク設定ファイル編集

```
cat <<EOS >nuxt.config.js
module.exports = {
  /*
  ** Headers of the page
  */
  head: {
    title: 'test',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Nuxt.js project' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },
  /*
  ** Customize the progress bar color
  */
  loading: { color: '#3B8070' },
  /*
  ** Build configuration
  */
  build: {
    /*
    ** Run ESLint on save
    */
    extend (config, { isDev, isClient }) {
      if (isDev && isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  },
  modules:
  [
      "@nuxtjs/axios",
  ]
}
EOS
```

# アプリ設定ファイル確認

```
$cat package.json
{
  "name": "test",
  "version": "1.0.0",
  "description": "Nuxt.js project",
  "author": "ukijumotahaneniarukenia <mrchildrenkh1008@gmail.com>",
  "private": true,
  "scripts": {
    "dev": "HOST=0.0.0.0 PORT=3000 nuxt",
    "build": "nuxt build",
    "start": "nuxt start",
    "generate": "nuxt generate",
    "lint": "eslint --ext .js,.vue --ignore-path .gitignore .",
    "precommit": "npm run lint"
  },
  "dependencies": {
    "@nuxtjs/axios": "^5.9.5",
    "nuxt": "^2.0.0"
  },
  "devDependencies": {
    "babel-eslint": "^10.0.1",
    "eslint": "^4.19.1",
    "eslint-friendly-formatter": "^4.0.1",
    "eslint-loader": "^2.1.1",
    "eslint-plugin-vue": "^4.0.0"
  }
}
```

# アプリディレクトリ確認

```
$tree test -I node_modules
test
|-- README.md
|-- assets
|   `-- README.md
|-- components
|   |-- AppLogo.vue
|   `-- README.md
|-- launch-nuxtjs.log
|-- layouts
|   |-- README.md
|   `-- default.vue
|-- middleware
|   `-- README.md
|-- nuxt.config.js
|-- package-lock.json
|-- package.json
|-- pages
|   |-- README.md
|   `-- index.vue
|-- plugins
|   `-- README.md
|-- static
|   |-- README.md
|   `-- favicon.ico
`-- store
    `-- README.md

8 directories, 17 files
```


# プロセス停止

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kuraine      1  0.0  0.0  14380  2012 pts/0    Ss+  06:00   0:00 /bin/bash
kuraine    133  0.0  0.0 734360 24616 ?        Sl   10:17   0:00 npm
kuraine    144  1.2  0.5 1013640 171180 ?      Sl   10:17   0:23 node /home/kuraine/script-sketch/nuxtjs/test/node_modules/.bin/nuxt
kuraine    743  0.0  0.0  14380  2076 pts/2    Ss   10:22   0:00 /bin/bash
kuraine    811  0.0  0.0  54304  1856 pts/2    R+   10:49   0:00 ps aux


$kill -9 144
```
