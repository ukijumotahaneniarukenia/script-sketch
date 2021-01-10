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
        <v-icon id="password-icon" style="margin-left: 5px;"
          >mdi-eye-off</v-icon
        >
      </v-layout>
      <v-layout v-if="errorMessage !== ''" style="justify-content: center;">
        <span style="font-size: 12px;color: #EC407A">{{ errorMessage }}</span>
      </v-layout>
      <v-layout
        style="justify-content: center;margin-top:20px;margin-bottom:20px;"
      >
        <v-progress-linear
          v-model="passwordStretchPercent"
          :color="passwordStretchColor"
          v-if="passwordStretchPercent !== 0"
        ></v-progress-linear>
      </v-layout>
      <v-layout
        id="password-requirements"
        nowrap
        style="justify-content: center;"
      >
        <v-flex>
          <ul>
            <li
              id="lowercase-character-list"
              class="password-requirements-list-desktop password-requirements-list"
            >
              <v-icon id="lowercase-character-icon"
                >mdi-checkbox-blank-circle-outline</v-icon
              >
              <span id="lowercase-character-text"
                >1文字以上の小文字半角英字</span
              >
            </li>
            <li
              id="uppercase-character-list"
              class="password-requirements-list-desktop password-requirements-list"
            >
              <v-icon id="uppercase-character-icon"
                >mdi-checkbox-blank-circle-outline</v-icon
              >
              <span id="uppercase-character-text"
                >1文字以上の大文字半角英字</span
              >
            </li>
            <li
              id="number-character-list"
              class="password-requirements-list-desktop password-requirements-list"
            >
              <v-icon id="number-character-icon"
                >mdi-checkbox-blank-circle-outline</v-icon
              >
              <span id="number-character-text">1文字以上の半角数字</span>
            </li>
          </ul>
        </v-flex>
        <v-flex>
          <ul>
            <li
              id="special-character-list"
              class="password-requirements-list-desktop password-requirements-list"
            >
              <v-icon id="special-character-icon"
                >mdi-checkbox-blank-circle-outline</v-icon
              >
              <span id="special-character-text">1文字以上の特殊記号</span>
            </li>
            <li
              id="count-character-list"
              class="password-requirements-list-desktop password-requirements-list"
            >
              <v-icon id="count-character-icon"
                >mdi-checkbox-blank-circle-outline</v-icon
              >
              <span id="count-character-text"
                >8文字以上かつ32文字以下の文字数</span
              >
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
    errorMessage: "",
    name: "",
    email: "",
    password: "",
    passwordStretchPercent: 0,
    passwordStretchColor: "",
    lowercaseCharacter: [],
    uppercaseCharacter: [],
    specialCharacter: [],
    numberCharacter: [],
    satisfiedPasswordPatternObject: {}
  }),

  validations: {
    name: { required, maxLength: maxLength(10) },
    email: { required },
    password: { required, minLength: minLength(8), maxLength: maxLength(32) }
  },

  computed: {
    errorName() {
      const errorList = [];
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
        errorList.push("メールアドレスの形式が異なります");
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
        // ガチガチにしなくていい受信チェックではじく
        successList.push("Nice Email");
      }
      return successList;
    },
    successPassword() {
      const successList = [];
      switch (this.passwordStretchPercent) {
        case 100:
          successList.push("Nice Password");
          break;
        default:
          break;
      }
      return successList;
    }
  },

  mounted() {
    this.setViewport();
    this.detectPassword();
    this.passwordShowHideControll();
    this.detectWindowSize();
  },

  created() {
    this.initilize();
  },

  methods: {
    detectWindowSize() {
      window.addEventListener('resize', e=>{
        this.setViewport();
      })
    },
    setLowercaseCharacter() {
      return this.range(97, 122).map(e => {
        return String.fromCodePoint(e);
      });
    },
    setUppercaseCharacter() {
      return this.range(65, 90).map(e => {
        return String.fromCodePoint(e);
      });
    },
    setSpecialCharacter() {
      return this.range(33, 47)
        .map(e => {
          return String.fromCodePoint(e);
        })
        .concat(
          this.range(58, 64).map(e => {
            return String.fromCodePoint(e);
          })
        )
        .concat(
          this.range(91, 96).map(e => {
            return String.fromCodePoint(e);
          })
        )
        .concat(
          this.range(123, 126).map(e => {
            return String.fromCodePoint(e);
          })
        );
    },
    setNumberCharacter() {
      return this.range(48, 57).map(e => {
        return String.fromCodePoint(e);
      });
    },
    initilize() {
      this.lowercaseCharacter = this.setLowercaseCharacter();
      this.uppercaseCharacter = this.setUppercaseCharacter();
      this.specialCharacter = this.setSpecialCharacter();
      this.numberCharacter = this.setNumberCharacter();
    },
    range(s, e) {
      return Array.from(Array(e - s + 1), (v, i) => s + i);
    },
    passwordShowHideControll(targetPasswordShowIconName) {
      const targetPasswordInputDom = document.getElementById("password");

      const targetPasswordIcon = document.getElementById("password-icon");

      targetPasswordIcon.addEventListener("click", e => {
        if ("text" === targetPasswordInputDom.getAttribute("type")) {
          targetPasswordInputDom.setAttribute("type", "password");

          targetPasswordIcon.setAttribute(
            "class",
            "v-icon notranslate mdi mdi-eye-off theme--light"
          );
        } else {
          targetPasswordInputDom.setAttribute("type", "text");

          targetPasswordIcon.setAttribute(
            "class",
            "v-icon notranslate mdi mdi-eye theme--light"
          );
        }
      });
    },
    isValidPasswordCharacterCount(targetPasswordInputCharacter) {
      return (
        8 <= targetPasswordInputCharacter.length &&
        targetPasswordInputCharacter.length <= 32
      );
    },
    isValidPasswordCharacter(
      targetPasswordInputCharacter,
      targetValidPasswordCharacterList
    ) {
      const satisfiedPasswordCharacterList = [
        ...targetPasswordInputCharacter
      ].filter(item => {
        return (
          JSON.parse(JSON.stringify(targetValidPasswordCharacterList)).indexOf(
            item
          ) !== -1
        );
      });
      return satisfiedPasswordCharacterList.length !== 0;
    },
    getInvalidPasswordCharacterList(
      targetPasswordInputCharacter,
      targetValidPasswordCharacterList
    ) {
      const nonSatisfiedPasswordCharacterList = [
        ...targetPasswordInputCharacter
      ].filter(item => {
        return (
          JSON.parse(JSON.stringify(targetValidPasswordCharacterList)).indexOf(
            item
          ) === -1
        );
      });
      return nonSatisfiedPasswordCharacterList;
    },
    setPasswordStretchPercentColor(targetSatisfiedPasswordPatternPercent) {
      switch (targetSatisfiedPasswordPatternPercent) {
        case 0:
          break;
        case 20:
          this.passwordStretchColor = "pink lighten-5";
          break;
        case 40:
          this.passwordStretchColor = "lime lighten-4";
          break;
        case 60:
          this.passwordStretchColor = "teal lighten-3";
          break;
        case 80:
          this.passwordStretchColor = "light-green lighten-2";
          break;
        case 100:
          this.passwordStretchColor = "green lighten-1";
          break;
        default:
          break;
      }
    },
    setPasswordStretchPercent(targetSatisfiedPasswordPatternCount) {
      const satisfiedPasswordPatternAllCount = Array.from(
        document.getElementsByClassName("password-requirements-list")
      ).length;
      const satisfiedPasswordPatternPercent = Math.ceil(
        (targetSatisfiedPasswordPatternCount /
          satisfiedPasswordPatternAllCount) *
          100
      );
      return satisfiedPasswordPatternPercent;
    },
    switchPasswordRequirementsIcon(
      targetPasswordRequirementsName,
      targetIconName
    ) {
      const passwordRequirementsList = document.getElementById(
        targetPasswordRequirementsName + "-list"
      );
      const passwordRequirementsIcon = document.getElementById(
        targetPasswordRequirementsName + "-icon"
      );
      const passwordRequirementsText = document.getElementById(
        targetPasswordRequirementsName + "-text"
      );
      passwordRequirementsList.removeChild(passwordRequirementsIcon);
      const targetIcon = document.createElement("i");
      targetIcon.setAttribute("area-hidden", "true");
      targetIcon.setAttribute("id", targetPasswordRequirementsName + "-icon");
      if (targetIconName === "mdi-checkbox-marked-circle-outline") {
        targetIcon.setAttribute(
          "class",
          "v-icon notranslate mdi " +
            targetIconName +
            " green--text theme--light"
        );
      } else {
        targetIcon.setAttribute(
          "class",
          "v-icon notranslate mdi " + targetIconName + " theme--light"
        );
      }
      targetIcon.setAttribute("style", "margin-right: 5px");
      passwordRequirementsText.before(targetIcon);
    },
    setSatisfiedPasswordPatternObject() {
      if (
        this.isValidPasswordCharacter(this.password, this.lowercaseCharacter)
      ) {
        this.satisfiedPasswordPatternObject["lowercaseCharacter"] = true;
        this.switchPasswordRequirementsIcon(
          "lowercase-character",
          "mdi-checkbox-marked-circle-outline"
        );
      } else {
        this.satisfiedPasswordPatternObject["lowercaseCharacter"] = false;
        this.switchPasswordRequirementsIcon(
          "lowercase-character",
          "mdi-checkbox-blank-circle-outline"
        );
      }
      if (
        this.isValidPasswordCharacter(this.password, this.uppercaseCharacter)
      ) {
        this.satisfiedPasswordPatternObject["uppercaseCharacter"] = true;
        this.switchPasswordRequirementsIcon(
          "uppercase-character",
          "mdi-checkbox-marked-circle-outline"
        );
      } else {
        this.satisfiedPasswordPatternObject["uppercaseCharacter"] = false;
        this.switchPasswordRequirementsIcon(
          "uppercase-character",
          "mdi-checkbox-blank-circle-outline"
        );
      }
      if (this.isValidPasswordCharacter(this.password, this.specialCharacter)) {
        this.satisfiedPasswordPatternObject["specialCharacter"] = true;
        this.switchPasswordRequirementsIcon(
          "special-character",
          "mdi-checkbox-marked-circle-outline"
        );
      } else {
        this.satisfiedPasswordPatternObject["specialCharacter"] = false;
        this.switchPasswordRequirementsIcon(
          "special-character",
          "mdi-checkbox-blank-circle-outline"
        );
      }
      if (this.isValidPasswordCharacter(this.password, this.numberCharacter)) {
        this.satisfiedPasswordPatternObject["numberCharacter"] = true;
        this.switchPasswordRequirementsIcon(
          "number-character",
          "mdi-checkbox-marked-circle-outline"
        );
      } else {
        this.satisfiedPasswordPatternObject["numberCharacter"] = false;
        this.switchPasswordRequirementsIcon(
          "number-character",
          "mdi-checkbox-blank-circle-outline"
        );
      }
      if (this.isValidPasswordCharacterCount(this.password)) {
        this.satisfiedPasswordPatternObject["countCharacter"] = true;
        this.switchPasswordRequirementsIcon(
          "count-character",
          "mdi-checkbox-marked-circle-outline"
        );
      } else {
        this.satisfiedPasswordPatternObject["countCharacter"] = false;
        this.switchPasswordRequirementsIcon(
          "count-character",
          "mdi-checkbox-blank-circle-outline"
        );
      }
      const satisfiedPasswordPatternCount = Object.values(
        JSON.parse(JSON.stringify(this.satisfiedPasswordPatternObject))
      ).filter(item => {
        return item === true;
      }).length;
      this.passwordStretchPercent = this.setPasswordStretchPercent(
        satisfiedPasswordPatternCount
      );
    },
    setInvalidPasswordCharacterRemoveMessage() {
      const invalidPasswordCharacterList = this.getInvalidPasswordCharacterList(
        this.password,
        this.lowercaseCharacter
          .concat(this.uppercaseCharacter)
          .concat(this.specialCharacter)
          .concat(this.numberCharacter)
      );
      if (invalidPasswordCharacterList.length === 0) {
        this.errorMessage = "";
      } else {
        this.errorMessage =
          "パスワードに含めることができない文字があります。取り除いてください。 " +
          Array.from(new Set(invalidPasswordCharacterList)).join();
      }
    },
    detectPassword() {
      const targetDom = document.getElementById("password");
      targetDom.addEventListener("keyup", e => {
        this.setSatisfiedPasswordPatternObject();
        this.setPasswordStretchPercentColor(this.passwordStretchPercent);
        this.setInvalidPasswordCharacterRemoveMessage()
      });
      targetDom.addEventListener("blur", e => {
        this.setSatisfiedPasswordPatternObject();
        this.setPasswordStretchPercentColor(this.passwordStretchPercent);
        this.setInvalidPasswordCharacterRemoveMessage()
      });
    },
    setViewport() {
      const targetDom = document.getElementById("welcome-form");
      const targetPasswordRequirementDom = document.getElementById(
        "password-requirements"
      );
      const viewport = document.documentElement.clientWidth;
      if (1200 < viewport) {
        targetDom.setAttribute("style", "width: 50%");
        targetPasswordRequirementDom.setAttribute("class", "layout");
        Array.from(document.querySelectorAll("li")).map(item => {
          item.setAttribute(
            "class",
            "password-requirements-list-desktop password-requirements-list"
          );
        });
      }
      if (800 < viewport && viewport <= 1200) {
        targetDom.setAttribute("style", "width: 60%");
        Array.from(document.querySelectorAll("li")).map(item => {
          item.setAttribute(
            "class",
            "password-requirements-list-desktop password-requirements-list"
          );
        });
      }
      if (600 < viewport && viewport <= 800) {
        targetDom.setAttribute("style", "width: 80%");
        Array.from(document.querySelectorAll("li")).map(item => {
          item.setAttribute(
            "class",
            "password-requirements-list-mobile password-requirements-list"
          );
        });
      }
      if (400 < viewport && viewport <= 600) {
        targetDom.setAttribute("style", "width: 85%");
        targetPasswordRequirementDom.setAttribute("class", "layout wrap");
        Array.from(document.querySelectorAll("li")).map(item => {
          item.setAttribute(
            "class",
            "password-requirements-list-mobile password-requirements-list"
          );
        });
      }
      if (viewport <= 400) {
        targetDom.setAttribute("style", "width: 90%");
        targetPasswordRequirementDom.setAttribute("class", "layout wrap");
        Array.from(document.querySelectorAll("li")).map(item => {
          item.setAttribute(
            "class",
            "password-requirements-list-mobile password-requirements-list"
          );
        });
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
  font-size: 12px;
  font-family: "Graphik Web", "Helvetica Neue", Helvetica, Arial, Verdana,
    sans-serif;
  vertical-align: baseline;
  margin-bottom: 2px;
}
</style>
