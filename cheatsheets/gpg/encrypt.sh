#!/bin/bash

gpg --encrypt --default-recipient-self text.txt
gpg -er YOU text.txt
cat text.txt | gpg -er YOU > text.txt.gpg
