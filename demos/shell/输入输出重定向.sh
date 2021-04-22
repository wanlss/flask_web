#!/usr/bin/env bash
# 覆盖重定向
date > date.log

# 追加重定向
who >> who.log
date >> who.log

