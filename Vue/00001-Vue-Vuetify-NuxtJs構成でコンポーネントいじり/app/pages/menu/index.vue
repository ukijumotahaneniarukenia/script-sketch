<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left" width="50">menuId</th>
          <th class="text-left">Name</th>
          <th width="200"></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="menuData in menuDataList" :key="menuData.menuId">
          <td class="text-right">{{ menuData.menuId }}</td>
          <td>{{ menuData.name }}</td>
          <v-btn color="primary" small :to="`/menu/${menuData.menuId}`">
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
      menuDataList: [
        { menuId: "tPIP6vkmCDxLwKEdaamk86zBEFstyvDL", name: "サウナ" },
        { menuId: "uTt2MAoUkWIpgnsRjbqgx5AxbOAkMcce", name: "ツバナ" },
        { menuId: "hxSaoWhb4SsLwfu6ommFdojn0saA3mDB", name: "ヨメナ" }
      ]
    };
  }
};
</script>
