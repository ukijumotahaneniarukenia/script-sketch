- IN

```
$cat a.json | jq
{
  "key": "user-paginatedArticleLikes-items-39-article-uuid",
  "value": "0a0f00dfdddc8ce27f29"
}
{
  "key": "user-paginatedArticleLikes-items-39-article-title",
  "value": "GitLab をインストールしよう! (omnibus package)"
}
{
  "key": "user-paginatedArticleLikes-items-39-article-tags-0-name",
  "value": "GitLab"
}
{
  "key": "user-paginatedArticleLikes-items-39-article-tags-0-urlName",
  "value": "gitlab"
}
{
  "key": "user-paginatedArticleLikes-items-39-article-author-urlName",
  "value": "masakura"
}
```

- CMD

```
$cat a.json | jq 'select(.key| test("tags"))'
```


- OUT

```
{
  "key": "user-paginatedArticleLikes-items-39-article-tags-0-name",
  "value": "GitLab"
}
{
  "key": "user-paginatedArticleLikes-items-39-article-tags-0-urlName",
  "value": "gitlab"
}
```

- CMD

```
$cat a.json | jq 'select(.key| test("tags")|not)'
```


- OUT

```
{
  "key": "user-paginatedArticleLikes-items-39-article-uuid",
  "value": "0a0f00dfdddc8ce27f29"
}
{
  "key": "user-paginatedArticleLikes-items-39-article-title",
  "value": "GitLab をインストールしよう! (omnibus package)"
}
{
  "key": "user-paginatedArticleLikes-items-39-article-author-urlName",
  "value": "masakura"
}
```
