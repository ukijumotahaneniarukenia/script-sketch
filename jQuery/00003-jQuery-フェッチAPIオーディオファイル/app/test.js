window.onload = function () {

    let audioContext = new AudioContext()

    let source

    let httpStatusMessage = '[HTTP Error Status]='

    let requestFileName = 'tampi06.ogg'

    let pre = document.querySelector('pre')
    let myScript = document.querySelector('script')
    let play = document.querySelector('.play')
    let stop = document.querySelector('.stop')
    let errorDisplay = document.querySelector('.error')


    // audio binary data into buffer
    function getData() {
        source = audioContext.createBufferSource()

        return fetch(requestFileName)

            .then(function (response) {
                if (!response.ok) {
                    throw new Error(httpStatusMessage + response.status)
                }
                return response.arrayBuffer()
            })

            .then(function (buffer) {

                audioContext.decodeAudioData(buffer, function (decodedData) {

                    source.buffer = decodedData

                    source.connect(audioContext.destination)

                })
            })
    }

    // event define
    play.onclick = function () {
        getData()

            .then(function () {
                errorDisplay.innerHTML = '' // init
                source.start(0) // init
                play.disabled = true  // init
            })

            .catch(function (error) {

                errorDisplay.appendChild(
                    document.createTextNode('Error: ' + error.message)
                )

            })
    }


    stop.onclick = function () {
        source.stop(0); // init
        play.disabled = false; // init
    };


    // pre.innerHTML = myScript.innerHTML





    // console.log(audioContext)





}
