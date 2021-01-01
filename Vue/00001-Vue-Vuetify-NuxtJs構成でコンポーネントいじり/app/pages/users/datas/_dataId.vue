<template>
  <div>
    <div>/users/datas/{{ dataId }}</div>
    <p>Item</p>
    <p>{{ item }}</p>
    <p>UserId</p>
    <p>{{ userId }}</p>
    <p>localStorageItem</p>
    <p>{{ localStorageItemUnko }}</p>
    <p>{{ localStorageItemMoriMori }}</p>
    <p>{{ localStorageItemMoriOugai }}</p>
  </div>
</template>
<script>
export default {
  name: "UserDataDetails",
  data() {
    return {
      userId: '',
      item : '',
      localStorageItemUnko: '',
      localStorageItemMoriMori: '',
      localStorageItemMoriOugai: '',
    }
  },
  created() {
    this.setItem()
    console.log(this.$route.query)
    console.log(this.$route.query.userId)
    this.userId = this.$route.query.userId
    this.item = this.$route.query.item
  },
  methods: {
    setItem(){
      this.localStorageItemUnko = window.localStorage.getItem('unko')
      this.localStorageItemMoriMori = window.localStorage.getItem('morimori')
      this.localStorageItemMoriOugai = window.localStorage.getItem('moriougai')
      window.localStorage.clear()
    }
  },
  computed: {
    // userId() {
    //   return this.$route.params.userId;
    // },
    dataId() {
      return this.$route.params.dataId;
    }
  }
};
</script>
