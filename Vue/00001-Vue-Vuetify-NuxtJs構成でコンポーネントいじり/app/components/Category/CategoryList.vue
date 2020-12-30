<template>
  <v-card>
    <v-card-title>
      <v-text-field
        v-model="searchKeyWord"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headerList"
      :items="bodyList"
      :search="searchKeyWord"
      height="400"
      fixed-header
    ></v-data-table>
  </v-card>
</template>

<script>
export default {
  // https://materialdesignicons.com/cdn/2.0.46/
  data: () => ({
    searchKeyWord: "",
    headerList: [{ text: "Name", value: "name" }],
    bodyList: [
      {
        name: "2html"
      },
      {
        name: "2xml"
      },
      {
        name: "ImageMagick"
      },
      {
        name: "Netlify"
      },
      {
        name: "Objective_C"
      },
      {
        name: "OpenShot"
      },
      {
        name: "Orange"
      },
      {
        name: "R"
      },
      {
        name: "README.md"
      },
      {
        name: "React"
      },
      {
        name: "Rstudio"
      },
      {
        name: "ShellGei"
      },
      {
        name: "Telegram"
      },
      {
        name: "Tukubai"
      },
      {
        name: "TypeScript"
      },
      {
        name: "Typora"
      },
      {
        name: "Unity"
      },
      {
        name: "VisualBox"
      },
      {
        name: "Vue"
      },
      {
        name: "YouTubeToMP3"
      },
      {
        name: "ack"
      },
      {
        name: "align"
      },
      {
        name: "anaconda"
      },
      {
        name: "android"
      },
      {
        name: "apache"
      },
      {
        name: "apache_solr"
      },
      {
        name: "apache_spark"
      },
      {
        name: "awk"
      },
      {
        name: "aws"
      },
      {
        name: "aws_workspaces"
      },
      {
        name: "base64"
      },
      {
        name: "bash"
      },
      {
        name: "bats"
      },
      {
        name: "bc"
      },
      {
        name: "c"
      },
      {
        name: "chrome"
      },
      {
        name: "clisp"
      },
      {
        name: "codeblocks"
      },
      {
        name: "codelite"
      },
      {
        name: "column"
      },
      {
        name: "composite"
      },
      {
        name: "convert"
      },
      {
        name: "cpp"
      },
      {
        name: "csharp"
      },
      {
        name: "csv2"
      },
      {
        name: "curl"
      },
      {
        name: "dart"
      },
      {
        name: "datamash"
      },
      {
        name: "date"
      },
      {
        name: "db2"
      },
      {
        name: "dbeaver"
      },
      {
        name: "dc"
      },
      {
        name: "dev_to"
      },
      {
        name: "django"
      },
      {
        name: "docker"
      },
      {
        name: "eclipse"
      },
      {
        name: "egison"
      },
      {
        name: "elasticsearch"
      },
      {
        name: "electron"
      },
      {
        name: "emmet"
      },
      {
        name: "eog"
      },
      {
        name: "factor"
      },
      {
        name: "fallocate"
      },
      {
        name: "fcitx_mozc"
      },
      {
        name: "feedly"
      },
      {
        name: "firefox"
      },
      {
        name: "flatpak"
      },
      {
        name: "flokk"
      },
      {
        name: "fluentd"
      },
      {
        name: "flutter"
      },
      {
        name: "fsharp"
      },
      {
        name: "fzf"
      },
      {
        name: "gas"
      },
      {
        name: "gcc"
      },
      {
        name: "gist"
      },
      {
        name: "git"
      },
      {
        name: "github"
      },
      {
        name: "gitlab"
      },
      {
        name: "glibc"
      },
      {
        name: "golang"
      },
      {
        name: "googler"
      },
      {
        name: "gosu"
      },
      {
        name: "graalvm"
      },
      {
        name: "gradle"
      },
      {
        name: "grep"
      },
      {
        name: "gron"
      },
      {
        name: "groonga"
      },
      {
        name: "groovy"
      },
      {
        name: "haskell"
      },
      {
        name: "heroku"
      },
      {
        name: "html2"
      },
      {
        name: "identify"
      },
      {
        name: "indicator_stickynotes"
      },
      {
        name: "jQuery"
      },
      {
        name: "java"
      },
      {
        name: "java-ee"
      },
      {
        name: "java-webflex"
      },
      {
        name: "javafx"
      },
      {
        name: "join"
      },
      {
        name: "jpegoptim"
      },
      {
        name: "jq"
      },
      {
        name: "jshell"
      },
      {
        name: "jsonschema2pojo"
      },
      {
        name: "jupyter_notebook"
      },
      {
        name: "kaggle"
      },
      {
        name: "kakasi"
      },
      {
        name: "kdevelop"
      },
      {
        name: "kkc"
      },
      {
        name: "kotlin"
      },
      {
        name: "lsp"
      },
      {
        name: "make"
      },
      {
        name: "mariadb"
      },
      {
        name: "maven"
      },
      {
        name: "mecab"
      },
      {
        name: "meld"
      },
      {
        name: "micronaut"
      },
      {
        name: "miller"
      },
      {
        name: "monetdb"
      },
      {
        name: "mongodb"
      },
      {
        name: "mroonga"
      },
      {
        name: "mruby"
      },
      {
        name: "mysql"
      },
      {
        name: "mysql_workbench"
      },
      {
        name: "nginx"
      },
      {
        name: "nim"
      },
      {
        name: "nlp"
      },
      {
        name: "nodejs"
      },
      {
        name: "numconv"
      },
      {
        name: "nuxtjs"
      },
      {
        name: "openssh"
      },
      {
        name: "opy"
      },
      {
        name: "oracle"
      },
      {
        name: "osquery"
      },
      {
        name: "pandas"
      },
      {
        name: "parallel"
      },
      {
        name: "pdftotext"
      },
      {
        name: "perl"
      },
      {
        name: "php"
      },
      {
        name: "pinterest"
      },
      {
        name: "pocket"
      },
      {
        name: "postgres"
      },
      {
        name: "printf"
      },
      {
        name: "proxy"
      },
      {
        name: "pup"
      },
      {
        name: "pwsh"
      },
      {
        name: "pygmentize"
      },
      {
        name: "python"
      },
      {
        name: "qiita"
      },
      {
        name: "qt"
      },
      {
        name: "racket"
      },
      {
        name: "realm"
      },
      {
        name: "realm_studio"
      },
      {
        name: "redis"
      },
      {
        name: "reg"
      },
      {
        name: "ruby"
      },
      {
        name: "rundeck"
      },
      {
        name: "rust"
      },
      {
        name: "scala"
      },
      {
        name: "sdk"
      },
      {
        name: "search_engine"
      },
      {
        name: "sed"
      },
      {
        name: "seq"
      },
      {
        name: "shiny"
      },
      {
        name: "shuf"
      },
      {
        name: "silversearcher_ag"
      },
      {
        name: "slack"
      },
      {
        name: "snap"
      },
      {
        name: "splash"
      },
      {
        name: "sponge"
      },
      {
        name: "spreadsheet"
      },
      {
        name: "sqlite3"
      },
      {
        name: "sqlserver"
      },
      {
        name: "stackoverflow"
      },
      {
        name: "supervisor"
      },
      {
        name: "swift"
      },
      {
        name: "systemd_nspawn"
      },
      {
        name: "task"
      },
      {
        name: "tcl"
      },
      {
        name: "tee"
      },
      {
        name: "teip"
      },
      {
        name: "tesseract"
      },
      {
        name: "tidy"
      },
      {
        name: "tk"
      },
      {
        name: "tmux"
      },
      {
        name: "tor-browser"
      },
      {
        name: "tput"
      },
      {
        name: "trang"
      },
      {
        name: "trans"
      },
      {
        name: "trdsql"
      },
      {
        name: "tree"
      },
      {
        name: "twitter"
      },
      {
        name: "ubuntu"
      },
      {
        name: "uconv"
      },
      {
        name: "unicode"
      },
      {
        name: "uniutils"
      },
      {
        name: "url"
      },
      {
        name: "usb"
      },
      {
        name: "vba"
      },
      {
        name: "vim"
      },
      {
        name: "vlc"
      },
      {
        name: "vscode"
      },
      {
        name: "w3m"
      },
      {
        name: "wine"
      },
      {
        name: "wireshark"
      },
      {
        name: "wordpress"
      },
      {
        name: "xargs"
      },
      {
        name: "xjc"
      },
      {
        name: "xml"
      },
      {
        name: "xml2"
      },
      {
        name: "xmllint"
      },
      {
        name: "xpup"
      },
      {
        name: "xrdp"
      },
      {
        name: "yes"
      },
      {
        name: "yq"
      }
    ]
  }),
  methods: {
    addRouteInfo: function (targetRouteInfo) {
      this.$store.commit('routeHistoryInfo/pushItem', targetRouteInfo)
    }
    ,removeRouteInfo: function (targetRouteInfo) {
      this.$store.commit('routeHistoryInfo/popItem', targetRouteInfo)
    }
  },
  created(){
    let routeItem = {
      text : this.$router.currentRoute.path === '/' ? 'TOP' : this.$router.currentRoute.path.slice(1).toUpperCase(),
      disabled: false,
      href: this.$router.currentRoute.path === '/' ? '/' : this.$router.currentRoute.path.slice(1)
    }
    let isExists = this.$store.state.routeHistoryInfo.routeHistoryList.some(item => item.href === routeItem.href)
    if (isExists) {
      this.removeRouteInfo(routeItem)
    }else{
      this.addRouteInfo(routeItem)
    }
  },
}
</script>
