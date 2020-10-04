#!/usr/bin/env bash

mkdir -p metainfo

INPUT_DIR_NAME=output
OUTPUT_DIR_NAME=metainfo

ls $INPUT_DIR_NAME/*json | \

  while read file;do

    OUTPUT_FILE_NAME=$(echo $file | sed "s;$INPUT_DIR_NAME/;;g" | sed -r 's/json/tsv/g')

    cat $file | jq -r '. as $in | "versions" as $version_main_path | ($in|.time|to_entries|map(select(.key != "modified" and .key != "created"))) as $time_info | ($in|.versions|to_entries|map(.key as $version_sub_path|$in[$version_main_path][$version_sub_path]|.version as $version|[.name,.version,."description",."license",."repository"."url",."author"."name",."author"."email",."author"."url",."_npmVersion",."_nodeVersion",."dist"."shasum",."dist"."tarball",($time_info|map(select(.key==$version))[].value)]))[]|@tsv' | \
    sed '1i.name\t.version\t.description\t.license\t.repository.url\t.author.name\t.author.email\t.author.url\t._npmVersion\t._nodeVersion\t.dist.shasum\t.dist.tarball\ttime' >$OUTPUT_DIR_NAME/$OUTPUT_FILE_NAME

  done
