This is primarily for myself.

## Theme

Custom theme for this blog is called `ra`. Contrary to Hugo conventions, I do not keep my theme flexible and reusable. It is hardcoded for my particular website and I make all layout and templating changes in the theme directly. It is not stored in a git submodule.

## Sections

There are 2 sections on the website:

1. `blog`
2. `honestly-undefined`

Their sources are in corresponding org-files in the `content-org` folder. The rendered markdown files are stored in the `content` folder. All lists of content explicitly use either both or one of these sections.

## Lists of content

There are 4 lists of content:

1. `themes/ra/layouts/index.html` — front page.
2. `themes/ra/_default/archive.html` — archive page.
3. `themes/ra/layouts/honestly-undefined/list.html` — web comic.
4. `themes/ra/_default/rss.xml` — RSS.
