#!/bin/bash

gpg --decrypt --output text.txt text.txt.gpg
gpg -dq text.txt.gpg > text.txt
