<template>
  <!-- https://www.reallygoodux.io/blog/mailchimps-real-time-password-checker -->
  <v-layout justify-center>
    <v-dialog v-model="dialog" persistent max-width="800px">
      <v-card>
        <v-card-title>
          <span class="headline">Sign Out</span>
        </v-card-title>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="bule" @click="dialogCloseBack">
            Back
          </v-btn>
          <v-btn color="primary" @click="dialogSignOut">
            SignOut
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-layout>
</template>

<script>
import firebase from "firebase";

export default {
  data: () => ({
    dialog: true,
    successMessage: '',
  }),
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
  methods: {
    addRouteInfo: function (targetRouteInfo) {
      this.$store.commit('routeHistoryInfo/pushItem', targetRouteInfo)
    }
    ,removeRouteInfo: function (targetRouteInfo) {
      this.$store.commit('routeHistoryInfo/popItem', targetRouteInfo)
    },
    dialogCloseBack: function() {
      this.dialog = false;
      this.$router.push({ path: "/" });
    },
    dialogSignOut: function() {
      const firebaseConfig = require("/home/aine/CredentialFirebase-消しちゃダメ絶対/firebaseConfig.json");

      if (firebase.apps.length === 0) {
        // client.js?06a0:97 FirebaseError: Firebase: Firebase App named '[DEFAULT]' already exists (app/duplicate-app)
        // https://stackoverflow.com/questions/43331011/firebase-app-named-default-already-exists-app-duplicate-app
        firebase.initializeApp(firebaseConfig);
      }

      firebase
        .auth()
        .signOut()
        .then(() => {
          this.$store.commit('userInfo/signOut', this.$store.state.userInfo.signInUserInfo)
          this.dialog = false;
          this.$router.push({ path: "/" });
        })
        .catch(error => {
          console.log(error)
        });
    }
  }
};
</script>
