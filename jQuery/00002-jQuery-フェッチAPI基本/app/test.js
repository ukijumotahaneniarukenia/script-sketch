window.onload = function(){

    let targetHookDom = document.querySelector('.my-img')

    let requestImageFileNameSuccess = 'flowers.jpg'
    let requestImageFileNameFail = 'flowers.jpppppppppppppppg'

    requestImageFileName = requestImageFileNameSuccess

    //ローカルホストのデータベースサーバ
    fetch(requestImageFileName)

    .then(function(response) {
        if(!response.ok){
            throw new Error('[HTTP Error Status]='+response.status)
        }
        return response.blob();
    })

    .then(function(blobData) {


        let blobDataUrl = URL.createObjectURL(blobData)

        targetHookDom.src =blobDataUrl


    })

    .catch(function(error) {
        let errorMsgDom = document.createElement('p');

        errorMsgDom.appendChild(
            document.createTextNode('[Error]=' + error.message)
        )

        document.body.insertBefore(errorMsgDom,targetHookDom)
    })

}
