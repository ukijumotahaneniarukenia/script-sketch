package main

import (
	"fmt"

  //a "github.com/ukijumotahaneniarukenia/go-repo/XXXXX-go-マイスペ" //ng
  //b "github.com/ukijumotahaneniarukenia/go-repo/XXXXX_go_mysp" //ng
  //c "github.com/ukijumotahaneniarukenia/go-repo/XXXXX-go-mysp" //ng
  d "github.com/ukijumotahaneniarukenia/go-repo/xxxxx_go_mysp" //ok
  //e "github.com/ukijumotahaneniarukenia/go-repo/xxxxx-go-mysp" //ng

  Nnn "github.com/ukijumotahaneniarukenia/go-repo/callee"
)

func main() {

  //a.Nnn_mMm_ppP() //関数呼び出し
  //b.Nnn_mMm_ppP() //関数呼び出し
  //c.Nnn_mMm_ppP() //関数呼び出し
  d.Nnn_mMm_ppP() //関数呼び出し
  //e.Nnn_mMm_ppP() //関数呼び出し

	fmt.Println(Nnn.MSG) //定数呼び出し
}
