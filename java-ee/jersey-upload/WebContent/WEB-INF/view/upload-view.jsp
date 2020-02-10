<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>upload-view</title>
</head>
<body>
    <form method="POST" action="/jersey-upload/api/post-multipart-file" enctype="multipart/form-data">
        <input type="file" name="file"/><br>
        <input type="submit" value="SUBMIT"/>
    </form>
</body>
</html>