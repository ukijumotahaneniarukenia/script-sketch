<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left" width="50">userId</th>
          <th class="text-left">Name</th>
          <th width="200"></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="userData in userDataList" :key="userData.userId">
          <td class="text-right">{{ userData.userId }}</td>
          <td>{{ userData.name }}</td>
          <v-btn color="primary" small :to="`/users/${userData.userId}`">
            <v-icon left>mdi-account-details</v-icon>
            詳細
          </v-btn>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script>
export default {
  name: "index",
  data() {
    return {
      userDataList: [
        { userId: "tPIP6vkmCDxLwKEdaamk86zBEFstyvDL", name: "サウナ" },
        { userId: "uTt2MAoUkWIpgnsRjbqgx5AxbOAkMcce", name: "ツバナ" },
        { userId: "hxSaoWhb4SsLwfu6ommFdojn0saA3mDB", name: "ヨメナ" }
      ]
    };
  }
};
</script>
