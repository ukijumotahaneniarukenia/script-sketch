<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left" width="50">menuId</th>
          <th class="text-left">Name</th>
          <th class="text-left" width="50">subMenuId</th>
          <th width="200"></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="menuData in menuDataList" :key="menuData.menuId+menuData.subMenuId">
          <td class="text-right">{{ menuData.menuId }}</td>
          <td>{{ menuData.name }}</td>
          <td class="text-right">{{ menuData.subMenuId }}</td>
          <td>
            <v-btn
              color="primary"
              small
              :to="`/menu/${menuData.menuId}/subMenu/${menuData.subMenuId}`"
            >
              <v-icon left>mdi-account-details</v-icon>
              フラット遷移
            </v-btn>
          </td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script>
export default {
  name: "menuDataDetails",
  data() {
    return {
      menuDataList: [
        {
          name: "サウナ",
          menuId: "tPIP6vkmCDxLwKEdaamk86zBEFstyvDL",
          subMenuId: "yG9aAkwP56Wu9xkrh3nZ7YLZDpp3lbDP"
        },
        {
          name: "サウナ",
          menuId: "tPIP6vkmCDxLwKEdaamk86zBEFstyvDL",
          subMenuId: "DAvmhckr39kPCnWaudZQvDIxleF64vqs"
        },
        {
          name: "サウナ",
          menuId: "tPIP6vkmCDxLwKEdaamk86zBEFstyvDL",
          subMenuId: "SsAZyCy4zV4cgN1Mn2V4OYFjWLyHrhZZ"
        },
        {
          name: "ヨメナ",
          menuId: "hxSaoWhb4SsLwfu6ommFdojn0saA3mDB",
          subMenuId: "VxBWXPxwPYxBY12OEWgJPaycpPnaJKA0"
        },
        {
          name: "ヨメナ",
          menuId: "hxSaoWhb4SsLwfu6ommFdojn0saA3mDB",
          subMenuId: "pNGAzTWlD8r1ORqZl5jno9kpk5YATQLn"
        },
        {
          name: "ヨメナ",
          menuId: "hxSaoWhb4SsLwfu6ommFdojn0saA3mDB",
          subMenuId: "MxtMvsOxqxcHzrGybn5SgXkkNukM38ck"
        },
        {
          name: "ツバナ",
          menuId: "uTt2MAoUkWIpgnsRjbqgx5AxbOAkMcce",
          subMenuId: "MfthXuYddkFi9nLHdqyDA4o0fyDE9McZ"
        },
        {
          name: "ツバナ",
          menuId: "uTt2MAoUkWIpgnsRjbqgx5AxbOAkMcce",
          subMenuId: "rCTl6cKPXVdVTTgPwtRz4ZJ6whYJxqp8"
        },
        {
          name: "ツバナ",
          menuId: "uTt2MAoUkWIpgnsRjbqgx5AxbOAkMcce",
          subMenuId: "wEEZyCIy9RI2bElDUfCTUB2P21gG2aG3"
        }
      ].filter(item => {return item.menuId == this.$route.params.menuId})
    };
  },
  computed: {
    menuId() {
      return this.$route.params.menuId;
    },
    subMenuId() {
      return this.$route.params.subMenuId;
    }
  }
};
</script>
