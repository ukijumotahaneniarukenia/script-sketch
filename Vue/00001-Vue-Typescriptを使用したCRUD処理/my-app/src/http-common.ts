import axios from "axios";

export default axios.create({
  baseURL: "http://localhost:8081/api", //ここを外部APIに書き換える　ないしは自前でREST鯖をローカル指定したポートで用意
  headers: {
    "Content-type": "application/json"
  }
});