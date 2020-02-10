<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>upload-view</title>
</head>
<body>
    <table>
        <c:forEach items="${model.download-file-list}" var="item" >
            <tr>
              <td><c:out value="${item.name}" /></td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>