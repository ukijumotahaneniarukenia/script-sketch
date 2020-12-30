<template>
  <v-layout justify-center>
    <v-dialog v-model="dialog" persistent max-width="800px">
      <v-card>
        <v-card-title>
          <span class="headline">Sign Up</span>
        </v-card-title>
        <v-card-title v-if="errorMessage !== undefined || errorMessage !== ''">
          <span class="pink--text">{{ errorMessage }}</span>
        </v-card-title>
        <v-form ref="form" v-model="valid" lazy-validation>
          <v-card-text>
            <v-container grid-list-md>
              <v-layout wrap>
                <v-flex md6>
                  <v-text-field
                    v-model="firstName"
                    :rules="firstNameRules"
                    label="First Name*"
                    required
                  ></v-text-field>
                </v-flex>
                <v-flex md6>
                  <v-text-field
                    v-model="lastName"
                    :rules="lastNameRules"
                    label="Last Name*"
                    required
                  ></v-text-field>
                </v-flex>
                <v-flex xs12>
                  <v-text-field
                    v-model="email"
                    :rules="emailRules"
                    label="E-mail"
                    required
                  ></v-text-field>
                </v-flex>
                <v-flex xs12>
                  <v-text-field
                    id="password"
                    v-model="password"
                    :rules="passwordRules"
                    label="Password*"
                    type="password"
                    required
                  >
                  </v-text-field>
                  <v-btn @click="switchVisibility()">
                    <span class="passwordIconWrapper">
                      <v-icon class="passwordIcon">
                        mdi-eye-off
                      </v-icon>
                    </span>
                  </v-btn>
                </v-flex>
                <v-flex xs6>
                  <ul>
                    <li>One lowercase character</li>
                    <li>One uppercase character</li>
                  </ul>
                </v-flex>
                <v-flex xs6>
                  <ul>
                    <li>One Number</li>
                    <li>One Special character</li>
                    <li>8 characters minimum</li>
                  </ul>
                </v-flex>
              </v-layout>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="bule" @click="dialogCloseBack">
              Back
            </v-btn>
            <v-btn color="warning" @click="reset">
              Clear
            </v-btn>
            <v-btn color="primary" @click="dialogSignUp">
              Sign Up
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card>
    </v-dialog>
  </v-layout>
</template>

<script>
import firebase from "firebase";

export default {
  data: () => ({
    valid: true,
    dialog: true,
    successMessage: '',
    errorMessage: '',
    firstName: "",
    firstNameRules: [v => !!v || "FirstName is required"],
    lastName: "",
    lastNameRules: [v => !!v || "LastName is required"],
    email: "",
    emailRules: [
      v => !!v || "E-mail is required",
      v => /.+@.+\..+/.test(v) || "E-mail must be valid"
    ],
    password: "",
    passwordRules: [
      v => !!v || "Password is required",
      v => /.{8,}/.test(v) || "Password is over 8 characters"
    ]
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
    reset : function () {
      this.errorMessage = ''
      this.$refs.form.reset()
    },
    dialogCloseBack: function() {
      this.dialog = false;
      this.$router.push({ path: "/" });
    },
    dialogSignUp: function() {
      if (this.$refs.form.validate()) {
        const firebaseConfig = require("/home/aine/CredentialFirebase-消しちゃダメ絶対/firebaseConfig.json");

        if (firebase.apps.length === 0) {
          // client.js?06a0:97 FirebaseError: Firebase: Firebase App named '[DEFAULT]' already exists (app/duplicate-app)
          // https://stackoverflow.com/questions/43331011/firebase-app-named-default-already-exists-app-duplicate-app
          firebase.initializeApp(firebaseConfig);
        }
        firebase
          .auth()
          .createUserWithEmailAndPassword(this.email, this.password)
          .then(user => {
            // https://firebase.google.com/docs/auth/web/manage-users#get_the_currently_signed-in_user
            // console.log(firebase.auth().currentUser.email)
            // console.log(firebase.auth().currentUser.uid)

            // https://firebase.google.com/docs/auth/admin/verify-id-tokens?hl=ja#retrieve_id_tokens_on_clients
            firebase
              .auth()
              .currentUser
              .getIdToken(/* forceRefresh */ true)
              .then((idToken) => {
                const loginUserInfo = {
                  email: firebase.auth().currentUser.email,
                  uid: firebase.auth().currentUser.uid,
                  firebaseIdToken: idToken
                }
                // console.log(idToken)
                this.$store.commit('userInfo/signIn', loginUserInfo)
              }).catch((error) => {
                console.log(error)
              });
          })
          .catch(error => {
            console.log(error)
            this.errorMessage = '既にアカウントをお持ちかもしれません'
          });
        this.dialog = false;
        this.$router.push({ path: "/" });
      }
    },
    switchVisibility: function() {
      const passwordField = document.querySelector("#password");
      const passwordIconWrapper = document.querySelector(
        ".passwordIconWrapper"
      );
      const passwordIcon = document.querySelector(".passwordIcon");
      const newIconDom = document.createElement("i");

      if (passwordField.getAttribute("type") === "password") {
        passwordField.setAttribute("type", "text");
        passwordIcon.remove();
        newIconDom.setAttribute("aria-hidden", "true");
        newIconDom.setAttribute(
          "class",
          "v-icon notranslate passwordIcon mdi mdi-eye theme--light"
        );
        passwordIconWrapper.appendChild(newIconDom);
      } else {
        passwordField.setAttribute("type", "password");
        passwordIcon.remove();
        newIconDom.setAttribute("aria-hidden", "true");
        newIconDom.setAttribute(
          "class",
          "v-icon notranslate passwordIcon mdi mdi-eye-off theme--light"
        );
        passwordIconWrapper.appendChild(newIconDom);
      }
    }
  }
};
</script>
