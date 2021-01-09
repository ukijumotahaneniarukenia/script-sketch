<template>
  <v-container id="welcome-form">
    <form>
      <v-layout style="justify-content: center;">
        <v-text-field
          v-model="name"
          :success-messages="successName"
          :error-messages="errorName"
          :counter="10"
          label="お名前"
          required
          @input="$v.name.$touch()"
          @blur="$v.name.$touch()"
        ></v-text-field>
      </v-layout>
      <v-layout style="justify-content: center;">
        <v-text-field
          v-model="email"
          :success-messages="successEmail"
          :error-messages="errorEmail"
          label="メールアドレス"
          required
          @input="$v.email.$touch()"
          @blur="$v.email.$touch()"
        ></v-text-field>
      </v-layout>
      <v-layout style="justify-content: center;">
        <v-text-field
          id="password"
          v-model="password"
          :success-messages="successPassword"
          :error-messages="errorPassword"
          :counter="32"
          type="password"
          label="パスワード"
          required
          @input="$v.password.$touch()"
          @blur="$v.password.$touch()"
        ></v-text-field>
        <v-icon id="password-icon" style="margin-left: 5px;">mdi-eye-off</v-icon>
      </v-layout>
      <v-layout style="justify-content: center;margin-top:20px;margin-bottom:20px;">
        <v-progress-linear v-model="passwordStretchPercent" :color="passwordStretchColor"></v-progress-linear>
      </v-layout>
      <v-layout id="password-requirements" nowrap style="justify-content: center;">
        <v-flex>
          <ul>
            <li class="password-requirements-list-desktop">
              <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
              1文字以上の小文字半角英字
            </li>
            <li class="password-requirements-list-desktop">
              <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
              1文字以上の大文字半角英字
            </li>
            <li class="password-requirements-list-desktop">
              <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
              1文字以上の半角数字
            </li>
          </ul>
        </v-flex>
        <v-flex>
          <ul>
            <li class="password-requirements-list-desktop">
              <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
              1文字以上の特殊記号 ex.) @#$%^&+=_- のいずれか
            </li>
            <li class="password-requirements-list-desktop">
              <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
              8文字以上かつ32文字以下の文字数
            </li>
          </ul>
        </v-flex>
      </v-layout>
      <v-layout style="justify-content: center;">
        <v-btn
          class="mr-4"
          @click="submit"
          style="color: #ffffff;background-color: #007C89"
        >
          submit
        </v-btn>
      </v-layout>
    </form>
  </v-container>
</template>

<script>
import Vue from "vue";
import Vuelidate from "vuelidate";
Vue.use(Vuelidate);

import { validationMixin } from "vuelidate";
import { required, minLength, maxLength } from "vuelidate/lib/validators";

export default {
  data: () => ({
    name: "",
    email: "",
    password: "",
    passwordStretchPercent: 10,
    passwordStretchColor: "pink"
  }),

  validations: {
    name: { required, maxLength: maxLength(10) },
    email: { required },
    password: { required, minLength: minLength(8), maxLength: maxLength(32) }
  },

  computed: {
    errorName() {
      const errorList = [];
      console.log(this.$v.name.$dirty);
      if (!this.$v.name.$dirty) return errorList;
      !this.$v.name.required && errorList.push("お名前は必須入力です");
      !this.$v.name.maxLength &&
        errorList.push("お名前は10文字以下で入力してください");
      return errorList;
    },
    errorEmail() {
      const errorList = [];
      if (!this.$v.email.$dirty) return errorList;
      !this.$v.email.required && errorList.push("メールアドレスは必須入力です");
      if (!/.*@.*/.test(this.$v.email.$model)) {
        errorList.push("メールアドレスの形式が異なります。");
      }
      return errorList;
    },
    errorPassword() {
      const errorList = [];
      if (!this.$v.password.$dirty) return errorList;
      !this.$v.password.required && errorList.push("パスワードは必須入力です");
      !this.$v.password.minLength &&
        errorList.push("パスワードは8文字以上で入力してください");
      !this.$v.password.maxLength &&
        errorList.push("パスワードは32文字以下で入力してください");
      return errorList;
    },
    successName() {
      const successList = [];
      if (0 < this.$v.name.$model.length && this.$v.name.$model.length <= 10) {
        successList.push("Great Name");
      }
      return successList;
    },
    successEmail() {
      const successList = [];
      if (/.+@.+/.test(this.$v.email.$model)) {
        // ガチガチにしなくていい。受信チェックではじく。
        successList.push("Nice Email");
      }
      return successList;
    },
    successPassword() {
      const successList = [];
      if (
        /^.*(?=.{8,32})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=_-]).*$/.test(
          this.$v.password.$model
        )
      ) {
        successList.push("Nice Password");
      }
      return successList;
    }
  },

  mounted() {
    this.setViewport();
    this.detectPassword();
    this.passwordShowHideControll();
  },

  methods: {
    passwordShowHideControll(targetPasswordShowIconName) {
      const targetPasswordInputDom = document.getElementById('password')

      const targetPasswordIcon = document.getElementById('password-icon')

      targetPasswordIcon.addEventListener('click', (e) => {
        if ('text' === targetPasswordInputDom.getAttribute('type')) {

          targetPasswordInputDom.setAttribute('type', 'password')

          targetPasswordIcon.setAttribute('class', 'v-icon notranslate mdi mdi-eye-off theme--light')

        } else {

          targetPasswordInputDom.setAttribute('type', 'text')

          targetPasswordIcon.setAttribute('class', 'v-icon notranslate mdi mdi-eye theme--light')

        }
      })
    },
    detectPassword() {
      const targetDom = document.getElementById('password')
      targetDom.addEventListener('keyup', (e) => {
        console.log(e)
      })
      targetDom.addEventListener('blur', (e) => {
        console.log(e)
      })
    },
    setViewport() {
      const targetDom = document.getElementById("welcome-form");
      const targetPasswordRequirementDom = document.getElementById("password-requirements");
      const viewport = document.documentElement.clientWidth;
      if (1200 <= viewport) {
        targetDom.setAttribute("style", "width: 40%");
      }
      if (viewport < 800 && viewport < 1200) {
        targetDom.setAttribute("style", "width: 50%");
      }
      if (viewport < 400 && viewport <= 800) {
        targetDom.setAttribute("style", "width: 80%");
        targetPasswordRequirementDom.setAttribute("class", "layout wrap")
        Array.from(document.querySelectorAll('li')).map((item) => {
          item.setAttribute("class", "password-requirements-list-mobile")
        })
      }
      if (viewport <= 400) {
        targetDom.setAttribute("style", "width: 90%");
        targetPasswordRequirementDom.setAttribute("class", "layout wrap")
        Array.from(document.querySelectorAll('li')).map((item) => {
          item.setAttribute("class", "password-requirements-list-mobile")
        })
      }
    },
    submit() {
      console.log(this.$v.$invalid);
      if (!this.$v.$invalid) {
        console.log("valid form input");
      }
    }
  }
};
</script>

<style>
li {
  list-style: none;
}

.password-requirements-list-desktop {
  font-size: 16px;
  font-family: "Graphik Web", "Helvetica Neue", Helvetica, Arial, Verdana,
    sans-serif;
  vertical-align: baseline;
  margin-bottom: 2px;
}

.password-requirements-list-mobile {
  font-size: 10px;
  font-family: "Graphik Web", "Helvetica Neue", Helvetica, Arial, Verdana,
    sans-serif;
  vertical-align: baseline;
  margin-bottom: 2px;
}

</style>
