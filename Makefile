all: setenv serve

publish:
	./bin/publish.sh
	@echo "Done!"
	@echo "-----"

setenv:
	/Users/rakhim/bin/ec /Users/rakhim/code/rakhim.org/content-org/blog.org && git pull --rebase && open "http://localhost:1313/"

serve:
	hugo server -D --navigateToChanged
