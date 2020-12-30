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
        <tr v-for="user in users" :key="user.userId">
          <td class="text-right">{{ user.userId }}</td>
          <td>{{ user.name }}</td>
          <v-btn color="primary" small :to="`/users/${user.userId}`">
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
      users: [
        { name: "サウナ", userId: "0Pd2R0JeQcjSibLNdRKiktmAG2TinaCW" },
        { name: "ヨメナ", userId: "HHVwUYZGoPvVNQy1y4lw72mMFIjGdtf6" },
        { name: "ツバナ", userId: "TylPxOhgUl2mqi2j45PKoKEHdRMTFkNb" },
        { name: "セミナ", userId: "NRecoBX2xpIkusBqnwuUbk2ZhJh8gdWA" },
        { name: "クイナ", userId: "G590skxxk4Fq5CBNnKD9u7QJg9LX2s7B" },
        { name: "ムジナ", userId: "gdZXnA5RsWKpw1lpqiPAhdqqpwQiFRIk" },
        { name: "スズナ", userId: "mXnxifywTqb6TszMA2nUajwVcWkCyjAJ" },
        { name: "コーナ", userId: "1MbJYdKwcscdk9e3JXGTkSoaRozN50UI" },
        { name: "ミズナ", userId: "zPRyVIr2ft5NFLZku3bmdK8BQHy2QbMY" },
        { name: "セスナ", userId: "esvVppICT9F66l3qK1jXw2IlUOA745w8" },
        { name: "ツルナ", userId: "FQI4qIDGKDCJyhmLPd0ivJHHeYdWlWX3" },
        { name: "タマナ", userId: "bVHAeCnPHRa0GNBDbjEnafMoWjP6QLJp" },
        { name: "ワギナ", userId: "kgC7SXRLqT0V0RIIR4Jue91cRL8g9tsb" },
        { name: "カンナ", userId: "YtXWD5iZDz34jSBRvwdOAevxHj9apQZk" },
        { name: "イワナ", userId: "d93F4C1QRFbgE9LjghLQQSoH0VnTsKN4" },
        { name: "サカナ", userId: "VRVfzLSjeMsoHquyExbLesGWxSZIKy2i" },
        { name: "バナナ", userId: "K5DutL8AHttT6NxfZCwayL5rBhmtZDyM" },
        { name: "スギナ", userId: "kbUXpuhZvqDlqH0o7oJXBdX41NYsMCgl" },
        { name: "タカナ", userId: "z0gJjHEZUfiLo2BTki6gx6vBhvwkAaC1" },
        { name: "メバナ", userId: "gfGQxUEtXHYBYmhgWA4keG0Oo2gdOhfA" },
      ],
    };
  },
};
</script>
