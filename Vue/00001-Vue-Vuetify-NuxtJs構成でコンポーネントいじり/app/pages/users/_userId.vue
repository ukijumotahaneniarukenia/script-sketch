<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left" width="50">userId</th>
          <th class="text-left">Name</th>
          <th class="text-left" width="50">dataId</th>
          <th width="200"></th>
          <th width="200"></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="userData in userDataList" :key="userData.userId+userData.dataId">
          <td class="text-right">{{ userData.userId }}</td>
          <td>{{ userData.name }}</td>
          <td class="text-right">{{ userData.dataId }}</td>
          <v-btn
            color="primary"
            small
            @click="moveDataPage(userData.userId, userData.dataId)"
          >
            <v-icon left>mdi-account-details</v-icon>
            ネスト遷移
          </v-btn>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script>
export default {
  name: "UserDataDetails",
  methods: {
    moveDataPage(targetUserId, targetDataId){
      console.log('targetUserId:' ,targetUserId, 'targetDataId' ,targetDataId)
      window.localStorage.setItem('unko','うんこ')
      window.localStorage.setItem('morimori','もりもり')
      window.localStorage.setItem('moriougai','モリオウガイ')
      this.$router.push({ path: `datas/${targetDataId}`, query: { item: 'うんこ', 'userId': targetUserId }})
    }
  },
  data() {
    return {
      userDataList: [
        {
          name: "サウナ",
          userId: "tPIP6vkmCDxLwKEdaamk86zBEFstyvDL",
          dataId: "yG9aAkwP56Wu9xkrh3nZ7YLZDpp3lbDP"
        },
        {
          name: "サウナ",
          userId: "tPIP6vkmCDxLwKEdaamk86zBEFstyvDL",
          dataId: "DAvmhckr39kPCnWaudZQvDIxleF64vqs"
        },
        {
          name: "サウナ",
          userId: "tPIP6vkmCDxLwKEdaamk86zBEFstyvDL",
          dataId: "SsAZyCy4zV4cgN1Mn2V4OYFjWLyHrhZZ"
        },
        {
          name: "ヨメナ",
          userId: "hxSaoWhb4SsLwfu6ommFdojn0saA3mDB",
          dataId: "VxBWXPxwPYxBY12OEWgJPaycpPnaJKA0"
        },
        {
          name: "ヨメナ",
          userId: "hxSaoWhb4SsLwfu6ommFdojn0saA3mDB",
          dataId: "pNGAzTWlD8r1ORqZl5jno9kpk5YATQLn"
        },
        {
          name: "ヨメナ",
          userId: "hxSaoWhb4SsLwfu6ommFdojn0saA3mDB",
          dataId: "MxtMvsOxqxcHzrGybn5SgXkkNukM38ck"
        },
        {
          name: "ツバナ",
          userId: "uTt2MAoUkWIpgnsRjbqgx5AxbOAkMcce",
          dataId: "MfthXuYddkFi9nLHdqyDA4o0fyDE9McZ"
        },
        {
          name: "ツバナ",
          userId: "uTt2MAoUkWIpgnsRjbqgx5AxbOAkMcce",
          dataId: "rCTl6cKPXVdVTTgPwtRz4ZJ6whYJxqp8"
        },
        {
          name: "ツバナ",
          userId: "uTt2MAoUkWIpgnsRjbqgx5AxbOAkMcce",
          dataId: "wEEZyCIy9RI2bElDUfCTUB2P21gG2aG3"
        }
      ].filter(item => {return item.userId == this.$route.params.userId})
    };
  },
  computed: {
    userId() {
      return this.$route.params.userId;
    },
    dataId() {
      return this.$route.params.dataId;
    }
  }
};
</script>
