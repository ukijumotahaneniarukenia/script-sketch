function formatDateTime(date, format) {
  format = format.replace(/yyyy/g, date.getFullYear());
  format = format.replace(/MM/g, ("0" + (date.getMonth() + 1)).slice(-2));
  format = format.replace(/dd/g, ("0" + date.getDate()).slice(-2));
  format = format.replace(/HH/g, ("0" + date.getHours()).slice(-2));
  format = format.replace(/mm/g, ("0" + date.getMinutes()).slice(-2));
  format = format.replace(/ss/g, ("0" + date.getSeconds()).slice(-2));
  format = format.replace(/SSS/g, ("00" + date.getMilliseconds()).slice(-3));
  return format;
}

async function getJsonData(targetUrl) {
  return fetch(targetUrl)
    .then((res) => {
      return res.json();
    })
    .then((data) => {
      return data;
    })
    .catch((res) => {
      console.log(res);
    });
}

async function download(targetDownloadData) {
  return new Promise((resolve) => {
    let timeStamp = formatDateTime(new Date(), "yyyy-MM-ddTHH-mm-ss");

    let blob = new Blob([JSON.stringify(targetDownloadData)], {
      type: "text/plain",
    });

    let url = URL.createObjectURL(blob);

    let a = document.createElement("a");

    document.body.appendChild(a);

    a.download = "xpath-info-" + timeStamp + ".json";

    a.href = url;

    a.click();

    a.remove();

    URL.revokeObjectURL(url);

    resolve(targetDownloadData);
  });
}

async function main(){
  let baseUrl = prompt("Input Url");

  let response = await fetch(baseUrl);

  let totalItems = Number.parseInt(response.headers.get("X-WP-Total"));
  let totalPages = Number.parseInt(response.headers.get("X-WP-TotalPages"));

  let perPage = Math.ceil(totalItems / totalPages);

  let result = [];
  for (let targetPage = 1; targetPage <= perPage; targetPage++) {
    let targetUrl = baseUrl + "?per_page=" + perPage + "&page=" + targetPage;
    console.log(targetUrl);
    let objectData = {
      page: targetPage,
      perPage: perPage,
      data: await getJsonData(targetUrl),
    };
    result.push(objectData);
  }

  download(result).then((data) => {
    console.log(data);
  });
}


main()
