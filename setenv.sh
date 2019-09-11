#!/bin/bash

/Users/rakhim/bin/ec /Users/rakhim/code/rakhim.org/content-org/blog.org
git pull --rebase
open http://localhost:1313/

hugo server -D --navigateToChanged
